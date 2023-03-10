<%@ Page Title="Doctor Consults" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="DoctorProfileConsults.aspx.cs" Inherits="DoctorProfileConsults" %>

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

        .searchContainer_2{
            font-family:Arial;
            font-size:16px;
            height:30px;
            margin-top:10px;
        }

        .searchContainer1{
            float:left;
        }

        .searchContainer3{
            float:left;
        }

        .searchContainer2{
            float:right;
        }

        .tb_Search{
            font-size:15px;
            height:20px;
            padding-left:4px;
            width:144px;
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

        .tb_SearchDate{
            font-size:15px;
            height:20px;
            padding-left:4px;
            width:166px;
        }

        .btn_SearchDate{
            font-size:14px;
            cursor:pointer;
            height:27px;
            padding-left:8px;
            padding-right:8px;
            border:1px solid grey;
            background:white;
        }

        .btn_SearchDate:hover{
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

        .tb_SearchTime{
            font-size:15px;
            height:20px;
            padding-left:4px;
            width:165px;
        }

        .btn_SearchTime{
            font-size:14px;
            cursor:pointer;
            height:27px;
            padding-left:8px;
            padding-right:8px;
            border:1px solid grey;
            background:white;
        }

        .btn_SearchTime:hover{
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
            overflow-x: scroll;
        }

        .gv_Staff{
            width:100%;
            text-align:center;
            font-family:Arial;
        }

        .column{
            width:150px;
        }

        .btn_Select{
            font-size:14px;
            cursor:pointer;
            height:30px;
            padding-left:10px;
            padding-right:10px;
            border:1px solid grey;
            background:white;
        }

        .btn_Select:hover{
            background:rgb(255, 235, 238);
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="extraDiv">
        <div class="title">
            <h2>View Consults Given</h2>
        </div>
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <div class="topHeader">
                    <div class="searchContainer">
                        <div class="searchContainer1">   
                            <label>Search Booking ID:</label>
                            <asp:TextBox ID="tb_Search" CssClass="tb_Search" runat="server"></asp:TextBox>
                            <asp:Button ID="btn_Search" CssClass="btn_Search" runat="server" Text="Search" OnClick="btn_Search_Click" />
                        </div>
                    </div>
                    <div class="searchContainer_2">
                        <div class="searchContainer3">   
                            <label>Search By Date:</label>
                            <asp:TextBox ID="tb_SearchDate" CssClass="tb_SearchDate" runat="server"></asp:TextBox>
                            <asp:Button ID="btn_SearchDate" CssClass="btn_SearchDate" runat="server" Text="Search" OnClick="btn_SearchDate_Click" />
                        </div>
                        <div class="searchContainer2"> 
                            <asp:Button ID="btn_Back" CssClass="btn_Back" runat="server" Text="Back" OnClick="btn_Back_Click" />
                        </div>
                    </div>
                    <div class="sortContainer">
                        <div class="sortContainer1">
                            <label>Search By Time:</label>
                            <asp:TextBox ID="tb_SearchTime" CssClass="tb_SearchTime" runat="server"></asp:TextBox>
                            <asp:Button ID="btn_SearchTime" CssClass="btn_SearchTime" runat="server" Text="Search" OnClick="btn_SearchTime_Click" />
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

                            <asp:BoundField DataField="bookingID" HeaderText="Booking ID" />
                            <asp:BoundField DataField="date" HeaderText="Date Of Consult" />
                            <asp:BoundField DataField="timePeriod" HeaderText="Time Of Consult" ItemStyle-CssClass="column" />
                            <asp:BoundField DataField="roomPassword" HeaderText="Room Password" />
                            <asp:BoundField DataField="status" HeaderText="Status" />
                            <asp:BoundField DataField="userID" HeaderText="User ID" />

                            <asp:TemplateField HeaderText="Controls">
                                <ItemTemplate>
                                    <div class="deleteContainer">
                                        <asp:Button ID="btn_Select" CssClass="btn_Select" runat="server" Text="Select" CommandName="Select" CommandArgument='<%# Eval("bookingID") %>' />
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



