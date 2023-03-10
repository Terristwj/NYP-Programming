<%@ Page Title="Preserved Chat" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="PreservedDoctorChatRoom.aspx.cs" Inherits="PreservedDoctorChatRoom" %>

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

        .content{
            min-height:820px;
            height:auto;
        }

        .chatBoxContainer{
            border:1px solid black;
            height:600px;
            width:600px;
            margin:auto;
            margin-top:20px;
            margin-bottom:20px;
        }

        .leftContainer{
            border:1px solid black;
            border-right:1px solid transparent;
            float:left;
            width:150px;
            height:100%;
        }

        .rightContainer{
            border:1px solid black;
            float:left;
            width:446px;
            height:100%;
            overflow: hidden;
        }

        .messageContainer{
            border:1px solid black;
            height:541px;
            overflow-y: scroll;
            overflow-x:hidden;
            width:460px;
            font-family:Arial;
            font-size:20px;
        }

        .gv_header{
            display:none;
        }

        .name1{
            width:100px;
            text-align:center;
        }

        .name2{
            width:100px;
            text-align:center;
        }

        .message{
            width:234px;
            text-align:center;
            padding-top:5px;
            padding-bottom:5px;
        }

        .tb_Message{
            width:302px;
            height:50px;
            font-size:25px;
            font-family:Arial;
            padding-left:10px;
            float:left;
        }

        .btn_Send{
            height:56px;
            width:130px;
            font-size:22px;
            font-family:Arial;
            border:1px solid black;
            background:white;
            float:left;
            cursor:pointer;
        }

        .btn_Send:hover{
            background:rgb(255, 235, 238);
        }

        .dl_RoomUsers{
            width:100%;
        }

        .roomUserTitle{
            border:1px solid transparent;
            border-bottom:1px solid black;
            width:100%;
            font-size:18px;
            font-family:Arial;
            padding-top:6px;
            padding-bottom:6px;
            text-align:center;
        }

        .userType{
            width:140px;
            font-size:18px;
            font-family:Arial;
            padding-top:5px;
            padding-bottom:1px;
            padding-left:5px;
        }

        .roomUser{
            width:140px;
            font-size:18px;
            font-family:Arial;
            padding-top:5px;
            padding-bottom:20px;
            padding-left:5px;
        }

        .buttonContainer{
            width:600px;
            margin:auto;
            margin-top:22px;
        }

        .buttonContainer1{
            width:60px;
            margin:auto;
        }

        .btn_Exit{
            border:1px solid black;
            background:white;
            font-family:Arial;
            font-size:17px;
            padding-top:7px;
            padding-bottom:7px;
            padding-left:15px;
            padding-right:15px;
            cursor:pointer;
        }

        .btn_Exit:hover{
            background:rgb(255, 235, 238);
        }

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="extraDiv">
        <div class="chatBoxContainer">
            <div class="leftContainer">
                <div class="roomUserTitle">
                    <label>Room Users</label>
                </div>
                <asp:ScriptManager ID="ScriptManager2" runat="server"></asp:ScriptManager>
                <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                    <ContentTemplate>
                        <asp:Timer ID="Timer2" runat="server" OnTick="Timer1_Tick" Interval="1000"></asp:Timer>
                        <div class="userContainer">
                            <asp:DataList ID="dl_RoomUsers" CssClass="dl_RoomUsers" runat="server">
                                <ItemTemplate>
                                    <div class="userType">
                                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("userType") +": " %>'></asp:Label>
                                    </div>
                                    <div class="roomUser">
                                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("UName") %>'></asp:Label>
                                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("DName") %>'></asp:Label>
                                    </div>
                                </ItemTemplate>
                            </asp:DataList>
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
            <div class="rightContainer">
                <div class="messageContainer">
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                            <asp:Timer ID="Timer1" runat="server" OnTick="Timer2_Tick" Interval="500"></asp:Timer>
                            <asp:GridView ID="gv_Message" runat="server" AutoGenerateColumns="False">
                                <Columns>
                                    <asp:BoundField DataField="UName" HeaderText="User" HeaderStyle-CssClass="gv_header" ItemStyle-CssClass="name1" />
                                    <asp:BoundField DataField="message" HeaderText="Message" HeaderStyle-CssClass="gv_header" ItemStyle-CssClass="message" />
                                    <asp:BoundField DataField="DName" HeaderText="Doctor" HeaderStyle-CssClass="gv_header" ItemStyle-CssClass="name2" />
                                </Columns>
                            </asp:GridView>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
                <asp:UpdatePanel ID="UpdatePanel3" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                            <asp:Timer ID="Timer3" runat="server" Interval="10000"></asp:Timer>
                        <asp:TextBox ID="tb_Message" CssClass="tb_Message" PlaceHolder="Message..." runat="server"></asp:TextBox>
                        <asp:Button ID="btn_Send" CssClass="btn_Send" runat="server" Text="Send" OnClick="btn_Send_Click" />
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>
        <div class="buttonContainer">
            <div class="buttonContainer1">
                <asp:Button ID="btn_Exit" CssClass="btn_Exit" runat="server" Text="Exit" OnClick="btn_Exit_Click" />
            </div>
        </div>
    </div>
</asp:Content>

