<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="ViewCart.aspx.cs" Inherits="ViewCart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <asp:GridView ID="gv_CartView" runat="server" AutoGenerateColumns="False" DataKeyNames="ItemID" OnRowCommand="gv_CartView_RowCommand" >
        <Columns>
            <asp:BoundField DataField="ItemID" HeaderText="Product ID" />
            <asp:BoundField DataField="Product_Name" HeaderText="Product Name" />
            <asp:TemplateField HeaderText="Quantity">
                <ItemTemplate>
                    <asp:TextBox ID="tb_Quantity" runat="server" Text='<%# Eval("Quantity") %>'></asp:TextBox>
                    <br />
                    <asp:LinkButton ID="btn_Remove" runat="server" CommandArgument='<%# Eval("ItemID") %>' CommandName="Remove">Remove</asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="Product_Price" DataFormatString="{0:C}" HeaderText="Unit Price" />
            <asp:BoundField DataField="TotalPrice" DataFormatString="{0:C}" HeaderText="Price" />
        </Columns>
    </asp:GridView>
    <br />
    Total Price =
    <asp:Label ID="lbl_TotalPrice" runat="server"></asp:Label>
    <br />
    <asp:Label ID="lbl_Error" runat="server"></asp:Label>
    <br />
    <asp:Button ID="btn_update" runat="server" OnClick="btn_update_Click" Text="Update Cart" />
    <asp:Button ID="btn_clear" runat="server" OnClick="btn_clear_Click" Text="Clear Cart" />
    <asp:Button ID="btn_back" runat="server" OnClick="btn_back_Click" Text="Back" />
</asp:Content>

