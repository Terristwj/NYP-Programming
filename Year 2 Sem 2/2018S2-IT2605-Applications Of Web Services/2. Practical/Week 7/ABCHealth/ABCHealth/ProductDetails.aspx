<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ProductDetails.aspx.cs" Inherits="ABCHealth.ProductDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>
        Product Details</h2>
    
        <table style="width: 372px">
            <tr>
                <td rowspan="3">
                    <asp:Image ID="img_Product" runat="server" Width="100px" />
                </td>
                <td style="width: 300px">
                    <asp:Label ID="lbl_ProdName" runat="server" Font-Bold="True"></asp:Label>
                    &nbsp;
                    <br />
                    <asp:Label ID="lbl_ProdDesc" runat="server" Text=""></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lbl_Price" runat="server" Font-Bold="True"></asp:Label>
                    <br />
                    <br />
                    <asp:Button ID="Btn_Add" runat="server" onclick="Btn_Add_Click" 
                        Text="Add to Cart" />
                </td>
            </tr>
        </table>
        <em>Product ID :</em>
    <asp:Label ID="lbl_ProdID" runat="server" style="font-style: italic" 
        Text="(prod_id)"></asp:Label>
        <br />
<br />
<asp:Button ID="btn_productlist" runat="server" onclick="btn_productlist_Click" 
    Text="Back to product listing" />
        <br />
    
</asp:Content>
