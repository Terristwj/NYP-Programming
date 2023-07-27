<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ProductView.aspx.cs" Inherits="ABCHealth.ProductView" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:GridView ID="gvProduct" runat="server" AutoGenerateColumns="False" 
        onselectedindexchanged="gvProduct_SelectedIndexChanged">
        <Columns>
            <asp:BoundField DataField="Product_ID" HeaderText="Product Ref" />
            <asp:BoundField DataField="Product_Name" HeaderText="Product Name" />
            <asp:BoundField DataField="Unit_Price" HeaderText="Unit Price" />
            <asp:CommandField ShowSelectButton="True" />
        </Columns>
</asp:GridView>
</asp:Content>
