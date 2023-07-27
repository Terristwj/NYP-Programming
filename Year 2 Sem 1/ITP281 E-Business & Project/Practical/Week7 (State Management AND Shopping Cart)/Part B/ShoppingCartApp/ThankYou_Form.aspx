<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ThankYou_Form.aspx.cs" Inherits="ThankYou_Form" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <h1>Thank You for your registration!</h1>
        We have received your information:<br />
        Name&nbsp; :
        <asp:Label ID="lbl_CustName" runat="server"></asp:Label>
        <br />
        NRIC&nbsp; :
        <asp:Label ID="lbl_NRIC" runat="server"></asp:Label>
        <br />
        Mobile :
        <asp:Label ID="lbl_Hp" runat="server"></asp:Label>
        <br />
        Email&nbsp;&nbsp; :&nbsp;
        <asp:Label ID="lbl_Email" runat="server"></asp:Label>
        <br />
        <br />
        Gender :
        <asp:Label ID="lbl_Gender" runat="server"></asp:Label>
        <br />
        Notification Method : <asp:Label ID="lbl_Notifications" runat="server"></asp:Label>
        <br />
        Birthday Month :
        <asp:Label ID="lbl_BirthdayMonth" runat="server"></asp:Label>
        <br />
        <br />
        <br />
        <asp:Button ID="btn_Back" runat="server" OnClick="btn_Back_Click" Text="Back" Width="137px" />
        <br />
        <br />
        <br />
    
    </div>
    </form>
</body>
</html>
