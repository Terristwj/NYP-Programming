<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Admin_ManageCompanyInfo.aspx.cs" Inherits="BitzBytez.Admin_ManageCompanyInfo" %>
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
        .tbCustom{
            padding-left:10px;
            padding-right:10px;
            width:auto;
        }
        .lbSuccess{
            padding-left:15px;
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
                <asp:TextBox ID="tb_address" CssClass="tbCustom" runat="server"></asp:TextBox>
            </h5>
            <h5>
                Contact(+65): &nbsp;
                <asp:TextBox ID="tb_contact" CssClass="tbCustom" runat="server"></asp:TextBox>
            </h5>
        </div>
        <br />
        <div class="rowRow">
            <h3>
                Store Opening Hours
            </h3>
            <h5>
                Weekdays: &nbsp;
                <asp:TextBox ID="tb_weekdays" CssClass="tbCustom" runat="server"></asp:TextBox>
            </h5>
            <h5>
                Weekends: &nbsp;
                <asp:TextBox ID="tb_weekends" CssClass="tbCustom" runat="server"></asp:TextBox>
            </h5>
        </div>
        <div class="rowRow">
            <asp:Button ID="tb_update" CssClass="btn btn-primary" runat="server" Text="Update" OnClick="tb_update_Click" />
            <asp:Label ID="lb_success" runat="server" ForeColor="#5eeb34" CssClass="lbSuccess" Text=""></asp:Label>
        </div>
    </div>
</asp:Content>
