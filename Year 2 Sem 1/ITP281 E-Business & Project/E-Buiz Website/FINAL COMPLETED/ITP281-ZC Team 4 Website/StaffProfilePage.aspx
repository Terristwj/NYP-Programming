<%@ Page Title="Staff" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="StaffProfilePage.aspx.cs" Inherits="StaffProfilePage" %>

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
            width:362px;
            margin-top:-2px;
            padding-left:8px;
            cursor:default;
        }

        #PositionContainer{
            width:441px;
            margin:auto;
        }

        .tb_Position{
            width:358px;
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
            height:40px;
            margin-bottom:10px;
        }

        #BtnRow2{
            width:441px;
            margin:auto;
            margin-top:-5px;
            height:40px;
            margin-bottom:10px;
        }

        #BtnRow3{
            width:441px;
            margin:auto;
            margin-top:-5px;
            height:40px;
            margin-bottom:10px;
        }

        #BtnRow4{
            width:441px;
            margin:auto;
            margin-top:-5px;
            height:40px;
            margin-bottom:10px;
        }

        .btn_EditItem{
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

        .btn_EditItem:hover{
            background: rgb(255, 238, 243);
        }

        .btn_ViewUsers{
            border:1px solid black;
            background:white;
            padding-left:8px;
            padding-right:8px;
            padding-top:5px;
            padding-bottom:5px;
            font-family:Arial;
            font-size:17px;
            cursor:pointer;
            margin-left:11px;
        }

        .btn_ViewUsers:hover{
            background: rgb(255, 238, 243);
        }

        .btn_ViewStaff{
            border:1px solid black;
            background:white;
            padding-left:8px;
            padding-right:8px;
            padding-top:5px;
            padding-bottom:5px;
            font-family:Arial;
            font-size:17px;
            cursor:pointer;
            margin-left:11px;
        }

        .btn_ViewStaff:hover{
            background: rgb(255, 238, 243);
        }

        .btn_ViewDoctors{
            border:1px solid black;
            background:white;
            padding-left:8px;
            padding-right:8px;
            padding-top:5px;
            padding-bottom:5px;
            font-family:Arial;
            font-size:17px;
            cursor:pointer;
            margin-left:10px;
        }

        .btn_ViewDoctors:hover{
            background: rgb(255, 238, 243);
        }

        .btn_ViewWalletTransactions{
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

        .btn_ViewWalletTransactions:hover{
            background: rgb(255, 238, 243);
        }

        .btn_ViewStoreTransactions{
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

        .btn_ViewStoreTransactions:hover{
            background: rgb(255, 238, 243);
        }

        .btn_ViewDoctorTransactions{
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

        .btn_ViewDoctorTransactions:hover{
            background: rgb(255, 238, 243);
        }

        .btn_ViewDoctorBookings{
            border:1px solid black;
            background:white;
            padding-left:8px;
            padding-right:8px;
            padding-top:5px;
            padding-bottom:5px;
            font-family:Arial;
            font-size:17px;
            cursor:pointer;
            margin-left:46px;
        }

        .btn_ViewDoctorBookings:hover{
            background: rgb(255, 238, 243);
        }

        .btn_ChatRooms{
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

        .btn_ChatRooms:hover{
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

        .btnContainer4{
            float:left;
            height:32px;
        }

        .btnContainer5{
            float:left;
            height:32px;
        }

        .btnContainer6{
            float:left;
            height:32px;
        }

        .btnContainer7{
            float:left;
            height:32px;
        }

        .btnContainer8{
            float:left;
            height:32px;
        }

        .btnContainer9{
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
                        <label>Staff ID: &nbsp;</label>
                    </div>
                    <asp:TextBox ID="tb_ID" runat="server" CssClass="tb_ID" Font-Size="11" ReadOnly="True"></asp:TextBox>
                    <div style="border-left:114px solid transparent;display:inline"></div>
                </div>

                <div id="PositionContainer">
                    <div class="defaultLabel">
                        <label>Position: &nbsp;</label>
                    </div>
                    <asp:TextBox ID="tb_Position" runat="server" CssClass="tb_Position" Font-Size="11" ReadOnly="True"></asp:TextBox>
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
                            <asp:Button ID="btn_EditItem" CssClass="btn_EditItem" runat="server" Text="Edit Store" OnClick="btn_EditItem_Click" />
                        </div>
                        <div class="btnContainer2">
                            <asp:Button ID="btn_ViewUsers" CssClass="btn_ViewUsers" runat="server" Text="View Users" OnClick="btn_ViewUsers_Click" />
                        </div>
                        <div class="btnContainer3">
                            <asp:Button ID="btn_ViewStaff" CssClass="btn_ViewStaff" runat="server" Text="View Staff" OnClick="btn_ViewStaff_Click" />
                        </div>
                        <div class="btnContainer4">
                            <asp:Button ID="btn_ViewDoctors" CssClass="btn_ViewDoctors" runat="server" Text="View Doctors" OnClick="btn_ViewDoctors_Click" />
                        </div>
                    </div>
                    <div id="BtnRow2">
                        <div class="btnContainer5">
                            <asp:Button ID="btn_ViewWalletTransactions" CssClass="btn_ViewWalletTransactions" runat="server" Text="View E-Wallet Transactions" OnClick="btn_ViewWalletTransactions_Click" />
                        </div>
                        <div class="btnContainer6">
                            <asp:Button ID="btn_ViewStoreTransactions" CssClass="btn_ViewStoreTransactions" runat="server" Text="View Store Transactions" OnClick="btn_ViewStoreTransactions_Click" />
                        </div>
                    </div>
                    <div id="BtnRow3">
                        <div class="btnContainer7">
                            <asp:Button ID="btn_ViewDoctorTransactions" CssClass="btn_ViewDoctorTransactions" runat="server" Text="View Doctor Transactions" OnClick="btn_ViewDoctorTransactions_Click" />
                        </div>
                        <div class="btnContainer8">
                            <asp:Button ID="btn_ViewDoctorBookings" CssClass="btn_ViewDoctorBookings" runat="server" Text="View Doctor Bookings" OnClick="btn_ViewDoctorBookings_Click" />
                        </div>
                    </div>
                    <div id="BtnRow4">
                        <div class="btnContainer9">
                            <asp:Button ID="btn_ChatRooms" CssClass="btn_ChatRooms" runat="server" Text="View Chat Rooms" OnClick="btn_ViewChatRooms_Click" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

