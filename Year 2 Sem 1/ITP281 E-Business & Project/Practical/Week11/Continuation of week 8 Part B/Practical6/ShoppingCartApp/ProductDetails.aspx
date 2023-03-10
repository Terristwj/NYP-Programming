<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="ProductDetails.aspx.cs" Inherits="ProductDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
        <p>
        PRODUCT DETAILS</p>
    <table class="auto-style3">
        <tr>
            <td class="auto-style4" rowspan="3">
                <asp:Image ID="img_Product" runat="server" Height="107px" Width="182px" />
            </td>
            <td>
                <asp:Label ID="lbl_ProdName" runat="server"></asp:Label>
                <br />
                <asp:Label ID="lbl_ProdDesc" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lbl_Price" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Button ID="Btn_Add" runat="server" OnClick="Btn_Add_Click" Text="Add to Cart" />
            </td>
        </tr>
    </table>
    <br />
    Product ID = <asp:Label ID="lbl_ProdID" runat="server"></asp:Label>
</asp:Content>

