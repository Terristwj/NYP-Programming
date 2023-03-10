<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Bonus.aspx.cs" Inherits="RedStoreWeb.Bonus" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <h1>Staff Bonus Budgeting By Store</h1>
        <label>Store Id:</label>
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        <label>Budgeting Rate:</label>
        <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
        <asp:Button ID="Button1" runat="server" Text="Compute" OnClick="Button1_Click" />
        <br /><br />
        <asp:Label ID="Label1" runat="server" Text="LabaelErr"></asp:Label>
        <br />
        <h1>Staff Bonus</h1>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False">
            <Columns>
                <asp:BoundField DataField="StaffId" HeaderText="Staff Id" SortExpression="StaffId" />
                <asp:BoundField DataField="StaffName" HeaderText="Staff Name" SortExpression="StaffName" />
                <asp:BoundField DataField="StoreId" HeaderText="Store" SortExpression="StoreId" />
                <asp:BoundField DataField="YTDSales" DataFormatString="{0:C}" HeaderText="YTD Sales" SortExpression="YTDSales" />
                <asp:BoundField DataField="Bonus" DataFormatString="{0:C}" HeaderText="Bonus" SortExpression="Bonus" />
            </Columns>
        </asp:GridView>
    </div>
    </form>
</body>
</html>
