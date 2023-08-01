<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Info.aspx.cs" Inherits="BitzAndBytez.Info" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            var url = window.location.toString();

            $('.collapse .navbar-nav').find('.active').removeClass('active');
            $('.collapse .navbar-nav li a').each(function () {
                if (this.href == url) {
                    $(this).parent().addClass('active');
                }
            });
        });
    </script>
    <style>
        .upperContainer{
            width:90%;
            margin:auto;
        }
        iframe{
            width:100%;
            height:100%;
            border:1px solid #888;
            max-height:800px;
        }

        #overlay_Chat{
            height:50px;
            width:50px;

            position:fixed;
            right:20px;
            bottom:20px;
            overflow:hidden;
            transition:0.5s;
        }

        .overlay_Chat_Open{
            height:540px !important;
            width:352px !important;
        }
        #chatBot_container{
	        border:1px solid black;
	        background:#444;
	        width:352px;
        }
        #chatBot_container > h2{
	        color:white;
            padding-top:20px;
            padding-bottom:10px;
            letter-spacing:5px;
            font-size:16px;
            padding-left:20px;
        }
        .dialogFlow_container{
	        width:100%;
	        margin:auto;
	        overflow:hidden;
	        background:white;
        }
        .dialogFlow_container > iframe{
	        margin-top:-110px;
            height:520px;
        }

        .chatbot_icon{
            border:1px solid black;
            border-radius:50px;
            background:white;
            cursor:pointer;
        }
        .chatbot_icon img{
            width:50px;
            height:50px;
        }
        .displayNone{
            display:none;
            width:0px !important;
            height:0px !important;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="upperContainer">
        <!-- servcierID/channalID; Ask Terris for it -->
        <iframe src="https://disweb.dashflo.net/channels/668469579474927626/668930316416712734"></iframe>
    </div>

    <div id="overlay_Chat">
        <div id="chatBot_container" class="displayNone">
		    <h2>FAQ &nbsp;ChatBot</h2>
		    <div class="dialogFlow_container">
			    <iframe allow="microphone;"
				    src="https://console.dialogflow.com/api-client/demo/embedded/cf99bb3c-ce01-458e-ae52-3020fd894a5e">
			    </iframe>
		    </div>
	    </div>
        <div class="chatbot_icon" onclick="openChat()">
            <asp:Image ID="Image1" runat="server" ImageUrl="~/img/chatBotIcon.png" />
        </div>
    </div>
    <script>
        function openChat() {
            var element = document.getElementById("overlay_Chat");
            element.classList.toggle("overlay_Chat_Open");


            var element2 = document.getElementById("chatBot_container");
            element2.classList.toggle("displayNone");
        }
    </script>
</asp:Content>
