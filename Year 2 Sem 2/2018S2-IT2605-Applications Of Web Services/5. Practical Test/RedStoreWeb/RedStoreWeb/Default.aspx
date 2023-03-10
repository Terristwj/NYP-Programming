<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="RedStoreWeb.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <h1>Red Store Sales</h1>
        <asp:GridView ID="GV_AllSales" runat="server" AutoGenerateColumns="False" DataKeyNames="StaffId" OnSelectedIndexChanged="GV_AllSales_SelectedIndexChanged">
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
                <asp:BoundField DataField="StaffId" HeaderText="StaffId" SortExpression="StaffId" />
                <asp:BoundField DataField="StaffName" HeaderText="StaffName" SortExpression="StaffName" />
                <asp:BoundField DataField="StoreId" HeaderText="StoreId" SortExpression="StoreId" />
                <asp:BoundField DataField="YTDSales" HeaderText="YTDSales" SortExpression="YTDSales" />
            </Columns>
        </asp:GridView>
        <br />
        <br />
        <h1>Staff YTD Sales</h1>
        <asp:DetailsView ID="DV_StaffSales" runat="server" Height="50px" Width="125px" AutoGenerateRows="False">
            <Fields>
                <asp:BoundField DataField="StaffId" HeaderText="StaffId" SortExpression="StaffId" />
                <asp:BoundField DataField="StaffName" HeaderText="StaffName" SortExpression="StaffName" />
                <asp:BoundField DataField="StoreLoc" HeaderText="StoreLoc" SortExpression="StoreLoc" />
                <asp:BoundField DataField="YTDSales" HeaderText="YTDSales" SortExpression="YTDSales" />
            </Fields>
        </asp:DetailsView>
    </div>
    </form>
</body>
</html>
