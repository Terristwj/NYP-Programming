<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Staff_HomePage.aspx.cs" Inherits="BitzBytez.Staff_HomePage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container" style="background: white; height: 100vh">
        <div style="padding: 50px; padding-bottom: 10px; text-align: center">
            <h1 style="font-weight: bold;">Dashboard</h1>
        </div>
        <div id="div_Manager" class="d-flex justify-content-center" runat="server">
            <div style="padding: 5px;">
                <asp:Button ID="btn_AddProduct" CssClass="btn btn-primary" runat="server" Text="Add Product" OnClick="btn_AddProduct_Click" /></div>
            <div style="padding: 5px;">
                <asp:Button ID="btn_CSRequests" CssClass="btn btn-primary" runat="server" Text="Chat Support Requests" OnClick="btn_CSRequests_Click" /></div>
            <div style="padding: 5px;">
                <asp:Button ID="btn_AddBuiltPCInfo" CssClass="btn btn-primary" runat="server" Text="Add B.T.O PC Information" OnClick="btn_AddBuiltPCInfo_Click" />
            </div>
            <div style="padding: 5px;">
                <asp:Button ID="btn_AddWarrantyInfo" CssClass="btn btn-primary" runat="server" Text="Add Warranty Information" OnClick="btn_AddWarrantyInfo_Click" />
            </div>
        </div>
        <div id="div_CSO" runat="server">
            <asp:Button ID="btn_CSRequests_CSO" CssClass="btn btn-primary" runat="server" Text="Chat Support Requests" OnClick="btn_CSRequests_Click" />
        </div>
    </div>
</asp:Content>
