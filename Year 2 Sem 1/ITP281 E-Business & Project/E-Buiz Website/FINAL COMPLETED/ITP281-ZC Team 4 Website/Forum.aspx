<%@ Page Title="Chat Room" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Forum.aspx.cs" Inherits="Forum" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
     <script>
        function getPageNum() {
            return 4;
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

        .title{
            width:603px;
            margin:auto;
            text-decoration:underline;
            margin-bottom:-5px;
        }

        .topHeader{
            width:603px;
            margin:auto;
            margin-top:-10px;
            margin-bottom:25px;
        }

        .searchContainer{
            font-family:Arial;
            font-size:16px;
            height:30px;
            margin-top:10px;
        }

        .searchContainer1{
            float:left;
        }

        .searchContainer2{
            float:right;
        }

        .tb_SearchTitle{
            font-size:15px;
            height:20px;
            padding-left:4px;
            width:170px;
        }

        .btn_SearchTitle{
            font-size:14px;
            cursor:pointer;
            height:27px;
            padding-left:8px;
            padding-right:8px;
            border:1px solid grey;
            background:white;
        }

        .btn_SearchTitle:hover{
            background:rgb(255, 235, 238);
        }

        .tb_Search{
            font-size:15px;
            height:20px;
            padding-left:4px;
            width:184px;
        }

        .btn_Search{
            font-size:14px;
            cursor:pointer;
            height:27px;
            padding-left:8px;
            padding-right:8px;
            border:1px solid grey;
            background:white;
        }

        .btn_Search:hover{
            background:rgb(255, 235, 238);
        }

        .tb_RoomSize{
            font-size:15px;
            height:20px;
            padding-left:4px;
            width:145px;
        }

        .btn_RoomSize{
            font-size:14px;
            cursor:pointer;
            height:27px;
            padding-left:8px;
            padding-right:8px;
            border:1px solid grey;
            background:white;
        }

        .btn_RoomSize:hover{
            background:rgb(255, 235, 238);
        }

        .btn_Refresh{
            font-size:14px;
            cursor:pointer;
            height:27px;
            padding-left:7.5px;
            padding-right:7.5px;
            border:1px solid grey;
            background:white;
        }

        .btn_Refresh:hover{
            background:rgb(255, 235, 238);
        }

        .btn_Add{
            font-size:14px;
            cursor:pointer;
            height:27px;
            padding-left:7.5px;
            padding-right:7.5px;
            border:1px solid grey;
            background:white;
        }

        .btn_Add:hover{
            background:rgb(255, 235, 238);
        }

        .btn_Back{
            font-size:14px;
            cursor:pointer;
            height:27px;
            padding-left:7.5px;
            padding-right:7.5px;
            border:1px solid grey;
            background:white;
        }

        .btn_Back:hover{
            background:rgb(255, 235, 238);
        }

        .sortContainer{
            font-family:Arial;
            font-size:16px;
            height:22px;
            margin-top:10px;
        }

        .sortContainer1{
            float:left;
        }

        .sortContainer2{
            float:right;
        }

        .ddl_Sort{
            font-size:14px;
            height:30px;
        }

        .btn_Sort{
            font-size:14px;
            cursor:pointer;
            height:30px;
            padding-left:11px;
            padding-right:11px;
            border:1px solid grey;
            background:white;
        }

        .btn_Sort:hover{
            background:rgb(255, 235, 238);
        }

        .GV_container{
            width:603px;
            margin:auto;
            border:1px solid black;
        }

        .gv_Staff{
            width:100%;
            text-align:center;
            font-family:Arial;
        }

        .column{
            width:150px;
        }

        .btn_Delete{
            font-size:14px;
            cursor:pointer;
            height:30px;
            padding-left:10px;
            padding-right:10px;
            border:1px solid grey;
            background:white;
        }

        .btn_Delete:hover{
            background:rgb(255, 235, 238);
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="extraDiv">
        <div class="title">
            <h2>Chat Rooms</h2>
        </div>
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <div class="topHeader">
                    
                    <div class="searchContainer">
                        <div class="searchContainer1">   
                            <label>Search Room Title:</label>
                            <asp:TextBox ID="tb_SearchTitle" CssClass="tb_SearchTitle" runat="server"></asp:TextBox>
                            <asp:Button ID="btn_SearchTitle" CssClass="btn_SearchTitle" runat="server" Text="Search" OnClick="btn_SearchTitle_Click" />
                        </div>
                    </div>

                    <div class="searchContainer">
                        <div class="searchContainer1">   
                            <label>Search Room ID:</label>
                            <asp:TextBox ID="tb_Search" CssClass="tb_Search" runat="server"></asp:TextBox>
                            <asp:Button ID="btn_Search" CssClass="btn_Search" runat="server" Text="Search" OnClick="btn_Search_Click" />
                        </div>
                        <div class="searchContainer2"> 
                            <asp:Button ID="btn_Refresh" CssClass="btn_Refresh" runat="server" Text="Refresh Page" OnClick="btn_RefreshPage_Click" />
                        </div>
                    </div>
                    
                    <div class="sortContainer">
                        <div class="sortContainer1">   
                            <label>Search By Room Size:</label>
                            <asp:TextBox ID="tb_RoomSize" CssClass="tb_RoomSize" runat="server"></asp:TextBox>
                            <asp:Button ID="btn_RoomSize" CssClass="btn_RoomSize" runat="server" Text="Search" OnClick="btn_SearchSize_Click" />
                        </div>
                        <div class="sortContainer2">
                            <label>Sort By:</label>
                            <asp:DropDownList ID="ddl_Sort" CssClass="ddl_Sort" runat="server">
                                <asp:ListItem>Booking ID</asp:ListItem>
                                <asp:ListItem>Date</asp:ListItem>
                                <asp:ListItem>Time</asp:ListItem>
                            </asp:DropDownList>
                            <asp:Button ID="btn_Sort" CssClass="btn_Sort" runat="server" Text="Sort" OnClick="btn_Sort_Click" />
                        </div>
                    </div>
                </div>
                <div class="GV_container">
                    <asp:GridView ID="gv_Products" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" CssClass="gv_Staff" OnRowCommand="gv_Products_RowCommand">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            
                            <asp:BoundField DataField="chatRoomID" HeaderText="Room ID" />
                            <asp:BoundField DataField="roomTitle" HeaderText="Title" />
                            <asp:BoundField DataField="roomSize" HeaderText="Max Users" />
                            <asp:BoundField DataField="currentSize" HeaderText="Current Users" />

                            <asp:TemplateField HeaderText="Controls">
                                <ItemTemplate>
                                    <div class="deleteContainer">
                                        <asp:Button ID="btn_Delete" CssClass="btn_Delete" runat="server" Text="Join" CommandName="Join" CommandArgument='<%# Eval("chatRoomID") %>' />
                                    </div>
                                </ItemTemplate>
                            </asp:TemplateField>

                        </Columns>
                        <EditRowStyle BackColor="#2461BF" />
                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#ff80bf" Font-Bold="True" ForeColor="White" CssClass="gv_Header" />
                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#ffe6f2" />
                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                        <SortedAscendingCellStyle BackColor="#F5F7FB" />
                        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                        <SortedDescendingCellStyle BackColor="#E9EBEF" />
                        <SortedDescendingHeaderStyle BackColor="#4870BE" />
                    </asp:GridView>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</asp:Content>



