<%@ Page Title="Login" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script>
        function getPageNum() {
            return 3;
        }

        function loginFormColor(index) {
            if (index == 0) {
                document.getElementById("LoginForm").style.border = "1px solid rgba(255, 179, 191, 1)";
                document.getElementById("LoginForm").style.background = "none";
            } else if (index == 1) {
                document.getElementById("LoginForm").style.border = "1px solid black";
                document.getElementById("LoginForm").style.background = "rgba(255, 255, 255, 0.50)";
            }
        }

        function loginTableColor(index) {
            if (index == 0) {
                document.getElementById("LoginTable").style.border = "1px solid rgba(255, 179, 191, 1)";
                document.getElementById("LoginTable").style.background = "linear-gradient(144deg, rgba(255, 192, 203, 0.3) 0%, rgba(255, 255, 255, 1) 25%, rgba(255, 255, 255, 1) 75%, rgba(255, 192, 203, 0.1) 100%)";
            } else if (index == 1) {
                document.getElementById("LoginTable").style.border = "1px solid black";
                document.getElementById("LoginTable").style.background = "white";
            }
        }

        function selectedLabelFocus(index) {
            if (index == 0)
                document.getElementsByClassName("labels")[0].style.color = "rgb(255, 51, 82)";
            else if (index == 1)
                document.getElementsByClassName("labels")[1].style.color = "rgb(255, 51, 82)";
        }

        function selectedLabelFocusOut(index) {
            if (index == 0)
                document.getElementsByClassName("labels")[0].style.color = "black";
            else if (index == 1)
                document.getElementsByClassName("labels")[1].style.color = "black";
        }

        function selectedTxtInputFocus(index) {
            if (index == 0)
                document.getElementsByClassName("loginInput")[0].style="outline:rgba(255, 179, 191, 1); background:white;border:1px solid rgba(255, 153, 168, 1);box-shadow: 1px 1px 0.04px rgba(255, 153, 168, 1);";
            else if (index == 1)
                document.getElementsByClassName("loginInput")[1].style = "outline:rgba(255, 179, 191, 1); background:white;border:1px solid rgba(255, 153, 168, 1);box-shadow: 1px 1px 0.04px rgba(255, 153, 168, 1);";
        }

        function selectedTxtInputFocusOut(index) {
            if (index == 0)
                document.getElementsByClassName("loginInput")[0].style = "outline:none;background:linear-gradient(234deg, rgba(255, 192, 203, 0.1) 0%, rgba(255, 255, 255, 1) 25%, rgba(255, 255, 255, 1) 75%, rgba(255, 192, 203, 0.1) 100%); border:1px solid black; box-shadow: 1px 1px 0.04px black;";
            else if (index == 1)
                document.getElementsByClassName("loginInput")[1].style = "outline:none;background:linear-gradient(234deg, rgba(255, 192, 203, 0.1) 0%, rgba(255, 255, 255, 1) 25%, rgba(255, 255, 255, 1) 75%, rgba(255, 192, 203, 0.1) 100%); border:1px solid black; box-shadow: 1px 1px 0.04px black;";
        }

        function sign_up1() {
            var x = document.getElementById("myForm");
            var y = document.getElementById("myFormContainer")
            if (x.style.display == "block")
                y.style.animation = "animateTop-Back 1.1s";
            else
                x.style.display = "block";
        }

        function sign_up2() {
            var x = document.getElementById("myForm");
            var y = document.getElementById("myFormContainer")

            x.style.display = "none";
            y.style.animation = "animateTop 0.4s";
        }
    </script>
    <style>
        #extraDiv{
            border:1px transparent solid;
        }

        #LoginForm{
            border: 1px solid black;
            background:rgba(255,255,255,0.50);
            display:block;
            margin:auto;
            margin-top:50px;
            margin-bottom:50px;
            width:80%;
        }

        #LoginTable{
            background:white;
            width: 300px;
            margin:auto;
            margin-top:25px;
            margin-bottom:25px;
            border:1px black solid;
            padding-top:5px;
            padding-bottom:15px;
        }

        #LoginTable .labels{
            padding-left:10px;
            float:right;
            transition-duration:0.05s;
        }
        
        .loginInput{
            margin-top:3px;
            font-size:16px;
            width:180px;
            height:22px;
            background:linear-gradient(234deg, rgba(255, 192, 203, 0.1) 0%, rgba(255, 255, 255, 1) 25%, rgba(255, 255, 255, 1) 75%, rgba(255, 192, 203, 0.1) 100%);
            border:1px solid black;
            box-shadow: 1px 1px 0.04px black;
            padding-left:5px;
            margin-right:10px;
        }

        @keyframes loginInput{
            50%{width:150px;}
        }

        .loginInput:focus{
            animation-name: loginInput;
            animation-duration: 2.2s;
            animation-delay:2s;
        }

        #containerBtn1{
            display:block;
            margin:auto;
            width:150px;
        }

        .LgnBtn{
            background:linear-gradient(234deg, rgba(255, 192, 203, 0.4) 10%, rgba(255, 255, 255, 1) 25%, rgba(255, 255, 255, 1) 75%, rgba(255, 192, 203, 0.4) 100%);
            border:black 1px solid;
            cursor:pointer;
            font-size:14px;
            padding:5px;
            box-shadow: 2px 2px 1px black;
            display:inline;
            width:63px;
        }

        @keyframes LgnBtn{
            0%{border-radius:0%;}
            7.5%{border-radius:12.5%;}
            15%{border-radius:25%;}
            22.5%{border-radius:37.5%;}
            30%{border-radius:50%;}
            37.5%{border-radius:37.5%;}
            45%{border-radius:25%;}
            52.5%{border-radius:12.5%;}
            60%{border-radius:0%;}
        }

        .LgnBtn:hover{
            animation-name: LgnBtn;
            animation-duration: 2s;
            animation-iteration-count: infinite;
            border:rgba(255, 153, 168, 1) 1px solid;
            color:rgb(204, 0, 31);                              /*#0059b3 - Blue font*/
            background:white;
            box-shadow: 3px 3px 1px rgba(255, 153, 168, 1);     /*4da6ff - Nice blue*/
        }

        @media(min-width:720px){
            #LoginTable{ width: 500px;margin-top:55px;margin-bottom:55px;padding-top:15px;padding-bottom:25px;}
            .loginInput {width:200px;margin-left:15px;}
        }

        @media(min-width:900px){
            #LoginTable{width: 600px;margin-top:60px;margin-bottom:60px;padding-top:20px;padding-bottom:30px;}
            .loginInput {width:230px;margin-left:25px;}
        }

        @media(min-width:1175px){
            #LoginForm{width:1000px;margin-bottom:60px;padding-top:25px;padding-bottom:35px;}
            #LoginTable{width: 700px;}
            .loginInput {width:270px;margin-left:55px;}
        }

        #myForm{
            display:none;
            position:fixed;
            width:100%;
            height:100%;
            top:0;
        }

        #myFormBackground{
            background: rgba(0,0,0,0.15);
            position:fixed;
            width:100%;
            height:100%;
            top:0;
        }

        #myFormContainer{
            background:white;
            position:fixed;
            width:80%;
            left:10%;
            top:40px;
            animation-name: animateTop;
			animation-duration: 0.4s;
			box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2),0 6px 20px 0 rgba(0,0,0,0.19);
        }

        @keyframes animateTop {
			from {top:-300px; opacity:0}
			to {top:5%; opacity:1}
		}

        @keyframes animateTop-Back {
			from {top:5%; opacity:1}
			to {top:-900px; opacity:0}
		}

        #myForm-Header{
            height:80px;
            background:#595959;
            padding-top:10px;
            padding-left:15px;
        }

        #RegistrationTable{
            width: 300px;
            margin:auto;
            margin-top:25px;
            margin-bottom:25px;
            border:1px black solid;
            padding-top:5px;
            padding-bottom:15px;
        }

        #RegistrationTable .labels{
            padding-left:10px;
            float:right;
            transition-duration:0.05s;
        }

        #RegistrationTable .doubleLineLabel{
            width:70px;
            padding-left:10px;
            float:right;
            transition-duration:0.05s;
        }

        #RegistrationTable .inputs {
            padding-top:10px;
            height:50px;
        }

        #RegistrationTable .doubleLineInput{
            padding-top:26px;
        }

        .registInput{
            margin-top:3px;
            font-size:16px;
            width:180px;
            height:22px;
            background:linear-gradient(234deg, rgba(255, 192, 203, 0.1) 0%, rgba(255, 255, 255, 1) 25%, rgba(255, 255, 255, 1) 75%, rgba(255, 192, 203, 0.1) 100%);
            border:1px solid black;
            box-shadow: 1px 1px 0.04px black;
        }

        #containerBtn2{
            display:block;
            margin:auto;
            width:190px;
        }

        .RgtBtn{
            background:white;
            border:black 1px solid;
            cursor:pointer;
            font-size:16px;
            padding:8px;
            box-shadow: 2px 2px 1px black;
            display:inline;
            width:83px;
        }

        #myForm-Footer{
            height:50px;
            background:#696969;
        }

        @media(min-width:720px){
            #myForm-Header {text-align:center;}
            .regisLabel{font-size:24px;}
            #RegistrationTable{ width: 500px;margin-top:55px;margin-bottom:55px;padding-top:15px;padding-bottom:25px;}
            .registInput {width:200px;margin-left:15px;}
            #RegistrationTable .inputs {width:350px;height:53px;}
            #RegistrationTable .doubleLineLabel {width: auto;}
            #RegistrationTable .inputs {padding-top:0px;}

            #RegistrationTable .doubleLineInput{padding-top:0px;}
        }

        @media(min-width:900px){
            #RegistrationTable{width: 600px;margin-top:60px;margin-bottom:60px;padding-top:20px;padding-bottom:30px;}
            .registInput {width:230px;margin-left:25px;}
            #RegistrationTable .inputs {width:420px;}
        }

        @media(min-width:1175px){
            #RegistrationTable{width: 700px;}
            .registInput {width:270px;margin-left:55px;}
            #RegistrationTable .inputs {width:520px;}
        }

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="extraDiv">
        <div id="LoginForm" onmouseover="loginFormColor(0)" onmouseout="loginFormColor(1)">

            <table id="LoginTable" onmouseover="loginTableColor(0)" onmouseout="loginTableColor(1)">
                <tr>
                    <td class="labels"><p>Username:</p></td>
                    <td ><asp:TextBox ID="TxtUsername" runat="server" class="loginInput" onfocus="selectedLabelFocus(0)" onfocusout="selectedLabelFocusOut(0)" onmouseover="selectedLabelFocus(0), selectedTxtInputFocus(0)" onmouseout="selectedLabelFocusOut(0), selectedTxtInputFocusOut(0)"></asp:TextBox></td>
                </tr>
                <tr>
                    <td class="labels"><p>Password:</p></td>
                    <td><asp:TextBox ID="TxtPassword" runat="server" class="loginInput" onfocus="selectedLabelFocus(1)" onfocusout="selectedLabelFocusOut(1)"  onmouseover="selectedLabelFocus(1), selectedTxtInputFocus(1)" onmouseout="selectedLabelFocusOut(1), selectedTxtInputFocusOut(1)" TextMode="Password"></asp:TextBox></td>
                </tr>
                <tr>
                    <td colspan="2">
                        <div id="containerBtn1">
                            <asp:Button ID="BtnLogin" runat="server" Text="Login" CssClass="LgnBtn" OnClick="BtnLogin_Click" />
                            <div style="border-left:20px solid transparent;display:inline;"></div>
                            <input id="BtnSignUp" class="LgnBtn" type="button" value="Sign Up" onclick="sign_up1()"/>
                        </div>
                    </td>
                </tr>
            </table>
        </div>
        <div id="myForm">
            <div id="myFormBackground" onclick="sign_up1(), setTimeout(sign_up2, 600);">
            </div>
            <div id="myFormContainer">
                <div id="myForm-Header">
                    <h1 style="color:white;">Registration</h1>
                </div>
                <div id="myForm-Content">
                    <table id="RegistrationTable">
                        <tr>
                            <td class="labels"><p>Name:</p></td>
                            <td class="inputs">
                                <asp:TextBox ID="RegisTxtName" runat="server" class="registInput"></asp:TextBox>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ErrorMessage="Max Length 15" ControlToValidate="RegisTxtName" ForeColor="Red" ValidationExpression="^.{1,15}$" Display="Dynamic" ValidationGroup="Signup"></asp:RegularExpressionValidator>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Required" ControlToValidate="RegisTxtName" ForeColor="Red" Display="Dynamic" ValidationGroup="Signup"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="labels"><p>Email:</p></td>
                            <td class="inputs">
                                <asp:TextBox ID="RegisTxtEmail" runat="server" class="registInput"></asp:TextBox>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Invalid Email" ControlToValidate="RegisTxtEmail" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Display="Dynamic" ValidationGroup="Signup"></asp:RegularExpressionValidator>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Required" ControlToValidate="RegisTxtEmail" ForeColor="Red" Display="Dynamic" ValidationGroup="Signup"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="labels"><p>Address:</p></td>
                            <td class="inputs">
                                <asp:TextBox ID="RegisTxtAddr" runat="server" class="registInput"></asp:TextBox>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ErrorMessage="Too Long" ControlToValidate="RegisTxtAddr" ForeColor="Red" ValidationExpression="^.{1,100}$" Display="Dynamic" ValidationGroup="Signup"></asp:RegularExpressionValidator>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Required" ControlToValidate="RegisTxtAddr" ForeColor="Red" Display="Dynamic" ValidationGroup="Signup"></asp:RequiredFieldValidator>
                           </td>
                        </tr>
                        <tr>
                            <td class="labels"><p>Zip Code:</p></td>
                            <td class="inputs">
                                <asp:TextBox ID="RegisTxtZC" runat="server" class="registInput"></asp:TextBox>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Invalid Zip Code" ControlToValidate="RegisTxtZC" ValidationExpression="^\d{6}$" ForeColor="Red" Display="Dynamic" ValidationGroup="Signup"></asp:RegularExpressionValidator>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Required" ControlToValidate="RegisTxtZC" ForeColor="Red" Display="Dynamic" ValidationGroup="Signup"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="labels doubleLineLabel"><p>Phone Number:</p></td>
                            <td class="inputs doubleLineInput">
                                <asp:TextBox ID="RegisTxtPN" runat="server" class="registInput"></asp:TextBox>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="Invalid Number" ControlToValidate="RegisTxtPN" ValidationExpression="^[89]\d{7}$" ForeColor="Red" Display="Dynamic" ValidationGroup="Signup"></asp:RegularExpressionValidator>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="Required" ControlToValidate="RegisTxtPN" ForeColor="Red" Display="Dynamic" ValidationGroup="Signup"></asp:RequiredFieldValidator>
                            </td>
                        </tr>

                        <tr>
                            <td colspan="2"><br /><hr /></td>
                        </tr>

                        <tr>
                            <td class="labels"><p>Username:</p></td>
                            <td  class="inputs">
                                <asp:TextBox ID="RegisTxtUsername" runat="server" class="registInput"></asp:TextBox>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" ErrorMessage="Max Length 15" ControlToValidate="RegisTxtUsername" ForeColor="Red" ValidationExpression="^.{1,15}$" Display="Dynamic" ValidationGroup="Signup"></asp:RegularExpressionValidator>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Required" ControlToValidate="RegisTxtUsername" ForeColor="Red" Display="Dynamic" ValidationGroup="Signup"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="labels"><p>Password:</p></td>
                            <td class="inputs">
                                <asp:TextBox ID="RegisTxtPassword" runat="server" class="registInput"></asp:TextBox>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator7" runat="server" ErrorMessage="Max Length 20" ControlToValidate="RegisTxtPassword" ForeColor="Red" ValidationExpression="^.{1,20}$" Display="Dynamic" ValidationGroup="Signup"></asp:RegularExpressionValidator>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Required" ControlToValidate="RegisTxtPassword" ForeColor="Red" Display="Dynamic" ValidationGroup="Signup"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <div id="containerBtn2">
                                    <asp:Button ID="btnRegister" runat="server" Text="Register" CssClass="RgtBtn" OnClick="btnRegister_Click" ValidationGroup="Signup" />
                                    <div style="border-left:20px solid transparent;display:inline;"></div>
                                    <input id="btnCancel" class="RgtBtn" type="button" value="Cancel" onclick="sign_up1(), setTimeout(sign_up2, 600);"/>
                                </div>
                            </td>
                        </tr>
                    </table>
                </div>
                <div id="myForm-Footer">
                    <h1>&nbsp;</h1>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

