<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Ex1.aspx.cs" Inherits="Ex1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <label>Category ID:</label>
        <asp:TextBox ID="txtCatID" runat="server"></asp:TextBox>
        <br />
        <label>Name:</label>
        <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
        <br />
        <asp:Button ID="btnRetrieve" runat="server" OnClick="btnRetrieve_Click" Text="Retrieve" />
        <asp:Button ID="btnUpdate" runat="server" OnClick="btnUpdate_Click" Text="Update" /><br />
        <br />
        <asp:Label ID="lblResult" runat="server" Width="682px"></asp:Label>&nbsp;</div>
    </form>
</body>
</html>
