<%@ Page Title="Create Room" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="DoctorProfileCreateRoom.aspx.cs" Inherits="DoctorProfileCreateRoom" %>

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

        .bigContainer{
        }

        .smallContainer1{
        }

        .smallContainer2{

        }

        @media(min-width:1500px){

            .bigContainer{
                display:flex;
            }

            .smallContainer1{
                flex:1;
                padding-left:10%;
                border-right:0.5px solid grey;
            }

            .smallContainer2{
                flex:1;
                padding-right:10%;
                border-left:0.5px solid grey;
            }
        }

        
        /* Form */

        .containerContent{
            border:1px solid black;
            width:600px;
            margin:auto;
            margin-top:30px;
        }

        .titleContainer{
            width:500px;
            text-align:center;
            text-decoration:underline;
            margin:auto;
        }

        .creationContainer{
            width:500px;
            margin:auto;
        }

        .validator{
            font-size:12px;
        }

        .bookIDContainer{
            font-family:Arial;
            font-size:20px;
            padding-top:7px;
            padding-left:7px;
            height:50px;
            width:325px;
            margin:auto;
        }

        .tb_BookID{
            height:20px;
            font-size:16px;
            padding-left:5px;
            margin-left:3px;
            width:125px;
        }

        .passwordContainer{
            font-family:Arial;
            font-size:20px;
            padding-top:7px;
            padding-left:7px;
            height:50px;
            width:325px;
            margin:auto;
        }

        .tb_Password{
            height:20px;
            font-size:16px;
            padding-left:5px;
            margin-left:3px;
            width:91px;
        }

        .buttonContainer{
            width:500px;
            margin:auto;
            padding-bottom:20px;
        }

        .buttonContainer2{
            width:160px;
            height:35px;
            margin:auto;
        }

        .btn_Create{
            font-size:17px;
            border:1px solid black;
            background:white;
            padding-top:5px;
            padding-left:8px;
            padding-right:8px;
            padding-bottom:5px;
            cursor:pointer;
            float:left;
        }

        .btn_Cancel{
            font-size:17px;
            border:1px solid black;
            background:white;
            padding-top:5px;
            padding-left:8px;
            padding-right:8px;
            padding-bottom:5px;
            cursor:pointer;
            float:right;
        }

        .btn_Create:hover{
            background:rgb(255, 235, 238);
        }

        .btn_Cancel:hover{
            background:rgb(255, 235, 238);
        }


        /* Reference */

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
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="extraDiv">
        <div class="bigContainer">
            <div class="smallContainer1">
                <div class="containerContent">
            <div class="titleContainer">
                <h1>Create Room</h1>
            </div>
            <div class="bookIDContainer">
                <label>Link Book ID: </label>
                <asp:TextBox ID="tb_BookID" CssClass="tb_BookID" runat="server"></asp:TextBox>
                <div>
                    <div style="border-left:129px transparent solid;height:1px;width:1px;float:left;"></div>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" Cssclass="validator" runat="server" ErrorMessage="Required" ForeColor="Red" ControlToValidate="tb_BookID" Display="Dynamic" ValidationGroup="Create"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" Cssclass="validator" runat="server" ErrorMessage="7 Digit Code" ForeColor="Red" ControlToValidate="tb_BookID" Display="Dynamic" ValidationGroup="Create" ValidationExpression="[0-9]+"></asp:RegularExpressionValidator >
                </div>
            </div>
            <div class="passwordContainer">
                <label>Room Password: </label>
                <asp:TextBox ID="tb_Password" CssClass="tb_Password" runat="server"></asp:TextBox>
                <div>
                    <div style="border-left:160px transparent solid;height:1px;width:1px;float:left;"></div>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" Cssclass="validator" runat="server" ErrorMessage="Required" ForeColor="Red" ControlToValidate="tb_Password" Display="Dynamic" ValidationGroup="Create"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" Cssclass="validator" runat="server" ErrorMessage="7 Digit Code" ForeColor="Red" ControlToValidate="tb_Password" Display="Dynamic" ValidationGroup="Create" ValidationExpression="^(\d){7}$"></asp:RegularExpressionValidator >
                </div>
            </div>
            <div class="buttonContainer">
                <div class="buttonContainer2">
                    <asp:Button ID="btn_Create" CssClass="btn_Create" runat="server" Text="Create" ValidationGroup="Create" OnClick="btn_Create_Click" />
                    <asp:Button ID="btn_Cancel" CssClass="btn_Cancel" runat="server" Text="Cancel" OnClick="btn_Cancel_Click" />
                </div>
            </div>
        </div>
            </div>
            <div class="smallContainer2">
                <div class="title">
                    <h2>Reference</h2>
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
                            <asp:GridView ID="gv_Products" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" CssClass="gv_Staff">
                                <AlternatingRowStyle BackColor="White" />
                                <Columns>

                                    <asp:BoundField DataField="bookingID" HeaderText="Booking ID" />
                                    <asp:BoundField DataField="date" HeaderText="Date Of Consult" />
                                    <asp:BoundField DataField="timePeriod" HeaderText="Time Of Consult" ItemStyle-CssClass="column" />
                                    <asp:BoundField DataField="roomPassword" HeaderText="Room Password" />
                                    <asp:BoundField DataField="status" HeaderText="Status" />
                                    <asp:BoundField DataField="userID" HeaderText="User ID" />

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
        </div>
    </div>
</asp:Content>


