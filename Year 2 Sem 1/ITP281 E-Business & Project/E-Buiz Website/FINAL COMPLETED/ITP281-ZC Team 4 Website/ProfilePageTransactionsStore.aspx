<%@ Page Title="Transactions" Language="C#" MasterPageFile="~/MasterTransactions.master" AutoEventWireup="true" CodeFile="ProfilePageTransactionsStore.aspx.cs" Inherits="ProfilePageTransactionsStore" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head2" Runat="Server">
    <script>
        function getPageNum2() {
            return 1;
        }
    </script>
    <style>
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

        .tb_SearchDateOfOrder{
            font-size:15px;
            height:20px;
            padding-left:4px;
            width:103px;
        }

        .btn_SearchDateOfOrder{
            font-size:14px;
            cursor:pointer;
            height:27px;
            padding-left:8px;
            padding-right:8px;
            border:1px solid grey;
            background:white;
        }

        .btn_SearchDateOfOrder:hover{
            background:rgb(255, 235, 238);
        }

        .btn_SortOnly:hover{
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

        .tb_SearchDeliveryDate{
            font-size:15px;
            height:20px;
            padding-left:4px;
            width:95px;
        }

        .btn_SearchDeliveryDate{
            font-size:14px;
            cursor:pointer;
            height:27px;
            padding-left:8px;
            padding-right:8px;
            border:1px solid grey;
            background:white;
        }

        .btn_SearchDeliveryDate:hover{
            background:rgb(255, 235, 238);
        }

        .GV_container{
            width:603px;
            max-height:403px;
            margin:auto;
            border:1px solid black;
            overflow-x:scroll;
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

        .Header6{
            min-width:110px;
            padding-top:5px;
            padding-bottom:5px;
        }

        .Header7{
            min-width:450px;
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
            width:100%;
        }

        .columnLink3{
            position:relative;
            height:54px;
            width:100%;
            padding-top:2px;
        }

        .hyperLink{
            position:absolute;
            top:0;
            left:0;
            height:100%;
            width:100%;
            cursor:pointer;
        }

        @media(min-width:1000px){
            .topHeader{
                width:78%;
            }

            .GV_container{
                width:78%;
            }
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class="topHeader">
                <div class="searchContainer">
                    <div class="searchContainer1">   
                        <label>Search Order ID:</label>
                        <asp:TextBox ID="tb_Search" CssClass="tb_Search" runat="server"></asp:TextBox>
                        <asp:Button ID="btn_Search" CssClass="btn_Search" runat="server" Text="Search" OnClick="btn_Search_Click" />
                    </div>
                </div>
                <div class="searchContainer_2">
                    <div class="sortContainer1">
                        <label>Search By Order Date:</label>
                        <asp:TextBox ID="tb_SearchDateOfOrder" CssClass="tb_SearchDateOfOrder" runat="server" PlaceHolder="DD/MM/YYYY"></asp:TextBox>
                        <asp:Button ID="btn_SearchDateOfOrder" CssClass="btn_SearchDateOfOrder" runat="server" Text="Search" OnClick="btn_SearchDateOfOrder_Click" />
                    </div>
                    <div class="searchContainer2">   
                        <asp:Button ID="btn_Back" CssClass="btn_Back" runat="server" Text="Back To Edit" OnClick="btn_Back_Click" />
                    </div>
                </div>
                <div class="searchContainer_3">
                    <div class="sortContainer1">
                        <label>Search By Deliver Date:</label>
                        <asp:TextBox ID="tb_SearchDeliveryDate" CssClass="tb_SearchDeliveryDate" runat="server" PlaceHolder="DD/MM/YYYY"></asp:TextBox>
                        <asp:Button ID="btn_SearchDeliveryDate" CssClass="btn_SearchDeliveryDate" runat="server" Text="Search" OnClick="btn_SearchDeliveryDate_Click" />
                    </div>
                    <div class="sortContainer2">
                        <label>Sort By:</label>
                        <asp:DropDownList ID="ddl_Sort" CssClass="ddl_Sort" runat="server">
                            <asp:ListItem>Order ID ASC</asp:ListItem>
                            <asp:ListItem>Order ID DESC</asp:ListItem>
                            <asp:ListItem>Total Price ASC</asp:ListItem>
                            <asp:ListItem>Total Price DESC</asp:ListItem>
                            <asp:ListItem>Wallet ASC</asp:ListItem>
                            <asp:ListItem>Wallet DESC</asp:ListItem>
                            <asp:ListItem>Net Price ASC</asp:ListItem>
                            <asp:ListItem>Net Price DESC</asp:ListItem>
                            <asp:ListItem>Order Date ASC</asp:ListItem>
                            <asp:ListItem>Order Date  DESC</asp:ListItem>
                            <asp:ListItem>Deliv Date ASC</asp:ListItem>
                            <asp:ListItem>Deliv Date  DESC</asp:ListItem>
                        </asp:DropDownList>
                        <asp:Button ID="btn_Sort" CssClass="btn_Sort" runat="server" Text="Sort" OnClick="btn_Sort_Click" />
                    </div>
                </div>
            </div>
            <div class="GV_container">
                <asp:GridView ID="gv_Products" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" CssClass="gv_Products">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:TemplateField HeaderText="Order ID" HeaderStyle-CssClass="Header1">
                            <ItemTemplate>
                                <div class="columnLink">
                                    <asp:Label ID="lb_UserID" runat="server" Text='<%# Bind("Order_ID") %>'></asp:Label>
                                    <asp:HyperLink ID="HyperLink1" runat="server" CssClass="hyperLink" NavigateUrl='<%# "ViewStoreReceipt.aspx?login=true&userID=" + Request.QueryString["userID"] + "&orderID=" + Eval("Order_ID") %>'></asp:HyperLink>
                                </div>
                            </ItemTemplate>
                            <ItemStyle CssClass="column" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Total Price" HeaderStyle-CssClass="Header2" ItemStyle-CssClass="column">
                            <ItemTemplate>
                                <div class="columnLink">
                                    <asp:Label ID="lb_TotalPrice" runat="server" Text='<%# Bind("totalPrice", "{0:n}") %>'></asp:Label>
                                    <asp:HyperLink ID="HyperLink2" runat="server" CssClass="hyperLink" NavigateUrl='<%# "ViewStoreReceipt.aspx?login=true&userID=" + Request.QueryString["userID"] + "&orderID=" + Eval("Order_ID") %>'></asp:HyperLink>
                                </div>
                            </ItemTemplate>
                            <ItemStyle Width="200px" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Wallet Amount Used" HeaderStyle-CssClass="Header3" ItemStyle-CssClass="column">
                            <ItemTemplate>
                                <div class="columnLink">
                                    <asp:Label ID="lb_WalletUsed" runat="server" Text='<%# Bind("walletAmount", "{0:n}") %>'></asp:Label>
                                    <asp:HyperLink ID="HyperLink3" CssClass="hyperLink" runat="server" NavigateUrl='<%# "ViewStoreReceipt.aspx?login=true&userID=" + Request.QueryString["userID"] + "&orderID=" + Eval("Order_ID") %>'></asp:HyperLink>
                                </div>
                            </ItemTemplate>
                            <ItemStyle CssClass="column"></ItemStyle>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Net Price" HeaderStyle-CssClass="Header4" ItemStyle-CssClass="column">
                            <ItemTemplate>
                                <div class="columnLink">
                                    <asp:Label ID="lb_NetPrice" runat="server" Text='<%# Bind("netPrice", "{0:n}") %>'></asp:Label>
                                    <asp:HyperLink ID="HyperLink4" CssClass="hyperLink" runat="server" NavigateUrl='<%# "ViewStoreReceipt.aspx?login=true&userID=" + Request.QueryString["userID"] + "&orderID=" + Eval("Order_ID") %>'></asp:HyperLink>
                                </div>
                            </ItemTemplate>
                            <ItemStyle CssClass="column" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Date Of Order" HeaderStyle-CssClass="Header5" ItemStyle-CssClass="column">
                            <ItemTemplate>
                                <div class="columnLink2">
                                    <asp:Label ID="lb_DateOfOrder" CssClass="lb_DateOfOrder" runat="server" Text='<%# Bind("dateOfOrder") %>'></asp:Label>
                                    <asp:HyperLink ID="HyperLink5" CssClass="hyperLink" runat="server" NavigateUrl='<%# "ViewStoreReceipt.aspx?login=true&userID=" + Request.QueryString["userID"] + "&orderID=" + Eval("Order_ID") %>'></asp:HyperLink>
                                </div>
                            </ItemTemplate>
                            <ItemStyle CssClass="column" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Delivery Date" HeaderStyle-CssClass="Header6" ItemStyle-CssClass="column">
                            <ItemTemplate>
                                <div class="columnLink3">
                                    <asp:Label ID="lb_DeliveryDate" runat="server" Text='<%# Bind("deliveryDate") %>'></asp:Label>
                                    <asp:HyperLink ID="HyperLink6" CssClass="hyperLink" runat="server" NavigateUrl='<%# "ViewStoreReceipt.aspx?login=true&userID=" + Request.QueryString["userID"] + "&orderID=" + Eval("Order_ID") %>'></asp:HyperLink>
                                </div>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Delievery Address" HeaderStyle-CssClass="Header7" ItemStyle-CssClass="column">
                            <ItemTemplate>
                                <div class="columnLink">
                                    <asp:Label ID="lb_DeliveryAddress" runat="server" Text='<%# Bind("deliveryAddress") %>'></asp:Label>
                                    <asp:HyperLink ID="HyperLink7" CssClass="hyperLink" runat="server" NavigateUrl='<%# "ViewStoreReceipt.aspx?login=true&userID=" + Request.QueryString["userID"] + "&orderID=" + Eval("Order_ID") %>'></asp:HyperLink>
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
</asp:Content>

