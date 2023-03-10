<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="ProductInsert.aspx.cs" Inherits="ProductInsert" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style type="text/css">
        .auto-style3 {
            width: 140px;
        }
        .auto-style4 {
            width: 140px;
            height: 21px;
        }
        .auto-style5 {
            height: 21px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <table class="auto-style2">
        <tr>
            <td class="auto-style3">Product ID</td>
            <td>
                <asp:TextBox ID="tb_ProductID" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style3">Product Name</td>
            <td>
                <asp:TextBox ID="tb_ProductName" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style3">Product Desc</td>
            <td>
                <asp:TextBox ID="tb_ProductDesc" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style3">Unit Price</td>
            <td>
                <asp:TextBox ID="tb_UnitPrice" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style3">Stock Level</td>
            <td>
                <asp:TextBox ID="tb_StockLevel" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style4">Product Image</td>
            <td class="auto-style5">
                <asp:FileUpload ID="FileUpload1" runat="server" />
            </td>
        </tr>
        <tr>
            <td class="auto-style3">&nbsp;</td>
            <td>
                <asp:Label ID="lbl_Result" runat="server" Text=""></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style3">&nbsp;</td>
            <td>
                <asp:Button ID="btn_Insert" runat="server" Text="Insert" OnClick="btn_Insert_Click" />
                <asp:Button ID="btn_ProductView" runat="server" Text="View Product List" OnClick="btn_ProductView_Click" />
            </td>
        </tr>
    </table>
</asp:Content>

