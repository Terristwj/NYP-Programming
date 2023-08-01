<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="ChatSupport.aspx.cs" Inherits="BitzBytez.ChatSupport" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="js/jquery.js"></script>
    <script type="text/javascript">
        var convoID = "";
        var currentUser = 0;
        var noOfMessages = 0;
        var newNoOfMessages = 0;
        
        function callWS() {
            var url = "http://localhost:35820/ChatSupport.asmx";
            $.ajax({
                type: "POST",
                url: url + "/HelloWorld",
                data: "{param1:'orange'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: OnSuccessCall,
                error: OnErrorCall
            });
        }

        function createConvo(accID, offID) {
            var url = "http://localhost:35820/ChatSupport.asmx";
            $.ajax({
                type: "POST",
                url: url + "/createConvo",
                data: "{accountID: " + accID + ", officerID: " + offID + "} ",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: createConvoSuccessCall,
                error: OnErrorCall
            });
        }

        function insertMessage(convoID, senderID, recipientID, msg) {
            var url = "http://localhost:35820/ChatSupport.asmx";
            $.ajax({
                type: "POST",
                url: url + "/insertMessage",
                data: "{convoID: " + convoID + ", senderID: " + senderID + ", recipientID: " + recipientID + ", msg: '" + msg + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function() {
                    document.getElementById("tb").value = "";
                },
                error: OnErrorCall
            });
        }

        function getMessages(convoID) {
            var url = "http://localhost:35820/ChatSupport.asmx";
            $.ajax({
                type: "POST",
                url: url + "/getMessages",
                data: "{convoID: " + convoID + "}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: getMessagesSuccessCall,
                error: OnErrorCall
            });
        }

        function getNoOfMessages(convoID) {
            var url = "http://localhost:35820/ChatSupport.asmx";
            $.ajax({
                type: "POST",
                url: url + "/getNoOfMessages",
                data: "{convoID: " + convoID + "}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: getNoOfMsgsSuccessCall,
                error: function (response) {
                    console.log(response.d)
                }
            });
        }

        function createConvoSuccessCall(response) {
            convoID = response.d;
        }

        function insertMsgSuccessCall(response) {
            alert(response.d)
        }

        function getMessagesSuccessCall(response) {
            console.log("getMessagesSuccessCall: " + currentUser)
            var json = JSON.parse(response.d);

            document.getElementById("msg_container").innerHTML = "";

            for (var i = 0; i < json.length; i++) {
                if (parseInt(json[i].SenderID) == parseInt(currentUser)) {
                    document.getElementById("msg_container").innerHTML +=
                        "<div class=\"outgoing_msg\">" +
                            "<div class=\"sent_msg\">" +
                                "<p>" +
                                    json[i].Content +
                                "</p>" +
                                "<span class=\"time_date\">" + json[i].DtCreated + "</span>" +
                            "</div>" +
                        "</div>";
                } else {
                    document.getElementById("msg_container").innerHTML +=
                        "<div class=\"incoming_msg\">" +
                            "<div class=\"received_msg\">" +
                                "<div class=\"received_withd_msg\">" +
                                    "<p>" +
                                        json[i].Content +
                                    "</p>" +
                                    "<span class=\"time_date\">" + json[i].DtCreated + "</span>" +
                                "</div>" +
                            "</div>" +
                        "</div>";
                }
            }
        }

        function getNoOfMsgsSuccessCall(response) {
            newNoOfMessages = response.d;
        }

        function OnSuccessCall(response) {
            alert(response.d);
        }

        function OnErrorCall(response) {
            alert(response.status + " " + response.statusText);
        }

        function sendInput() {
            if (document.getElementById("tb").value.trim() != "") {
                var input = document.getElementById("tb").value.trim();
                var senderID = currentUser;
                var recipientID = 0;
                insertMessage(convoID, senderID, recipientID, input);
                console.log(convoID + " " + senderID + " " + recipientID + " " + input)
            }
        }

        function loadMsg() {
            getMessages(convoID)
        }

        function checkForNewMsgs() {
            getNoOfMessages(convoID)
            
            if (newNoOfMessages > noOfMessages) {
                loadMsg();
                noOfMessages = newNoOfMessages;
            }
        }

        $(document).ready(function () {
            currentUser = '<%= Session["userID"] %>';
            convoID = sessionStorage.getItem("convoID");
            console.log(currentUser);
            console.log(convoID);

            setInterval(checkForNewMsgs, 500);

            //document.getElementById("btn_send").disabled = true;
        });

        function checkForInvalidInput() {
            //console.log(document.getElementById("tb").value.trim().length);
            //if (document.getElementById("tb").value.trim().length > 1) {
            //    document.getElementById("btn_send").disabled = true;
            //} else {
            //    document.getElementById("btn_send").disabled = false;
            //}
        }
    </script>
    
    <style>

        .container{max-width:1170px; margin:auto;}

        img{ max-width:100%;}

        .inbox_people {
          background: #f8f8f8 none repeat scroll 0 0;
          float: left;
          overflow: hidden;
          width: 40%; border-right:1px solid #c4c4c4;
        }

        .inbox_msg {
          border: 1px solid #c4c4c4;
          clear: both;
          overflow: hidden;
        }

        .top_spac{ margin: 20px 0 0;}

        .recent_heading {float: left; width:40%;}

        .srch_bar {
          display: inline-block;
          text-align: right;
          width: 60%; padding:
        }

        .headind_srch{ padding:10px 29px 10px 20px; overflow:hidden; border-bottom:1px solid #c4c4c4;}

        .recent_heading h4 {
          color: #05728f;
          font-size: 21px;
          margin: auto;
        }

        .srch_bar input{ border:1px solid #cdcdcd; border-width:0 0 1px 0; width:80%; padding:2px 0 4px 6px; background:none;}

        .srch_bar .input-group-addon button {
          background: rgba(0, 0, 0, 0) none repeat scroll 0 0;
          border: medium none;
          padding: 0;
          color: #707070;
          font-size: 18px;
        }
        .srch_bar .input-group-addon { margin: 0 0 0 -27px;}

        .chat_ib h5{ font-size:15px; color:#464646; margin:0 0 8px 0;}
        .chat_ib h5 span{ font-size:13px; float:right;}
        .chat_ib p{ font-size:14px; color:#989898; margin:auto}
        .chat_img {
          float: left;
          width: 11%;
        }
        
        .chat_ib {
          float: left;
          padding: 0 0 0 15px;
          width: 88%;
        }

        .chat_people{ overflow:hidden; clear:both;}

        .chat_list {
          border-bottom: 1px solid #c4c4c4;
          margin: 0;
          padding: 18px 16px 10px;
        }
        .inbox_chat { height: 550px; overflow-y: scroll;}

        .active_chat{ background:#ebebeb;}

        .incoming_msg_img {
          display: inline-block;
          width: 6%;
        }

        .incoming_msg {
            overflow: hidden;
            margin:15px 0 15px;
        }
        
        .received_msg {
          display: inline-block;
          padding: 0 0 0 10px;
          vertical-align: top;
          width: 92%;
        }
        
        .received_withd_msg p {
          background: #ebebeb none repeat scroll 0 0;
          border-radius: 3px;
          color: #646464;
          font-size: 14px;
          margin: 0;
          padding: 5px 10px 5px 12px;
          width: 100%;
        }
        
         .time_date {
          color: #747474;
          display: block;
          font-size: 12px;
          margin: 8px 0 0;
        }

        .received_withd_msg { width: 57%;}

        .msgs {
          margin:auto;
          padding: 0px 0px 5px 0px;
          /*width: 60%;*/
        }

        .sent_msg p {
            background: #8B008B none repeat scroll 0 0;
            border-radius: 3px;
            font-size: 14px;
            margin: 0;
            color: #fff;
            padding: 5px 10px 5px 12px;
            width: 100%;
        }

        .outgoing_msg { 
            overflow: hidden; margin:15px 0 15px;
        }

        .sent_msg {
          float: right;
          width: 46%;
        }
        .input_msg_write input {
          background: rgba(0, 0, 0, 0) none repeat scroll 0 0;
          border: medium none;
          color: #4c4c4c;
          font-size: 15px;
          min-height: 48px;
          width: 100%;
        }

        .type_msg {border-top: 1px solid #c4c4c4;position: relative;}

        .msg_send_btn {
          background: #05728f none repeat scroll 0 0;
          border: medium none;
          border-radius: 50%;
          color: #fff;
          cursor: pointer;
          font-size: 17px;
          height: 33px;
          position: absolute;
          right: 0;
          top: 11px;
          width: 33px;
        }

        .messaging { padding: 0 0 50px 0;}

        .msg_history {
          height: 516px;
          overflow-y: auto;
        }

        #msg_container::-webkit-scrollbar-track {
            -webkit-box-shadow: inset 0 0 6px rgba(0,0,0,0.3);
            border-radius: 10px;
            background-color: white;
        }

        #msg_container::-webkit-scrollbar {
            width: 6px;
            background-color: #F5F5F5;
        }

        #msg_container::-webkit-scrollbar-thumb {
            border-radius: 10px;
            -webkit-box-shadow: inset 0 0 6px rgba(0,0,0,.3);
            background-color: #555;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container" style="background: white;">
        <div>
            <div class="msgs">
                <div id="msg_container" class="msg_history">
                   
<%--                    <div class="incoming_msg">
                        <div class="incoming_msg_img">
                            <img src="https://ptetutorials.com/images/user-profile.png" alt="sunil">
                        </div>
                        <div class="received_msg">
                            <div class="received_withd_msg">
                                <p>
                                    Test which is a new approach to have all solutions
                                </p>
                                <span class="time_date">Alexis | 11.00 A.M</span>
                            </div>
                        </div>
                    </div>

                    <div class="outgoing_msg">
                        <div class="sent_msg">
                            <p>
                                Test which is a new approach
                            </p>
                            <span class="time_date">11:01 AM | June 9</span>
                        </div>
                    </div>--%>

                </div>
                <div class="type_msg">
                    <div class="input_msg_write">
                        <input type="text" class="write_msg" placeholder="Type a message" id="tb" onkeyup="checkForInvalidInput()" onkeydown="checkForInvalidInput()"/>
                        <button id="btn_send" class="msg_send_btn" type="button" onclick="sendInput()"><i class="fa fa-paper-plane-o" aria-hidden="true"></i></button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
</asp:Content>
