<%@ Page Title="Dashboard" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Staff_Dashboard.aspx.cs" Inherits="BitzAndBytez.Staff_Dashboard" %>
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
            line-height:10px;
        }
        .mainContent_titleRow2{
            line-height:0px;
            border-bottom: 1px solid black;
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
            padding: 5px 0 5px 0;
            display:flex;
        }
        .mainContent_buttonRow{
            width:600px;
            justify-content:center;
            text-align:center;
            display:flex;
        }
        .mainContent_buttonRow div{
            flex:1;
            padding: 0 15px 20px 15px;
        }
        .mainContent_buttonRow div input{
            width:150px; 
            min-height:54px; 
            white-space: normal;
            border:1px solid transparent;
            padding: 15px;
            border-radius:5px;
            box-shadow: 0px 5px 8px #888888;
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
        }
        .div_titleLabel{
            flex:2;
            text-align: right;
        }
        .div_label{
            flex:2;
            text-align: left;
        }
        .div_labelSpace{
            flex:5;
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
            <div class="mainContent_titleRow mainContent_titleRow1">
                <div class="div_titleLabel">
                    <label>
                        Staff Name:
                    </label>
                </div>
                <div class="div_labelSpace">
                    <asp:label ID="lb_staffName" runat="server" text=""></asp:label>
                </div>
            </div>
            <div class="mainContent_titleRow mainContent_titleRow2">
                <div class="div_titleLabel">
                    <label style="line-height:35px;">
                        Account Type:
                    </label>
                </div>
                <div class="div_labelSpace">
                    <asp:label ID="lb_accountType" runat="server" text="" style="line-height:35px;"></asp:label>
                    <div>
                        <asp:Button ID="btn_logout" Class="btn btn-primary" runat="server" Text="Logout" OnClick="btn_logout_Click" />
                    </div>
                </div>
            </div>

                <div style="height:20px;"></div>
                <div class="mainContent_row">
                    <div class="div_label">
                        <label>
                            Staff & Users:
                        </label>
                    </div>
                    <div class="div_labelSpace">
                    </div>
                </div>
                <div class="mainContent_buttonRow">
                    <div>
                        <asp:Button ID="btn_manageStaff" class="buttonSet1" runat="server" Text="Manage Staff" OnClick="btn_manageStaff_Click" />
                    </div>
                    <div>
                        <asp:Button ID="btn_viewUsers" class="buttonSet1" runat="server" Text="View Users" OnClick="btn_viewUsers_Click" />
                    </div>
                </div>

                <div class="mainContent_row">
                    <div class="div_label">
                        <label>
                            Products:
                        </label>
                    </div>
                    <div class="div_labelSpace">
                    </div>
                </div>
                <div class="mainContent_buttonRow">
                    <div>
                        <asp:Button ID="btn_manageProducts" class="buttonSet2" runat="server" Text="Manage Products" OnClick="btn_manageProducts_Click" />
                    </div>
                    <div>
                        <asp:Button ID="btn_productTransactions" class="buttonSet2" runat="server" Text="Product Transactions" OnClick="btn_productTransactions_Click" />
                    </div>
                </div>
            
                <div class="mainContent_row">
                    <div class="div_label">
                        <label>
                            Services:
                        </label>
                    </div>
                    <div class="div_labelSpace">
                    </div>
                </div>
                <div class="mainContent_buttonRow">
                    <div>
                        <asp:Button ID="btn_manageServices" class="buttonSet3" runat="server" Text="Manage Services" OnClick="btn_manageServices_Click" />
                    </div>
                    <div>
                        <asp:Button ID="btn_serviceTransactions" class="buttonSet3" runat="server" Text="Service Transactions" OnClick="btn_serviceTransactions_Click" />
                    </div>
                </div>

                <div class="mainContent_row">
                    <div class="div_label">
                        <label>
                            Site Management:
                        </label>
                    </div>
                    <div class="div_labelSpace">
                    </div>
                </div>
                <div class="mainContent_buttonRow">
                    <div>
                        <asp:Button ID="btn_manageSiteConent" class="buttonSet4" runat="server" Text="Manage Site Content" OnClick="btn_manageSiteConent_Click" />
                    </div>
                    <div>
                        <asp:Button ID="btn_postInfo" class="buttonSet4" runat="server" Text="Post Info" OnClick="btn_postInfo_Click"/>
                    </div>
                </div>
        </div>
    </div>
</asp:Content>