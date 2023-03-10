<%@ Page Title="" Language="C#" MasterPageFile="~/ACME.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="IT2605Prac05_ACME.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2>Books List</h2>
    <asp:GridView ID="GridViewBookList" runat="server" AutoGenerateColumns="False" DataKeyNames="id" OnSelectedIndexChanged="GridViewBookList_SelectedIndexChanged">
        <Columns>
            <asp:BoundField DataField="id" HeaderText="ID" SortExpression="id" />
            <asp:BoundField DataField="title" HeaderText="Title" SortExpression="title" />
            <asp:BoundField DataField="lastName" HeaderText="Author" SortExpression="lastName" />
            <asp:BoundField DataField="name" HeaderText="Publisher" SortExpression="name" />
            <asp:BoundField DataField="isbn" HeaderText="ISBN" SortExpression="isbn" />
            <asp:BoundField DataField="RetailPrice" DataFormatString="{0:C}" HeaderText="Price" SortExpression="RetailPrice" />
            <asp:CommandField ShowSelectButton="True" />
        </Columns>
    </asp:GridView>
    <h2>Book Details</h2>
    <asp:DetailsView ID="DetailsViewBookDetails" runat="server" Height="50px" Width="125px" AutoGenerateRows="False">
        <Fields>
            <asp:BoundField DataField="title" HeaderText="Title" />
            <asp:BoundField DataField="lastName" HeaderText="Autor" />
            <asp:BoundField DataField="isbn" HeaderText="ISBN" />
            <asp:BoundField DataField="name" HeaderText="Publisher" />
            <asp:BoundField DataField="RetailPrice" HeaderText="Promotion Price" />
            <asp:BoundField DataField="price" HeaderText="Cost Price" />
        </Fields>
    </asp:DetailsView>
</asp:Content>
