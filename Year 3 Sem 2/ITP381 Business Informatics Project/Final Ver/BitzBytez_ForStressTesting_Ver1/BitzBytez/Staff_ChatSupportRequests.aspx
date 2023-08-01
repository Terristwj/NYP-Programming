<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Staff_ChatSupportRequests.aspx.cs" Inherits="BitzBytez.Staff_ChatSupportRequests" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
    <style>
        .card_ {
            border-radius: 10px 10px;
            border: 1px solid grey;
            padding: 10px;
            box-shadow: 1px 1px 5px #000;
        }
    </style>
    <script src="js/jquery.js"></script>
    <script type="text/javascript">

        var noOfRequests = 0;
        var newNoOfRequests = 0;
        var currentUser = 0;

        function loadAllCSRequests() {
            var url = "http://localhost:35820/ChatSupport.asmx";
            $.ajax({
                type: "POST",
                url: url + "/getAllCSRequests",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function loadAllCSR_SuccessCall(response) {
                    var json = JSON.parse(response.d);
                    document.getElementById("requestContainer").innerHTML = "";
                    for (var i = 0; i < json.length; i++) {
                        document.getElementById("requestContainer").innerHTML +=
                            "<div class=\"col-md-12 card_\" style=\"margin-bottom:10px;\">" +
                            "<div>" +
                        "<div class=\"col-md-6\" style=\"padding-left: 0px;\">" +
                            "<div class=\"row\" style=\"margin: 0px;\">" +
                                "<div><strong>Requestor ID: </strong>&nbsp;</div>" +
                            "<div>" + json[i].RequestorID + "</div>" +
                            "</div>" +
                            "<div class=\"row\" style=\"margin: 0px;\">" +
                                "<div><strong>Time created: </strong>&nbsp;</div>" +
                            "<div>" + json[i].DateTimeCreated + "</div>" +
                            "</div>" +
                            "<div class=\"row\" style=\"margin: 0px;\">" +
                                "<div><strong>Requestor: </strong>&nbsp;</div>" +
                                "<div>" + json[i].Salutation + " " + json[i].RequestorName + "</div>" +
                            "</div>" +
                            "<div class=\"row\" style=\"margin: 0px;\">" +
                                "<div><strong>Description: </strong>&nbsp;</div>" +
                                "<div>" + json[i].IssueDescription + "</div>" +
                            "</div>" +
                        "</div>" +

                        "<div style=\"height:43px; padding-bottom:15px;\">" +
                            "<div style=\"float:right;\">" +
                                "<button class=\"btn btn-primary\" ID=\"tb_Accept\" onclick=\"createConvo('" + json[i].RequestorID + "', '" + json[i].Id + "');return false\"/>Accept</button>" +
                                "<button class=\"btn btn-light\" ID=\"tb_Decline\"/>Decline</button>" +
                            "</div>" +
                        "</div>" +
                    "</div>"
                    }
                },
                error: OnErrorCall
            });
        }

        function getNoOfCSRequests() {
            var url = "http://localhost:35820/ChatSupport.asmx";
            $.ajax({
                type: "POST",
                url: url + "/getNoOfCSRequests",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    noOfRequests = response.d;
                },
                error: OnErrorCall
            });
        }

        function checkForNewCSRequests() {
            getNoOfCSRequests();
            if (noOfRequests > newNoOfRequests) {
                loadAllCSRequests();
                newNoOfRequests = noOfRequests;
            }
        }

        function OnErrorCall(response) {
            alert(response.d);
        }

        function createConvo(requestorID, CSRequestID) {
            console.log(requestorID);
            console.log(currentUser);

            var url = "http://localhost:35820/ChatSupport.asmx";
            $.ajax({
                type: "POST",
                url: url + "/createConvo",
                contentType: "application/json; charset=utf-8",
                data: "{accountID: " + requestorID + ", officerID: " + currentUser + "}",
                dataType: "json",
                success: function (response) {
                    var convoID = response.d;

                    sessionStorage.setItem("convoID", convoID);
                    //alert(sessionStorage.getItem("convoID"));
                    updateCSRequest(convoID, 'accepted', CSRequestID);
                },
                error: function () {
                    alert("createConvo error")
                }
            });
        }

        function updateCSRequest(convoID, status, CSRequestID) {
            var url = "http://localhost:35820/ChatSupport.asmx";
            $.ajax({
                type: "POST",
                url: url + "/updateCSRequest",
                contentType: "application/json; charset=utf-8",
                data: "{convoID: " + convoID + ", status: '" + status + "', CSRequestID: " + CSRequestID + "}",
                dataType: "json",
                success: function (response) {
                    window.location.href = "ChatSupport.aspx";
                },
                error: function () {
                    alert("updateCSRequest error")
                }
            });
        }

        $(document).ready(function () {
            currentUser = '<%= Session["userID"] %>';

            setInterval(checkForNewCSRequests, 500);

        })
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container" style="background: white; padding: 20px; min-height: 1000px;">
        <div style="margin: auto; text-align: center; padding: 50px; padding-bottom: 30px;">
            <h2><b>Chat Support Requests</b></h2>
            <p>Here are the requests you have received from customers. Click on "Accept" to accept a request,</p>
        </div>
        <div id="requestContainer">
<%--            <div class="col-md-12 card_">
                <div>
                    <div class="col-md-6" style="padding-left: 0px;">
                        <div class="row" style="margin: 0px;">
                            <div><strong>Requestor ID: </strong>&nbsp;</div>
                            <div>01</div>
                        </div>
                        <div class="row" style="margin: 0px;">
                            <div><strong>Requestor: </strong>&nbsp;</div>
                            <div>MR ABC</div>
                        </div>
                        <div class="row" style="margin: 0px;">
                            <div><strong>Description: </strong>&nbsp;</div>
                            <div>123</div>
                        </div>
                    </div>

                    <div style="height: 43px; padding-bottom: 15px;">
                        <div style="float: right;">
                            <asp:Button CssClass="btn btn-primary" ID="tb_Accept" runat="server" Text="Accept" />
                            <asp:Button CssClass="btn btn-light" ID="tb_Decline" runat="server" Text="Decline" />
                        </div>
                    </div>
                </div>
            </div>--%>
        </div>
    </div>
</asp:Content>
