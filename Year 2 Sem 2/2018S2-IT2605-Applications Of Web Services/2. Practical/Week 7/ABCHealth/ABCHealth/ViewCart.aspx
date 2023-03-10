<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ViewCart.aspx.cs" Inherits="ABCHealth.ViewCart" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

   

    <asp:GridView ID="gvCartView" runat="server" AutoGenerateColumns="False" 
        DataKeyNames="ItemID" onrowcommand="gvCartView_RowCommand" 
        onrowdatabound="gvCartView_RowDataBound">
    <Columns>
        <asp:BoundField DataField="ItemID" HeaderText="Product ID" />
        <asp:BoundField DataField="Product_Name" DataFormatString="{0:C}" 
            HeaderText="Product Name" />
        <asp:TemplateField HeaderText="Quantity">
            <ItemTemplate>
                <asp:TextBox ID="tb_Quantity" runat="server" Text='<%# Eval("Quantity") %>' 
                    Height="22px" Width="72px"></asp:TextBox>
                <br />
                <asp:LinkButton ID="Btn_Remove" runat="server" 
                    CommandName="Remove" CommandArgument='<%# Eval("ItemID") %>'>Remove</asp:LinkButton>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:BoundField DataField="Product_Price" DataFormatString="{0:C}" 
            HeaderText="Unit Price" />
        <asp:BoundField DataField="TotalPrice" DataFormatString="{0:C}" 
            HeaderText="Price" />
    </Columns>
</asp:GridView>
    <br />
    Total Price :
    <asp:Label ID="lbl_TotalPrice" runat="server" Text="$0"></asp:Label>
    <br />
    <br />
    <asp:Label ID="lb_error" runat="server"></asp:Label>

   

    

   

    <br />
    <asp:Button ID="btn_update" runat="server" 
        Text="Update Cart" onclick="btn_update_Click" />
&nbsp;<asp:Button ID="btn_clear" runat="server" onclick="btn_clear_Click" 
        Text="Clear Cart" />

   

&nbsp;<asp:Button ID="btn_Back" runat="server" onclick="btn_Back_Click" 
        Text="Back" />
&nbsp;<asp:Button ID="btn_Order" runat="server" Text="Order" OnClick="btn_Order_Click" />
   

</asp:Content>
