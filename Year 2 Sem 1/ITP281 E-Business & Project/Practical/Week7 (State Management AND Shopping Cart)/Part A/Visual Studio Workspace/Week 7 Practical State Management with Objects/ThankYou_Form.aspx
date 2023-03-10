<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ThankYou_Form.aspx.cs" Inherits="ThankYou_Form" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style3 {
            width: 10%;
        }
        .auto-style4 {
            width: 20%;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <h1>Thank You for your registration!</h1>
        
    </div>
    <table class="auto-style1">
        <tr>
            <td colspan="2">We have received your information:</td>
        </tr>
        <tr>
            <td class="auto-style3">Name :</td>
            <td>
                <asp:Label ID="lb_NAME" runat="server" Text=""></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style3">NRIC :</td>
            <td>
                <asp:Label ID="lb_NRIC" runat="server" Text=""></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style3">Mobile: </td>
            <td>
                <asp:Label ID="lb_HP" runat="server" Text=""></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style3">Email :</td>
            <td>
                <asp:Label ID="lb_EMAIL" runat="server" Text=""></asp:Label>
            </td>
        </tr>
    </table>

    <table class="auto-style1">
        <tr>
            <td class="auto-style4">Gender :</td>
            <td>
                <asp:Label ID="lb_Gender" runat="server" Text=""></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style4">Notification Method :</td>
            <td>
                <asp:Label ID="lb_Notification" runat="server" Text=""></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style4">Birthday Month :</td>
            <td>
                <asp:Label ID="lb_BirthdayMonth" runat="server" Text=""></asp:Label>
            </td>
        </tr>
    </table>

    <asp:button id="btn_BACK" runat="server" text="Back" OnClick="btn_BACK_Click" />
    </form>
</body>
</html>
