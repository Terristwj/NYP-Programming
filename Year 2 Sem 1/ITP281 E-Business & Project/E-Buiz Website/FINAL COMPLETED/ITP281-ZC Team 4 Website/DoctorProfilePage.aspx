<%@ Page Title="Doctor" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="DoctorProfilePage.aspx.cs" Inherits="DoctorProfilePage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script>
        function getPageNum() {
            return 3;
        }
    </script>
    <style>
        #extraDiv{
            border:1px transparent solid;
        }

        #ProfileContainer{
        }

        .containers{
            width:620px;
            margin:auto;
        }

        .title{
            width:443px;
            margin:auto;
            text-decoration:underline;
            margin-bottom:-5px;
        }

        .defaultLabel{
            float:left;
            font-family: Arial;
        }

        #nameContainer{
            width:441px;
            margin:auto;
        }

        .tb_name{
            width:316px;
            margin-top:-2px;
            padding-left:8px;
            cursor:default;
        }

        #IDContainer{
            width:441px;
            margin:auto;
        }

        .tb_ID{
            width:348px;
            margin-top:-2px;
            padding-left:8px;
            cursor:default;
        }

        #ConsultsContainer{
            width:441px;
            margin:auto;
        }

        .tb_Consults{
            width:315px;
            margin-top:-2px;
            padding-left:8px;
            cursor:default;
        }

        #signOutContainer{
            width:441px;
            margin:auto;
        }

        .btnSignOut{
            border:1px solid black;
            background:white;
            padding-left:8px;
            padding-right:8px;
            padding-top:3px;
            padding-bottom:3px;
            width:84.5px;
            font-family:Arial;
            font-size:17px;
            cursor:pointer;
        }

        .btnSignOut:hover{
            background: rgb(255, 238, 243);
        }

        #BtnRow1{
            width:441px;
            margin:auto;
            margin-top:-5px;
            height:70px;
            margin-bottom:10px;
        }

        .btn_CreateRoom{
            border:1px solid black;
            background:white;
            padding-left:8px;
            padding-right:8px;
            padding-top:5px;
            padding-bottom:5px;
            font-family:Arial;
            font-size:17px;
            cursor:pointer;
        }

        .btn_CreateRoom:hover{
            background: rgb(255, 238, 243);
        }

        .btn_ViewBooking{
            border:1px solid black;
            background:white;
            padding-left:8px;
            padding-right:8px;
            padding-top:5px;
            padding-bottom:5px;
            font-family:Arial;
            font-size:17px;
            cursor:pointer;
            margin-left:15px;
        }

        .btn_ViewBooking:hover{
            background: rgb(255, 238, 243);
        }

        .btn_ViewConsults{
            border:1px solid black;
            background:white;
            padding-left:8px;
            padding-right:8px;
            padding-top:5px;
            padding-bottom:5px;
            font-family:Arial;
            font-size:17px;
            cursor:pointer;
            margin-left:15px;
        }

        .btn_ViewConsults:hover{
            background: rgb(255, 238, 243);
        }

        .btnContainer1{
            float:left;
            height:32px;
        }

        .btnContainer2{
            float:left;
            height:32px;
        }

        .btnContainer3{
            float:left;
            height:32px;
        }

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="extraDiv">
        <div id="ProfileContainer">
            <div class="containers">
                <div style="height:10px;">
                </div>
                <div class="title">
                    <h2>Account</h2>
                </div>
                <div id="nameContainer">
                    <div class="defaultLabel">
                        <label>Display Name: &nbsp;</label>
                    </div>
                    <asp:TextBox ID="tb_name" runat="server" CssClass="tb_name" Font-Size="11" ReadOnly="True"></asp:TextBox>
                    <div style="border-left:114px solid transparent;display:inline"></div>
                </div>

                <div style="height:5px;">
                </div>

                <div id="IDContainer">
                    <div class="defaultLabel">
                        <label>Doctor ID: &nbsp;</label>
                    </div>
                    <asp:TextBox ID="tb_ID" runat="server" CssClass="tb_ID" Font-Size="11" ReadOnly="True"></asp:TextBox>
                    <div style="border-left:114px solid transparent;display:inline"></div>
                </div>

                <div id="ConsultsContainer">
                    <div class="defaultLabel">
                        <label>Total Consults: &nbsp;</label>
                    </div>
                    <asp:TextBox ID="tb_Consults" runat="server" CssClass="tb_Consults" Font-Size="11" ReadOnly="True"></asp:TextBox>
                    <div style="border-left:114px solid transparent;display:inline"></div>
                </div>

                <div id="signOutContainer">
                    <asp:Button ID="btn_SignOut" CssClass="btnSignOut" runat="server" Text="Sign Out" OnClick="btn_SignOut_Click" />
                </div>

                <div style="height:10px;">
                </div>

                <div class="title">
                    <h2>Controls</h2>
                    <div id="BtnRow1">
                        <div class="btnContainer1">
                            <asp:Button ID="btn_CreateRoom" CssClass="btn_CreateRoom" runat="server" Text="Create Room" OnClick="btn_CreateRoom_Click" />
                        </div>
                        <div class="btnContainer2">
                            <asp:Button ID="btn_ViewBooking" CssClass="btn_ViewBooking" runat="server" Text="View Bookings" OnClick="btn_ViewBooking_Click" />
                        </div>
                        <div class="btnContainer3">
                            <asp:Button ID="btn_ViewConsults" CssClass="btn_ViewConsults" runat="server" Text="View Consults" OnClick="btn_ViewConsults_Click" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

