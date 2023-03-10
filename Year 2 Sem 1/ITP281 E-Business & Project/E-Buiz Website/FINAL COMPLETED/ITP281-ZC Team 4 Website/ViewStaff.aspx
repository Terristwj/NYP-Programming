<%@ Page Title="View Staff" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ViewStaff.aspx.cs" Inherits="ViewStaff" %>

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
        }

        .searchContainer1{
            float:left;
        }

        .searchContainer2{
            float:right;
        }

        .tb_Search{
            font-size:15px;
            height:20px;
            padding-left:4px;
            width:185px;
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

        .btn_Add{
            font-size:14px;
            cursor:pointer;
            height:27px;
            padding-left:8px;
            padding-right:8px;
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

        .ddl_Position{
            font-size:14px;
            height:30px;
            width:156px;
        }

        .btn_Position{
            font-size:14px;
            cursor:pointer;
            height:27px;
            padding-left:14.5px;
            padding-right:14.5px;
            border:1px solid grey;
            background:white;
        }

        .btn_Position:hover{
            background:rgb(255, 235, 238);
        }

        .ddl_Sort{
            font-size:14px;
            height:30px;
        }

        .btn_Sort{
            font-size:14px;
            cursor:pointer;
            height:30px;
            padding-left:10px;
            padding-right:10px;
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
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="extraDiv">
        <div class="title">
            <h2>View Staff</h2>
        </div>
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <div class="topHeader">
                    <div class="searchContainer">
                        <div class="searchContainer1">   
                            <label>Search Name:</label>
                            <asp:TextBox ID="tb_Search" CssClass="tb_Search" runat="server"></asp:TextBox>
                            <asp:Button ID="btn_Search" CssClass="btn_Search" runat="server" Text="Search" OnClick="btn_Search_Click" />
                        </div>
                        <div class="searchContainer2"> 
                            <asp:Button ID="btn_Add" CssClass="btn_Add" runat="server" Text="Add Staff" OnClick="btn_Add_Click" />
                            <asp:Button ID="btn_Back" CssClass="btn_Back" runat="server" Text="Back" OnClick="btn_Back_Click" />
                        </div>
                    </div>
                    <div class="sortContainer">
                        <div class="sortContainer1">
                            <label>Search By Position:</label>
                            <asp:DropDownList ID="ddl_Position" CssClass="ddl_Position" runat="server">
                                <asp:ListItem>None</asp:ListItem>
                                <asp:ListItem>Senior</asp:ListItem>
                                <asp:ListItem>Junior</asp:ListItem>
                            </asp:DropDownList>
                            <asp:Button ID="btn_Position" CssClass="btn_Position" runat="server" Text="Filter" OnClick="btn_FilterPosition_Click" />
                        </div>
                        <div class="sortContainer2">
                            <label>Sort By:</label>
                            <asp:DropDownList ID="ddl_Sort" CssClass="ddl_Sort" runat="server">
                                <asp:ListItem>Staff ID ASC</asp:ListItem>
                                <asp:ListItem>Staff ID DESC</asp:ListItem>
                                <asp:ListItem>Name A-Z</asp:ListItem>
                                <asp:ListItem>Name Z-A</asp:ListItem>
                            </asp:DropDownList>
                            <asp:Button ID="btn_Sort" CssClass="btn_Sort" runat="server" Text="Sort" OnClick="btn_Sort_Click" />
                        </div>
                    </div>
                </div>
                <div class="GV_container">
                    <asp:GridView ID="gv_Products" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" CssClass="gv_Staff">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>

                            <asp:BoundField DataField="staffID" HeaderText="Staff ID" />
                            <asp:BoundField DataField="name" HeaderText="Name" />
                            <asp:BoundField DataField="position" HeaderText="Position" />

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

