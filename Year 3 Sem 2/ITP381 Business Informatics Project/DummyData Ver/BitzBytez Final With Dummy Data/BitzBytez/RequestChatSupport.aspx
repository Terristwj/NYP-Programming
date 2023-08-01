<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="RequestChatSupport.aspx.cs" Inherits="BitzBytez.RequestChatSupport" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .vertical-center {
            margin: auto 0;
        }

        .loader {
            border: 10px solid #f3f3f3;
            border-radius: 50%;
            border-top: 10px solid #000;
            width: 60px;
            height: 60px;
            -webkit-animation: spin 2s linear infinite; /* Safari */
            animation: spin 2s linear infinite;
        }

        /* Safari */
        @-webkit-keyframes spin {
            0% {
                -webkit-transform: rotate(0deg);
            }

            100% {
                -webkit-transform: rotate(360deg);
            }
        }

        @keyframes spin {
            0% {
                transform: rotate(0deg);
            }

            100% {
                transform: rotate(360deg);
            }
        }

    </style>

    <script src="js/jquery.js"></script>
    
    <script type="text/javascript">
        var requestID = 0;
        var currentUser = 0;
        //need to get reqID!
        function getCSRequestDetails() {
            if (requestID > 0) {
                var url = "http://localhost:35820/ChatSupport.asmx";
                $.ajax({
                    type: "POST",
                    url: url + "/getCSRequestDetails",
                    data: "{reqID: " + requestID + "}",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (response) {
                        var json = JSON.parse(response.d)

                        console.log(json.ConvoID)

                        if (json.Status == "accepted") {
                            if (json.ConvoID > 0) {
                                var convoID = json.ConvoID;
                                document.getElementById("pleaseWait_Loader").style.display = "none";
                                document.getElementById("btn_Request").disabled = true;
                                sessionStorage.setItem("convoID", convoID);
                                console.log("convoID: " + sessionStorage.getItem("convoID"))
                                window.location.href = "ChatSupport.aspx";
                            }
                        } else if (json.Status == "pending") {
                            document.getElementById("pleaseWait_Loader").style.display = "block";
                            document.getElementById("btn_Request").disabled = true;
                        } else if (json.Status == "rejected") {
                            document.getElementById("pleaseWait_Loader").style.display = "none";
                            document.getElementById("btn_Request").disabled = false;
                        }

                    },
                    error: OnErrorCall
                });
            }
        }

        function createCSRequest(requestorID, requestorName, sal, issueDesc) {
            console.log("{requestorID: " + requestorID + ", reqName: '" + requestorName + "', salutation: '" + sal + "', issueDesc: '" + issueDesc + "'}");
            var url = "http://localhost:35820/ChatSupport.asmx";
            $.ajax({
                type: "POST",
                url: url + "/createCSRequest",
                data: "{requestorID: " + requestorID + ", reqName: '" + requestorName + "', salutation: '" + sal + "', issueDesc: '" + issueDesc + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    requestID = response.d;
                    console.log(requestID);
                },
                error: OnErrorCall
            });
        }

        function OnErrorCall(response) {
            alert(response.d);
        }

        function send() {
            var e = document.getElementById("ddl_Sal");

            var salutation = e.options[e.selectedIndex].text;
            var name = document.getElementById("tb_Name").value.trim();
            var issueDesc = document.getElementById("tb_issueDesc").value.trim();

            if (salutation != "" && name != "" && issueDesc != "") {
                createCSRequest(currentUser, name, salutation, issueDesc);
            } 
        }

        function verifyInput() {
            var e = document.getElementById("ddl_Sal");

            var salutation = e.options[e.selectedIndex].text;
            var name = document.getElementById("tb_Name").value.trim();
            var issueDesc = document.getElementById("tb_issueDesc").value.trim();

            console.log(salutation + " " + name + " " + issueDesc);

            if (salutation != "" && name != "" && issueDesc != "") {
                document.getElementById("btn_Request").disabled = false;
            } else {
                document.getElementById("btn_Request").disabled = true;
            }
        }

        $(document).ready(function () {
            currentUser = '<%= Session["userID"] %>';
            console.log("Current User: " + currentUser);
            document.getElementById("pleaseWait_Loader").style.display = "none";
            document.getElementById("btn_Request").disabled = true;

            setInterval(getCSRequestDetails, 500);

        })

    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container" style="background: white;">

        <div style="margin: auto; text-align: center; padding: 50px; padding-bottom: 0px;">
            <h2><b>Chat Support Request</b></h2>
            <p>Please fill up the form below to make a request for chat support with a customer service officer.</p>
        </div>

        <div style="padding: 50px;">
            <div class="row col-md-12" style="margin: 0px;">
                <div class="vertical-center col-md-3" style="padding: 10px;">
                    <label style="margin: 0;">Salutation</label>
                </div>
                <div class="col-md-3 vertical-center" style="padding: 10px;">
                    <%--<asp:DropDownList ID="ddl_Sal" runat="server" CssClass="form-control"></asp:DropDownList>--%>
                    <select id="ddl_Sal" class="form-control">
                        <option value=""></option>
                        <option value="Mr. ">Mr.</option>
                        <option value="Mrs. ">Mrs.</option>
                        <option value="Mdm. ">Mdm.</option>
                        <option value="Ms. ">Ms.</option>
                        <option value="Dr. ">Dr.</option>
                    </select>
                </div>
            </div>

            <div class="row col-md-12" style="margin: 0px;">
                <div class="row col-md-12" style="margin: 0px; padding: 0px;">
                    <div class="vertical-center col-md-3" style="padding: 10px;">
                        <label style="margin: 0;">Name</label>
                    </div>
                    <div class="col-md-9" style="padding: 10px;">
                        <%--<asp:TextBox ID="tb_Name" runat="server" class="form-control"></asp:TextBox>--%>
                        <input type="text" id="tb_Name" class="form-control" onkeydown="verifyInput()" onkeyup="verifyInput()"/>
                    </div>
                </div>
            </div>

            <div class="row col-md-12" style="margin: 0px;">
                <div class="vertical-center col-md-3" style="padding: 10px;">
                    <label style="margin: 0;">Issue Description</label>
                </div>
                <div class="col-md-9" style="padding: 10px;">
                    <%--<asp:TextBox ID="tb_issueDesc" runat="server" class="form-control" Rows="10" TextMode="MultiLine"></asp:TextBox>--%>
                    <textarea id="tb_issueDesc" class="form-control" rows="10" onkeydown="verifyInput()" onkeyup="verifyInput()"></textarea>
                </div>
            </div>

            <div id="pleaseWait_Loader">
                <div class="col-md-12 d-flex justify-content-center" style="margin: 0px; padding: 50px; margin: 0 auto">
                    <div class="row" style="margin: auto;">
                        <div class="loader"></div>
                        <div style="margin: auto 20px;">
                            <p style="margin: 0; font-style: italic">
                                Please wait... A Customer Service Officer will attend to you shortly.
                            </p>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row col-md-12" style="margin-top: 30px; margin-bottom: 30px; text-align: center;">
                <div class="row" style="margin: auto;">
                    <div style="padding: 5px;">
                        <button id="btn_Request" type="button" class="btn btn-dark" onclick="send()">Request</button>
                    </div>
                    <div style="padding: 5px;">
                        <button id="Cancel" type="button" class="btn btn-light">Cancel</button>
                    </div>
                </div>
            </div>

        </div>
    </div>
</asp:Content>
