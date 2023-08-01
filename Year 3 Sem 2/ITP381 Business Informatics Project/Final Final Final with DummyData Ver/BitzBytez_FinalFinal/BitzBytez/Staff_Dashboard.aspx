<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Staff_Dashboard.aspx.cs" Inherits="BitzBytez.Staff_Dashboard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        /* Debugging */
        /*.upperContainer{
            border:1px solid red;
        }
        .mainContent{
            border:1px solid red;
        }
        .mainContent_titleRow, .mainContent_row, .mainContent_buttonRow{
            border:1px solid blue;
        }
        .div_titleLabel .div_label{
            border:1px solid blue;
        }
        .div_labelSpace{
            border:1px solid pink;
        }*/
        
        .upperContainer{
            width:90%;
            margin:auto;
            justify-content:center;
            align-items:center;
        }
        .mainContent{
            width:80%;
            margin:auto;
            background:#fff;
            padding: 25px 0 25px 0;
        }
        .mainContent_titleRow1{
            line-height:12px;
        }
        .mainContent_titleRow2{
            line-height:0px;
            /*border-bottom: 1px solid black;*/
        }
        .mainContent_titleRow .div_labelSpace *{
            display:inline;
        }
        .mainContent_titleRow .div_labelSpace div{
            float:right;
        }
        .mainContent_titleRow, .mainContent_row, .mainContent_buttonRow{
            width:650px;
            margin:auto;
            padding: 15px;
            padding-bottom: 0px;
            display:flex;
            /*font-weight:bold;*/
            /*text-align:center;*/
        }
        .mainContent_buttonRow{
            width:600px;
            justify-content:center;
            text-align:center;
            display:flex;
        }
        .mainContent_buttonRow div{
            /*flex:1;*/
            padding: 0 5px 5px 5px;
        }
        .mainContent_buttonRow div input{
            width:150px; 
            min-height:54px; 
            white-space: normal;
            border:1px solid transparent;
            padding: 10px;
            border-radius:5px;
            box-shadow: 0px 2px 6px #888888;
            color:white;
            vertical-align: middle;
            height:80px;

        }
        .mainContent_buttonRow div input:hover{
            box-shadow: 0px 0px #888888;
        }
        .div_label, .div_labelSpace{
            display:inline;
            padding: 0 5px 0 5px;
            /*text-align:center;*/
            font-size: 25px;
            letter-spacing:-0.5px;
        }
        .div_titleLabel{
            flex:2;
            text-align: right;
        }
        .div_label{
            flex:2;
            /*text-align: left;*/
            text-align:center;
        }
        .div_labelSpace{
            /*flex:5;*/
        }

        .buttonSet1{
            background:#007bff;
        }
        .buttonSet1:hover{
            background:#0069d9;
        }
        .buttonSet2{
            background:#28a745;
        }
        .buttonSet2:hover{
            background:#218838;
        }
        .buttonSet3{
            background:#17a2b8;
        }
        .buttonSet3:hover{
            background:#138496;
        }
        .buttonSet4{
            background:#dc3545;
        }
        .buttonSet4:hover{
            background:#c82333;
        }

        .buttonSet5 {
            background: #8f00cc;
        }

        .buttonSet5:hover {
            background: #4a0169;
        }

        @media (max-width: 1560px) {
        }
        @media (max-width: 1100px) {
        }
        @media (max-width: 991px) { 
        }
        @media (max-width: 950px) {
        }
        @media (max-width: 740px) {
        }
        @media (max-width: 640px) {
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="upperContainer">
        <div class="mainContent">
            <div class="mainContent_titleRow mainContent_titleRow1 d-flex justify-content-center" style="padding:3px; width:300px; margin: auto; padding-top:30px;">
<%--                <div class="div_titleLabel">
                    <label>
                        Name:
                    </label>
                </div>--%>
                <div class="div_labelSpace text-center" style="text-align:center; font-size:28px;">
                    Welcome, <asp:label ID="lb_staffName" runat="server" text="" style="font-weight:bold;"></asp:label>!
                </div>
            </div>
            <div class="mainContent_titleRow mainContent_titleRow2 d-flex justify-content-center" style="padding:3px; padding-bottom:30px; padding-right:10px; width:500px; margin: auto;">
<%--                <div class="div_titleLabel">
                    <label style="line-height:35px;">
                        Role:
                    </label>
                </div>--%>
                <div class="div_labelSpace text-center" style="text-align:center; font-size:24px;">
                    You're logged in as a <asp:label ID="lb_accountType" runat="server" text="" style="line-height:35px; font-weight:bold;"></asp:label>.
                </div>
            </div>
            <div class="d-flex justify-content-center">
<%--                <asp:Button ID="btn_logout" Class="btn btn-warning" runat="server" Text="Logout" OnClick="btn_logout_Click" />--%>
                <button id="logOutBtn" class="btn btn-warning" onserverclick="btn_logout_Click" runat="server" style="font-weight:bold;">Log Out  <i class="fa fa-power-off" aria-hidden="true">  </i></button>
            </div>

            <div style="height: 20px;"></div>

            <div class="mainContent_row d-flex justify-content-center">
                <div class="div_label">
                    <label style="font-weight:bold; margin:0;">
                        Staff & Users
                    </label>
                </div>
                <div class="div_labelSpace">
                </div>
            </div>
            <div class="mainContent_buttonRow" style="padding-bottom:25px;">
                <div>
                    <asp:Button ID="btn_manageStaff" class="buttonSet1" runat="server" Text="Manage Staff" OnClick="btn_manageStaff_Click" />
                </div>
                <div>
                    <asp:Button ID="btn_viewUsers" class="buttonSet1" runat="server" Text="View Users" OnClick="btn_viewUsers_Click" />
                </div>
            </div>

            <div class="mainContent_row">
                <div class="div_label">
                    <label style="font-weight:bold; margin:0;">
                        Products
                    </label>
                </div>
                <div class="div_labelSpace">
                </div>
            </div>
            <div class="mainContent_buttonRow" style="padding-bottom:25px;">
                <%--<div>
                    <asp:Button ID="btn_manageProducts" class="buttonSet2" runat="server" Text="Manage Products" OnClick="btn_manageProducts_Click" />
                </div>
                <div>
                    <asp:Button ID="btn_productTransactions" class="buttonSet2" runat="server" Text="Product Transactions" OnClick="btn_productTransactions_Click" />
                </div>--%>
                <div style="padding: 5px;">
                    <asp:Button ID="btn_AddProduct" CssClass="buttonSet2" runat="server" Text="Add Product" OnClick="btn_AddProduct_Click"/>
                </div>
                <div style="padding: 5px;">
                    <asp:Button ID="btn_AddBuiltPCInfo" CssClass="buttonSet2" runat="server" Text="Add B.T.O PC Information" OnClick="btn_AddBuiltPCInfo_Click"/>
                </div>
                <div style="padding: 5px;">
                    <asp:Button ID="btn_AddWarrantyInfo" CssClass="buttonSet2" runat="server" Text="Add Warranty Information" OnClick="btn_AddWarrantyInfo_Click"/>
                </div>

            </div>

            <div class="mainContent_row">
                <div class="div_label">
                    <label style="font-weight:bold; margin:0;">
                        Services
                    </label>
                </div>
                <div class="div_labelSpace">
                </div>
            </div>
            <div class="mainContent_buttonRow" style="padding-bottom:25px;">
                <div>
                    <asp:Button ID="btn_manageServices" class="buttonSet3" runat="server" Text="Manage Services" OnClick="btn_manageServices_Click" />
                </div>
                <div>
                    <asp:Button ID="btn_serviceTransactions" class="buttonSet3" runat="server" Text="Service Transactions" OnClick="btn_serviceTransactions_Click" />
                </div>
            </div>

            <div class="mainContent_row">
                <div class="div_label">
                    <label style="font-weight:bold; margin:0;">
                        Site Management
                    </label>
                </div>
                <div class="div_labelSpace">
                </div>
            </div>
            <div class="mainContent_buttonRow" style="padding-bottom:25px;">
                <div>
                    <asp:Button ID="btn_manageSiteConent" class="buttonSet4" runat="server" Text="Manage Site Content" OnClick="btn_manageSiteConent_Click" />
                </div>
                <div>
                    <asp:Button ID="btn_postInfo" class="buttonSet4" runat="server" Text="Post Info" OnClick="btn_postInfo_Click" />
                </div>
            </div>

            <div class="mainContent_row">
                <div class="div_label">
                    <label style="font-weight:bold; margin:0;">
                        Customer Service
                    </label>
                </div>
                <div class="div_labelSpace">
                </div>
            </div>
            <div class="mainContent_buttonRow" style="padding-bottom:25px;">
                <div>
                    <asp:Button ID="btn_CSRequests" class="buttonSet5" runat="server" Text="Chat Support Requests" OnClick="btn_CSRequests_Click" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>


