<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="NYP.Login1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>FLY-TA Login</title>
    <link rel="icon" href="~/Images/Favicon.jpg" type="image/gif" />
    <style>
        #form1{
            margin-left:-8px;
            margin-right:-8px;
            margin-top:-8px;
        }

        #Header{
            /*background:red;*/
            height:120px;
            width:100%;
            border-bottom:1px solid black;
        }

        #Background{
            position:absolute;
            height:120px;
            width:100%;
            top:0;
            z-index:0;
            opacity:0.5
        }

        #img_Headerbackground{
            width:100%;
            height:100%;
        }

        #LogoContainer{
            position:absolute;
            height:125px;
            width:100%;
            z-index:1;
        }

        #Logo{
            width:150px;    /*Witdh to Height: 1.5 to 1*/
            height:100px;
            margin:auto;
            padding-top:7px;
            /*background:blue;*/
        }

        #img_FLYTALogo{
            width:100%;
            height:100%;
            border:1px solid grey;
            cursor:pointer;
        }

        #Menu{
            margin-top:0px;
            background:white;
            width:100%;
            height:38px;
            border-bottom:1px solid black;
        }

        #Menu-Item{
            margin-top:0px;
            text-align:center;
            font-family:Cambria;
            font-weight:bold;
            font-size:18px;
            padding-top:8px;
            padding-bottom:8px;
            cursor:pointer;
            color:darkslategrey;
        }

        #Menu-Item:hover{
            background:#f2f2f2;
            color:black;
        }
        a{
            text-decoration:none;
        }

        #Content{
            background:linear-gradient(180deg, rgba(224, 255, 255, 0.25) 0%, rgba(255, 255, 255, 1) 25%, rgba(255, 255, 255, 1) 75%, rgba(225, 255, 255, 0.25) 100%);
            min-height:700px;
            width:100%;
            padding-top:40px;
        }
        #LoginTable{
            background:white;
            border:1px solid black;
            width:500px;
            margin:auto;
        }
        .table {
            width: 100%;
            font-family:Arial;
        }

        .leftCol{
            text-align:right;
            padding-top:4px;
            padding-bottom:4px;
            margin-left:25px;
        }

        #buttonContainer{
            width:50px;
            margin:auto;
            margin-bottom:10px;
        }

        #btn_Login{
            width:100%;
            height:100%;
            padding-top:3px;
            padding-bottom:3px;
            padding-left:2px;
            padding-right:2px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <div id="Header">
            <div id="LogoContainer">
                <div id="Logo">
                    <a href="Login.aspx">
                        <img ID="img_FLYTALogo" alt="NYP Logo" src="/Images/FLY-TA Logo.png" />
                    </a>
                </div>
            </div>
            <div id="Background">
                <img ID="img_Headerbackground" alt="background" src="/Images/background.jpg" />
            </div>
        </div>
        <div id="Menu">
            <a href="Login.aspx">
                <p id="Menu-Item">
                    <asp:Label ID="lb_MenuItem" runat="server" Text="Staff Login"></asp:Label>
                </p>
            </a>
        </div>
        <div id="Content">
            <div id="LoginTable">
                <table class="table">
                    <tr>
                        <td>
                            <div class="leftCol">
                                <p>Staff ID:</p>
                            </div>
                        </td>
                        <td>
                            <asp:TextBox ID="tb_AdminNo" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div class="leftCol">
                                <p>Password:</p>
                            </div>
                        </td>
                        <td>
                            <asp:TextBox ID="tb_Name" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <div id="buttonContainer">
                                <asp:Button ID="btn_Login" runat="server" Text="Login" OnClick="btn_Login_Click" />
                            </div>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
    </form>
</body>
</html>
