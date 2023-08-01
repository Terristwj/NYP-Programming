﻿<%@ Page Title="About Us" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="AboutUs.aspx.cs" Inherits="BitzAndBytez.AboutUs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .content_Container{
            width:90%;
            margin:auto;
            background-color: rgba(0,0,0,0.7);
            padding:50px;
        }
        .rowRow{
            width:100%;
            color:white;
            margin-bottom:30px;
        }
        .rowRow h3{
            text-decoration:underline;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="content_Container">
        <div class="rowRow">
            <h3>
                About
            </h3>
            <p>
                In Bitz&Bytez, we sell computer parts and offer PC related services.
                <br />
                Interester in building a PC or have problems? Come and take a look at our website and store!
            </p>
        </div>
        <div class="rowRow">
            <h5>
                Address: &nbsp;
                <asp:Label ID="lb_address" runat="server" Text=""></asp:Label>
            </h5>
            <h5>
                Contact(+65): &nbsp;
                <asp:Label ID="lb_contact" runat="server" Text=""></asp:Label>
            </h5>
        </div>
        <br />
        <div class="rowRow">
            <h3>
                Store Opening Hours
            </h3>
            <h5>
                Weekdays: &nbsp;
                <asp:Label ID="lb_weekDay" runat="server" Text=""></asp:Label>
            </h5>
            <h5>
                Weekends: &nbsp;
                <asp:Label ID="lb_weekEnd" runat="server" Text=""></asp:Label>
            </h5>
        </div>
    </div>
</asp:Content>
