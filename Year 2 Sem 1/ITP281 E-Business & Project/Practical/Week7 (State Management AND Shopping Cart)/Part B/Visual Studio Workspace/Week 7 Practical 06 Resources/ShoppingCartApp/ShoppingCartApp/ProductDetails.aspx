<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="ProductDetails.aspx.cs" Inherits="ProductDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <h2>PRODUCT DETAILS</h2>
    <table class="auto-style3">
        <tr>
            <td rowspan="3">
                <asp:Image ID="img_Product" runat="server" Height="82px" Width="128px" />
            </td>
            <td>
                <asp:Label ID="lbl_ProdName" runat="server" Text="Label"></asp:Label>
                <br />
                <asp:Label ID="lbl_ProdDesc" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lbl_Price" runat="server" Text="Label"></asp:Label>
                <br />
                <asp:Button ID="Btn_Add" runat="server" Text="Add to Cart" OnClick="Btn_Add_Click" />
            </td>
        </tr>
        </table>
        <asp:Label ID="lbl_ProdID" runat="server" Text="Label"></asp:Label>
</asp:Content>

