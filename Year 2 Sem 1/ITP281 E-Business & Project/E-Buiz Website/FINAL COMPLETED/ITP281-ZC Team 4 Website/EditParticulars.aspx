<%@ Page Title="Edit Particulars" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="EditParticulars.aspx.cs" Inherits="EditParticulars" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script>
        function getPageNum() {
            return 3;
        }


        function addFunds1() {
            var x = document.getElementById("myForm");
            var y = document.getElementById("myFormContainer")
            if (x.style.display == "block")
                y.style.animation = "animateTop-Back 1.2s";
            else
                x.style.display = "block";
        }

        function addFunds2() {
            var x = document.getElementById("myForm");
            var y = document.getElementById("myFormContainer")

            x.style.display = "none";
            y.style.animation = "animateTop 0.9s";
        }
    </script>
    <style>
        .content{
            height:auto;
        }

        #extraDiv{
            border:1px transparent solid;
        }

        .containers{
            width:620px;
        }

        .containersLeft, .containersRight{
            margin:auto;
        }

        @media(min-width: 1250px) {
            #TopContainer{display:flex;justify-content:flex-end;}
            #ProfileContainer{flex:5;border-right:0.5px solid rgba(0, 0, 0, 0.5);}
            #AccountContainer{flex:5;border-left:0.5px solid rgba(0, 0, 0, 0.5);}
            .containersLeft{margin-right:0px;}
            .containersRight{margin-left:0px;}
        }

        .title{
            width:443px;
            margin:auto;
            text-decoration:underline;
            margin-bottom:-5px;
        }

        #nameContainer{
            width:441px;
            margin:auto;
        }

        .defaultLabel{
            float:left;
            font-family: Arial;
        }

        .tb_name{
            width:321px;
            margin-top:-2px;
            padding-left:3px;
        }

        /*
        @media(min-width:900px) {
            .title{width:65%;}
        }

        @media(min-width:1200px) {
            .title{width:754px;}
        }*/

        #profileImgContainerShell{
            height:220px;
        }

        .profileImgContainerShell{
            float:left;
        }

        #profileImgContainer{
            margin:auto;
            width:441px;
            height:283px;
        }

        #profileImgContainer1{
            height:181px;
            width:181px;
            border:1px solid black;
        }

        #profileImgContainer2{
            height:151px;
            width:151px;
            margin-top:30px;
            border-top:1px solid black;
            border-right:1px solid black;
            border-bottom:1px solid black;
        }

        #profileImgContainer3{
            height:105px;
            width:105px;
            margin-top:76px;
            border-top:1px solid black;
            border-right:1px solid black;
            border-bottom:1px solid black;
        }

        .profileImage{
            height:100%;
            width:100%;
            cursor:-webkit-grab;
        }

        .pixelLabel{
            margin-top:-10px;
            padding-left:7px;
            font-size:14px;
        }

        .label{
            display:inline;
            font-family: Arial;
        }

        #profileImgLabelContainer{
            height:32px;
            width:445px;
        }

        #profileImgUploadContainer2{
            margin-top:220px;
            border:1px solid black;
            height:35px;
            padding-left:5px;
            padding-top:7px;
            padding-bottom:7px;
            display:inline;
        }

        .fu_profileImage{
            width:370px;
            margin-top:6px;
            cursor:pointer;
        }

        #backgroundImgContainer{
            width:441px;
            height:330px;
            margin:auto;
        }

        #backgroundImgContainer2{
            height:250px;
            margin:auto;
            border:1px solid black;
        }

        .currentBackground{
            width:100%;
            height:100%;
            cursor:-webkit-grab;
        }

        .pixelLabel2{
            margin-top:-10px;
            padding-left:10px;
            font-size:14px;
        }

        #backgroundImgLabelContainer{
            height:32px;
            width:445px;
        }

        #backgroundImgUploadContainer2{
            margin-top:220px;
            border:1px solid black;
            height:35px;
            padding-left:5px;
            padding-top:7px;
            padding-bottom:7px;
            display:inline;
        }

        .fu_backgroundImage{
            width:330px;
            margin-top:6px;
            cursor:pointer;
        }

        #EmailContainer{
            width:441px;
            margin:auto;
        }

        .tb_Email{
            width:379px;
            margin-top:-2px;
            padding-left:3px;
        }

        #AddressContainer{
            width:441px;
            margin:auto;
        }

        .tb_Address{
            width:361px;
            margin-top:-2px;
            padding-left:3px;
        }

        #ZipCodeContainer{
            width:441px;
            margin:auto;
        }

        .tb_ZipCode{
            width:355px;
            margin-top:-2px;
            padding-left:3px;
        }

        #PhoneNoContainer{
            width:441px;
            margin:auto;
        }

        .tb_PhoneNo{
            width:313px;
            margin-top:-2px;
            padding-left:3px;
        }

        #PasswordContainer{
            width:441px;
            margin:auto;
        }

        .tb_Password{
            width:350px;
            margin-top:-2px;
            padding-left:3px;
        }

        #NewPasswordContainer{
            width:441px;
            margin:auto;
        }

        .tb_NewPassword{
            width:313px;
            margin-top:-2px;
            padding-left:3px;
        }

        #ConfirmPasswordContainer{
            width:441px;
            margin:auto;
        }

        .tb_ConfirmPassword{
            width:289px;
            margin-top:-2px;
            padding-left:3px;
        }

        #AboutMeContainer{
            width:441px;
            margin:auto;
        }

        #AboutMeContainer2{ 
            position:relative;  /*NEVER REMOVE THIS*/
            width:341px;
            height:199px;
            margin:auto;
            overflow:hidden;
        }

        .tb_AboutMe{
            position:absolute;  /*NEVER REMOVE THIS*/
            top:0;              /*NEVER REMOVE THIS*/
            left:0;             /*NEVER REMOVE THIS*/
            height:193px;
            width:335px;
            resize:none;
            overflow:hidden;
        }

        #footerContainer{
            flex:12;
        }

        #footerContainer2{
            height:122px;
            width:620px;
            margin:auto;
            display:flex;
        }

        #fundsContainer{
            border:0.5px solid rgba(0, 0, 0, 0.5);
            flex:4;
        }

        #fundsLabel{
            padding:15px;
            width:160px;
            margin:auto;
            margin-top:7px;
        }

        .lb_Wallet{
            display:inline;
            font-size:17px;
            font-family:Arial;
        }

        #addFundsBtn{
            margin:auto;
            width:101px;
        }

        #footerSpace{
            flex:1;
        }

        #footerSpace2{
            background:rgba(0,0,0,0.2);
            width:2px;
            margin:auto;
            height:160px;
            margin-top:-20px;
            display:none;
        }

        #buttonContainer{
            border:0.5px solid rgba(0, 0, 0, 0.5);
            height:120px;
            width:204px;
            float:right;
            flex:4;
        }

        #buttonContainer2{
            width:204px;
            margin:auto;
        }

        #buttonContainer3{
            width:132.5px;
            margin:auto;
        }

        .button{
            padding:10px;
            width:90px;
            font-size:16px;
            border:1px solid black;
            background:white;
            cursor:pointer;
        }

        .button2{
            padding:10px;
            font-size:16px;
            border:1px solid black;
            background:white;
            cursor:pointer;
        }

        .button:hover, .button2:hover{
            background:rgb(255, 235, 238);
        }

        .buttonGap1{
            border:6px solid transparent;
        }

        .buttonGap2{
            display:inline;
            border:10px solid transparent;
        }

        .buttonGap3{
            border:5px solid transparent;
        }

        .buttonGap4{
            border:2px solid transparent;
        }

        @media(min-width: 1250px) {
            #footerContainer2{width:1070px;}
            #fundsContainer{flex:5}
            #footerSpace{flex:2}
            #buttonContainer{flex:5}
            #footerContainer{border-top:0.5px solid rgba(0, 0, 0, 0.5);padding-top:20px;}
            #footerSpace2{display:block;}
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
            position:fixed;
            width:80%;
            left:10%;
            top:25%;
            animation-name: animateTop;
			animation-duration: 0.7s;
        }

        #myFormContainer2{
            background:white;
            width:70%;
            left:15%;
            position:fixed;
			box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2),0 6px 20px 0 rgba(0,0,0,0.19);
        }

        #myForm-Content{
            padding-top:20px;
            padding-bottom:20px;
        }

        #myForm-Content2{
            border:1px solid black;
            width:350px;
            margin:auto;
            padding-top:20px;
            padding-bottom:20px;
        }

        #myForm-Table{
            font-family:'Arial';
            margin:auto;
        }

        .myForm-TableRow{
            height:50px;
        }

        @keyframes animateTop {
			from {top:-300px; opacity:0}
			to {top:25%; opacity:1}
		}

        @keyframes animateTop-Back {
			from {top:25%; opacity:1}
			to {top:-900px; opacity:0}
		}

        #myForm-Header{
            height:75px;
            background:#595959;
            padding-top:1px;
            padding-left:15px;
            text-align:center;
        }

        .addFundsTBContainer{
            height:40px;
            padding-top:20px;
        }

        #AddFundsBtnContainer{
            width:70px;
            margin:auto;
        }

        .AddFundsBtn{
            font-size:16px;
            margin-left:-5px;
            padding-top:5px;
            padding-bottom:5px;
            cursor:pointer;
        }


        @media(min-width: 1250px) {
            #myFormContainer{
                position:fixed;
                width:80%;
                left:10%;
                top:15%;
                animation-name: animateTop;
			    animation-duration: 0.7s;
            }

            @keyframes animateTop {
			    from {top:-300px; opacity:0}
			    to {top:15%; opacity:1}
		    }

            @keyframes animateTop-Back {
			    from {top:15%; opacity:1}
			    to {top:-900px; opacity:0}
		    }
            

            #myForm-Content{
                padding-top:70px;
                padding-bottom:100px;
            }
        }

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="extraDiv">
        <div id="TopContainer">
            <div id="ProfileContainer">
                <div class="containers containersLeft">
                    <div style="height:10px;">
                    </div>
                    <div class="title">
                        <h2>Profile</h2>
                    </div>
                    <div id="nameContainer">
                        <div class="defaultLabel">
                            <label>Display Name: &nbsp;</label>
                        </div>
                        <asp:TextBox ID="tb_name" runat="server" CssClass="tb_name" Font-Size="11"></asp:TextBox>
                        <div style="border-left:114px solid transparent;display:inline"></div>
                        <div style="display:inline">
                            <asp:RegularExpressionValidator ID="rsv_name" runat="server" ErrorMessage="Max Length 15" ControlToValidate="tb_name" ForeColor="Red" ValidationExpression="^.{1,15}$" Display="Dynamic" Font-Names="Arial" ValidationGroup="Update"></asp:RegularExpressionValidator>
                            <asp:RequiredFieldValidator ID="rfv_name" runat="server" ErrorMessage="Required" ControlToValidate="tb_name" ForeColor="Red" Display="Dynamic" Font-Names="Arial" ValidationGroup="Update"></asp:RequiredFieldValidator>
                        </div>
                    </div>

                    <div style="height:20px;">
                    </div>

                    <div id="profileImgContainer">
                        <div id="profileImgContainerShell">
                            <div class="profileImgContainerShell">
                                <div id="profileImgContainer1">
                                    <asp:Image ID="Image1" runat="server" CssClass="profileImage" ImageUrl="~/CSS and Images/Images and fonts/DefaultProfileImage.png" />
                                </div>
                                <div class="pixelLabel">
                                    <p>181x181</p>
                                </div>
                            </div>
                            <div class="profileImgContainerShell">
                                <div id="profileImgContainer2">
                                    <asp:Image ID="Image2" runat="server" CssClass="profileImage" ImageUrl="~/CSS and Images/Images and fonts/DefaultProfileImage.png" />
                                </div>
                                <div class="pixelLabel">
                                    <p>151x151</p>
                                </div>
                            </div>
                            <div class="profileImgContainerShell">
                                <div id="profileImgContainer3">
                                    <asp:Image ID="Image3" runat="server" CssClass="profileImage" ImageUrl="~/CSS and Images/Images and fonts/DefaultProfileImage.png" />
                                </div>
                                <div class="pixelLabel">
                                    <p>101x101</p>
                                </div>
                            </div>
                        </div>
                        <div id="profileImgLabelContainer">
                            <div class="label">
                                <label>Avatar: &nbsp;</label>
                            </div>
                            <div id="profileImgUploadContainer2">
                                <asp:FileUpload ID="fu_profileimage" CssClass="fu_profileImage" runat="server" />
                            </div>
                        </div>
                    </div>

                    <div style="height:10px;">
                    </div>

                    <div id="backgroundImgContainer">
                        <div id="backgroundImgContainer2">
                            <asp:Image ID="Img_Background" runat="server" CssClass="currentBackground"/>
                        </div>
                        <div class="pixelLabel2">
                            <p>441x250</p>
                        </div>
                        <div id="backgroundImgLabelContainer">
                            <div class="label">
                                <label>Background: &nbsp;</label>
                            </div>
                            <div id="backgroundImgUploadContainer2">
                                <asp:FileUpload ID="fu_backgroundimage" CssClass="fu_backgroundImage" runat="server" />
                            </div>
                        </div>
                    </div>

                    <div style="height:15px;">
                    </div>
                </div>

            </div>

            <div id="SpaceContainer1"></div>

            <div id="AccountContainer">
                <div class="containers containersRight">
                    <div style="height:10px;">
                    </div>

                    <div class="title">
                        <h2>Account</h2>
                    </div>

                    <div id="EmailContainer">
                        <div class="defaultLabel">
                            <label>Email: &nbsp;</label>
                        </div>
                        <asp:TextBox ID="tb_Email" runat="server" CssClass="tb_Email" Font-Size="11"></asp:TextBox>
                        <div style="border-left:55px solid transparent;display:inline"></div>
                        <div style="display:inline">
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Invalid Email" ControlToValidate="tb_Email" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Display="Dynamic" Font-Names="Arial" ValidationGroup="Update"></asp:RegularExpressionValidator>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Required" ControlToValidate="tb_Email" ForeColor="Red" Display="Dynamic" Font-Names="Arial" ValidationGroup="Update"></asp:RequiredFieldValidator>
                        </div>
                    </div>

                    <div style="height:7px;"></div>

                    <div id="AddressContainer">
                        <div class="defaultLabel">
                            <label>Address: &nbsp;</label>
                        </div>
                        <asp:TextBox ID="tb_Address" runat="server" CssClass="tb_Address" Font-Size="11"></asp:TextBox>
                        <div style="border-left:74px solid transparent;display:inline"></div>
                        <div style="display:inline">
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ErrorMessage="Too Long" ControlToValidate="tb_Address" ForeColor="Red" ValidationExpression="^.{1,100}$" Display="Dynamic" Font-Names="Arial" ValidationGroup="Update"></asp:RegularExpressionValidator>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Required" ControlToValidate="tb_Address" ForeColor="Red" Display="Dynamic" Font-Names="Arial" ValidationGroup="Update"></asp:RequiredFieldValidator>
                        </div>
                    </div>

                    <div style="height:7px;"></div>

                    <div id="ZipCodeContainer">
                        <div class="defaultLabel">
                            <label>Zip Code: &nbsp;</label>
                        </div>
                        <asp:TextBox ID="tb_ZipCode" runat="server" CssClass="tb_ZipCode" Font-Size="11"></asp:TextBox>
                        <div style="border-left:80px solid transparent;display:inline"></div>
                        <div style="display:inline">
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Invalid Zip Code" ControlToValidate="tb_ZipCode" ForeColor="Red" ValidationExpression="^\d{6}$" Display="Dynamic" Font-Names="Arial" ValidationGroup="Update"></asp:RegularExpressionValidator>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Required" ControlToValidate="tb_ZipCode" ForeColor="Red" Display="Dynamic" Font-Names="Arial" ValidationGroup="Update"></asp:RequiredFieldValidator>
                        </div>
                    </div>

                    <div style="height:7px;"></div>

                    <div id="PhoneNoContainer">
                        <div class="defaultLabel">
                            <label>Phone Number: &nbsp;</label>
                        </div>
                        <asp:TextBox ID="tb_PhoneNo" runat="server" CssClass="tb_PhoneNo" Font-Size="11"></asp:TextBox>
                        <div style="border-left:122px solid transparent;display:inline"></div>
                        <div style="display:inline">
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="Invalid Number" ControlToValidate="tb_PhoneNo" ForeColor="Red" ValidationExpression="^[89]\d{7}$" Display="Dynamic" Font-Names="Arial" ValidationGroup="Update"></asp:RegularExpressionValidator>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Required" ControlToValidate="tb_PhoneNo" ForeColor="Red" Display="Dynamic" Font-Names="Arial" ValidationGroup="Update"></asp:RequiredFieldValidator>
                        </div>
                    </div>

                    <div style="height:10px;">
                    </div>

                    <div class="title">
                        <h2>Password</h2>
                    </div>

                    <div id="PasswordContainer">
                        <div class="defaultLabel">
                            <label>Password: &nbsp;</label>
                        </div>
                        <asp:TextBox ID="tb_Password" runat="server" CssClass="tb_Password" Font-Size="11" TextMode="Password"></asp:TextBox>
                        <div style="border-left:85px solid transparent;display:inline"></div>
                    </div>

                    <div style="height:10px;">
                    </div>

                    <div id="NewPasswordContainer">
                        <div class="defaultLabel">
                            <label>New Password: &nbsp;</label>
                        </div>
                        <asp:TextBox ID="tb_NewPassword" runat="server" CssClass="tb_NewPassword" Font-Size="11" TextMode="Password"></asp:TextBox>
                        <div style="border-left:122px solid transparent;display:inline"></div>
                        <div style="display:inline">
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ErrorMessage="Max Length 20" ControlToValidate="tb_NewPassword" ForeColor="Red" ValidationExpression="^.{1,20}$" Display="Dynamic" Font-Names="Arial" ValidationGroup="Update"></asp:RegularExpressionValidator>
                        </div>
                    </div>

                    <div style="height:10px;">
                    </div>

                    <div id="ConfirmPasswordContainer">
                        <div class="defaultLabel">
                            <label>Confirm Password: &nbsp;</label>
                        </div>
                        <asp:TextBox ID="tb_ConfirmPassword" runat="server" CssClass="tb_ConfirmPassword" Font-Size="11" TextMode="Password"></asp:TextBox>
                        <div style="border-left:146px solid transparent;display:inline"></div>
                        <div style="display:inline">
                            <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Password not the same" ControlToValidate="tb_ConfirmPassword" ControlToCompare="tb_NewPassword" ForeColor="Red" Display="Dynamic" Font-Names="Arial" ValidationGroup="Update"></asp:CompareValidator>
                        </div>
                    </div>

                    <div style="height:10px;">
                    </div>

                    <div class="title">
                        <h2>About Me</h2>
                    </div>

                    <div id="AboutMeContainer">
                        <div id="AboutMeContainer2">
                            <asp:TextBox ID="tb_AboutMe" CssClass="tb_AboutMe" Font-Size="13" runat="server" TextMode="MultiLine" Font-Names="Arial" ReadOnly="False" Columns="42"></asp:TextBox>
                        </div>
                    </div>

                    <div style="height:50px;">
                    </div>
                </div>

            </div>

        </div>

        <div id="footerContainer">
            <div id="footerContainer2">
                <div id="fundsContainer">
                    <div id="fundsLabel">
                        <p class="lb_Wallet">E-Wallet: </p>
                        <asp:Label ID="lb_Wallet" CssClass="lb_Wallet" runat="server" Text="Label"></asp:Label>
                    </div>
                    <div class="buttonGap4"></div>
                    <div id="addFundsBtn">
                        <input id="btn_AddFunds" class="button2" type="button" value="Add Funds" onclick="addFunds1()"/>
                    </div>
                </div>
                <div id="footerSpace">
                    <div id="footerSpace2"></div>
                </div>
                <div id="buttonContainer">
                    <div class="buttonGap1"></div>
                    <div id="buttonContainer2">
                        <asp:Button ID="btn_update" runat="server" CssClass="button" Text="Update" OnClick="btn_update_Click" ValidationGroup="Update"/>
                        <div class="buttonGap2"></div>
                        <asp:Button ID="btn_back" runat="server" CssClass="button" Text="Back" OnClick="btn_back_Click" />
                    </div>
                    <div class="buttonGap3"></div>
                    <div id="buttonContainer3">
                        <asp:Button ID="btn_ViewTransactions" runat="server" CssClass="button2" Text="View Transactions" OnClick="btn_ViewTransactions_Click" />
                    </div>
                </div>
            </div>
            <div style="height:20px;">
            </div>
        </div>

        
        <div id="myForm">
            <div id="myFormBackground" onclick="addFunds1(), setTimeout(addFunds2, 600);">
            </div>
            <div id="myFormContainer">
                <div id="myFormContainer2">
                    <div id="myForm-Header">
                        <h1 style="color:white;">Add Funds</h1>
                    </div>
                    <div id="myForm-Content">
                        <div id="myForm-Content2">
                            <table id="myForm-Table">
                                <tr class="myForm-TableRow">
                                    <td>Username:</td>
                                    <td>
                                        <div class="addFundsTBContainer">
                                            <asp:TextBox ID="tb_AddFundsUsername" runat="server"></asp:TextBox>
                                            <br />
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Required" ControlToValidate="tb_AddFundsUsername" ValidationGroup="AddFunds" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                                        </div>
                                    </td>
                                </tr>
                                <tr class="myForm-TableRow">
                                    <td>Password:</td>
                                    <td>
                                        <div class="addFundsTBContainer">
                                            <asp:TextBox ID="tb_AddFundsPassword" runat="server" TextMode="Password"></asp:TextBox>
                                            <br />
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Required" ControlToValidate="tb_AddFundsUsername" ValidationGroup="AddFunds" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                                        </div>
                                    </td>
                                </tr>
                                <tr class="myForm-TableRow">
                                    <td colspan="2">
                                        <div id="AddFundsBtnContainer">
                                            <asp:Button ID="btn_AddingFunds" CssClass="AddFundsBtn" runat="server" Text="Add Funds" ValidationGroup="AddFunds" OnClick="btn_AddFunds_Click" />
                                        </div>
                                    </td>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>
</asp:Content>

