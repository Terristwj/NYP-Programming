<%@ Page Title="FLY-TA Staff" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Account.aspx.cs" Inherits="NYP.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        #Content{
            background:linear-gradient(180deg, rgba(224, 255, 255, 0.25) 0%, rgba(255, 255, 255, 1) 25%, rgba(255, 255, 255, 1) 75%, rgba(225, 255, 255, 0.25) 100%);
            min-height:700px;
            width:100%;
            padding-top:40px;
        }

        #container1{
            border:1px solid black;
            width:300px;
            height:110px;
            margin:auto;
            padding-top:30px;
        }

        #container2{
            text-align:center;
            font-family:Arial;
            font-size:18px;
            padding-top:5px;
            padding-bottom:8px;
        }

        .p{
            text-decoration:underline;
            display:inline;
        }

        #container3{
            width:200px;
            margin:auto;
        }

        .button1, .button2{
            border:1px solid black;
            cursor:pointer;
            background:white;
            font-family:Arial;
            font-size:18px;
            width:90px;
            padding:2px;
        }

        .button1{
            float:left;
        }

        .button2{
            float:right;
        }

        .button1:hover, .button2:hover{
            background:#f2f2f2;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="Content">
        <div id="container1">
            <div id="container2">
                <p class="p">OSEP Functions</p>
            </div>
            <div id="container3">
                <asp:Button ID="btn_Create" runat="server" Text="Create" OnClick="btn_Create_Click" CssClass="button1" />
                <asp:Button ID="btn_View" runat="server" Text="View" OnClick="btn_View_Click" CssClass="button2" />
            </div>
        </div>
    </div>
</asp:Content>
