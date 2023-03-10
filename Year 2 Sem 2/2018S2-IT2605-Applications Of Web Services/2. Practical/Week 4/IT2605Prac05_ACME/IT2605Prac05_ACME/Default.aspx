<%@ Page Title="" Language="C#" MasterPageFile="~/ACME.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="IT2605Prac05_ACME.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2>Books List</h2>
    <asp:GridView ID="GridViewBookList" runat="server" AutoGenerateColumns="False">
        <Columns>
            <asp:BoundField DataField="id" HeaderText="ID" SortExpression="id" />
            <asp:BoundField DataField="title" HeaderText="Title" SortExpression="title" />
            <asp:BoundField DataField="lastName" HeaderText="Author" SortExpression="lastName" />
            <asp:BoundField DataField="name" HeaderText="Publisher" SortExpression="name" />
            <asp:BoundField DataField="isbn" HeaderText="ISBN" SortExpression="isbn" />
            <asp:BoundField DataField="RetailPrice" DataFormatString="{0:C}" HeaderText="Price" SortExpression="RetailPrice" />
        </Columns>
    </asp:GridView>
    
</asp:Content>
