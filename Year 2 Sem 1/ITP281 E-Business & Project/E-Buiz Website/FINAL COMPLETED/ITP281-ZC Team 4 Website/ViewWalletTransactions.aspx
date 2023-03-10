<%@ Page Title="View E-Wallet Transactions" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ViewWalletTransactions.aspx.cs" Inherits="ViewWalletTransactions" %>

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

        .btn_Search:hover{
            background:rgb(255, 235, 238);
        }

        .btn_Back{
            font-size:14px;
            cursor:pointer;
            height:27px;
            padding-left:8px;
            padding-right:8px;
            border:1px solid grey;
            background:white;
        }

        .btn_Back:hover{
            background:rgb(255, 235, 238);
        }

        .searchContainer_2{
            font-family:Arial;
            font-size:16px;
            height:22px;
            margin-top:10px;
        }

        .searchContainer_3{
            font-family:Arial;
            font-size:16px;
            height:22px;
            margin-top:20px;
        }

        .sortContainer1{
            float:left;
        }

        .sortContainer2{
            float:right;
        }

        .tb_SearchDate{
            font-size:15px;
            height:20px;
            padding-left:4px;
            width:103px;
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

        .ddl_Filter{
            font-size:14px;
            height:30px;
        }

        .btn_Filter{
            font-size:14px;
            cursor:pointer;
            height:30px;
            padding-left:10px;
            padding-right:10px;
            border:1px solid grey;
            background:white;
        }

        .btn_Filter:hover{
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
            max-height:403px;
            margin:auto;
            border:1px solid black;
            overflow-y:scroll;
        }

        .gv_Header{
            height:43.5px;
            font-family:Arial;
        }

        .gv_Products{
            width:100%;
        }

        .Header1{
            min-width:80px;
            padding-top:5px;
            padding-bottom:5px;
        }

        .Header2{
            min-width:80px;
            padding-top:5px;
            padding-bottom:5px;
        }

        .Header3{
            min-width:80px;
            padding-top:5px;
            padding-bottom:5px;
        }

        .Header4{
            min-width:80px;
            padding-top:5px;
            padding-bottom:5px;
        }

        .Header5{
            min-width:100px;
            padding-top:5px;
            padding-bottom:5px;
        }

        .column{
            text-align:left;
            font-family:Arial;
            font-size:15px;
            text-align:center;
        }

        .columnLink{
            position:relative;
            height:39px;
            width:100%;
            padding-top:17px;
        }

        .columnLink2{
            position:relative;
            height:46px;
            padding-top:10px;
            width:80px;
            margin:auto;
        }


        @media(min-width:1000px){
            .title{
                width:78%;
            }

            .topHeader{
                width:78%;
            }

            .GV_container{
                width:78%;
            }
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="extraDiv">
        <div class="title">
            <h2>View E-Wallet Transactions</h2>
        </div>
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <div class="topHeader">
                    <div class="searchContainer">
                        <div class="searchContainer1">   
                            <label>Search Transaction ID:</label>
                            <asp:TextBox ID="tb_Search" CssClass="tb_Search" runat="server"></asp:TextBox>
                            <asp:Button ID="btn_Search" CssClass="btn_Search" runat="server" Text="Search" OnClick="btn_Search_Click" />
                        </div>
                    </div>
                    <div class="searchContainer_2">
                        <div class="sortContainer1">
                            <label>Search By User ID:</label>
                            <asp:TextBox ID="tb_SearchDate" CssClass="tb_SearchDate" runat="server" ></asp:TextBox>
                            <asp:Button ID="btn_SearchDate" CssClass="btn_SearchDate" runat="server" Text="Search" OnClick="btn_SearchUserID_Click" />
                        </div>
                        <div class="searchContainer2">   
                            <asp:Button ID="btn_Back" CssClass="btn_Back" runat="server" Text="Back" OnClick="btn_Back_Click" />
                        </div>
                    </div>
                    <div class="searchContainer_3">
                        <div class="sortContainer1">
                            <label>Filter Only: </label>
                            <asp:DropDownList ID="ddl_Filter" CssClass="ddl_Filter" runat="server">
                                <asp:ListItem>None</asp:ListItem>
                                <asp:ListItem>Amount Add</asp:ListItem>
                                <asp:ListItem>Amount Deduct</asp:ListItem>
                            </asp:DropDownList>
                            <asp:Button ID="btn_Filter" CssClass="btn_Filter" runat="server" Text="Filter" OnClick="btn_Filter_Click" />
                        </div>
                        <div class="sortContainer2">
                            <label>Sort By:</label>
                            <asp:DropDownList ID="ddl_Sort" CssClass="ddl_Sort" runat="server">
                                <asp:ListItem>Transact ID ASC</asp:ListItem>
                                <asp:ListItem>Transact ID DESC</asp:ListItem>
                                <asp:ListItem>Added ASC</asp:ListItem>
                                <asp:ListItem>Added DESC</asp:ListItem>
                                <asp:ListItem>Deducted ASC</asp:ListItem>
                                <asp:ListItem>Deducted DESC</asp:ListItem>
                                <asp:ListItem>Date ASC</asp:ListItem>
                                <asp:ListItem>Date DESC</asp:ListItem>
                                <asp:ListItem>User ID ASC</asp:ListItem>
                                <asp:ListItem>User ID DESC</asp:ListItem>
                            </asp:DropDownList>
                            <asp:Button ID="btn_Sort" CssClass="btn_Sort" runat="server" Text="Sort" OnClick="btn_Sort_Click" />
                        </div>
                    </div>
                </div>
                <div class="GV_container">
                    <asp:GridView ID="gv_Products" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" CssClass="gv_Products">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:TemplateField HeaderText="Transaction ID" HeaderStyle-CssClass="Header1">
                                <ItemTemplate>
                                    <div class="columnLink">
                                        <asp:Label ID="lb_TransactionID" runat="server" Text='<%# Bind("WalletTransaction_ID") %>'></asp:Label>
                                    </div>
                                </ItemTemplate>
                                <ItemStyle CssClass="column" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Amount Added" HeaderStyle-CssClass="Header2" ItemStyle-CssClass="column">
                                <ItemTemplate>
                                    <div class="columnLink">
                                        <asp:Label ID="lb_AmountAdded" runat="server" Text='<%# Bind("AmountAdded", "{0:n}") %>'></asp:Label>
                                    </div>
                                </ItemTemplate>
                                <ItemStyle Width="200px" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Amount Deducted" HeaderStyle-CssClass="Header3" ItemStyle-CssClass="column">
                                <ItemTemplate>
                                    <div class="columnLink">
                                        <asp:Label ID="lb_AmountDepleted" runat="server" Text='<%# Bind("AmountDepleted", "{0:n}") %>'></asp:Label>
                                    </div>
                                </ItemTemplate>
                                <ItemStyle CssClass="column"></ItemStyle>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Date" HeaderStyle-CssClass="Header4" ItemStyle-CssClass="column">
                                <ItemTemplate>
                                    <div class="columnLink2">
                                        <asp:Label ID="lb_Date" runat="server" Text='<%# Bind("DateOfChange") %>'></asp:Label>
                                    </div>
                                </ItemTemplate>
                                <ItemStyle CssClass="column" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Name" HeaderStyle-CssClass="Header5" ItemStyle-CssClass="column">
                                <ItemTemplate>
                                    <div class="columnLink">
                                        <asp:Label ID="lb_FinalWallet" CssClass="lb_DateOfOrder" runat="server" Text='<%# Bind("name") %>'></asp:Label>
                                    </div>
                                </ItemTemplate>
                                <ItemStyle CssClass="column" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="User ID" HeaderStyle-CssClass="Header5" ItemStyle-CssClass="column">
                                <ItemTemplate>
                                    <div class="columnLink">
                                        <asp:Label ID="lb_FinalWallet" CssClass="lb_DateOfOrder" runat="server" Text='<%# Bind("userID") %>'></asp:Label>
                                    </div>
                                </ItemTemplate>
                                <ItemStyle CssClass="column" />
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


