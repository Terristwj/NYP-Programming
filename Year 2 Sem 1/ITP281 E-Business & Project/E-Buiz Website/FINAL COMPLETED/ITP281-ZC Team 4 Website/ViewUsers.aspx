<%@ Page Title="View Users" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ViewUsers.aspx.cs" Inherits="ViewUsers" %>

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
            width:195px;
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

        .tb_SearchEmail{
            font-size:15px;
            height:20px;
            padding-left:4px;
            width:175px;
        }

        .btn_SearchEmail{
            font-size:14px;
            cursor:pointer;
            height:27px;
            padding-left:8px;
            padding-right:8px;
            border:1px solid grey;
            background:white;
        }

        .btn_SearchEmail:hover{
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
            overflow-x:scroll;
        }

        .gv_Header{
            height:43.5px;
        }

        .gv_Products{
            width:100%;
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
            height:54px;
            width:100%;
            padding-top:2px;
        }

        .gv_Image_Container{
            border:1px solid black;
            height:54px;
            width:54px;
            margin:auto;
        }

        .gv_Image{
            height:100%;
            width:100%;
        }

        .hyperLink{
            position:absolute;
            top:0;
            left:0;
            height:100%;
            width:100%;
            cursor:pointer;
        }

        .headerCss2{
            padding-left:120px;
            padding-right:120px;
        }

        @media(min-width:800px){
            .title{
                width:80%;
            }

            .topHeader{
                width:80%;
            }

            .GV_container{
                width:80%;
            }
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="extraDiv">
        <div class="title">
            <h2>View Users</h2>
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
                            <asp:Button ID="btn_Back" CssClass="btn_Back" runat="server" Text="Back" OnClick="btn_Back_Click" />
                        </div>
                    </div>
                    <div class="sortContainer">
                        <div class="sortContainer1">
                            <label>Search By Email:</label>
                            <asp:TextBox ID="tb_SearchEmail" CssClass="tb_SearchEmail" runat="server"></asp:TextBox>
                            <asp:Button ID="btn_SearchEmail" CssClass="btn_SearchEmail" runat="server" Text="Search" OnClick="btn_SearchEmail_Click" />
                        </div>
                        <div class="sortContainer2">
                            <label>Sort By:</label>
                            <asp:DropDownList ID="ddl_Sort" CssClass="ddl_Sort" runat="server">
                                <asp:ListItem>Name A-Z</asp:ListItem>
                                <asp:ListItem>Name Z-A</asp:ListItem>
                            </asp:DropDownList>
                            <asp:Button ID="btn_Sort" CssClass="btn_Sort" runat="server" Text="Sort" OnClick="btn_Sort_Click" />
                        </div>
                    </div>
                </div>
                <div class="GV_container">
                    <asp:GridView ID="gv_Products" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" CssClass="gv_Products" OnRowDataBound="gv_Products_RowDataBound" >
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:TemplateField HeaderText="User ID">
                                <ItemTemplate>
                                    <div class="columnLink">
                                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("userID") %>'></asp:Label>
                                        <asp:HyperLink ID="HyperLink1" runat="server" CssClass="hyperLink" NavigateUrl='<%# "ViewProfilePage.aspx?login=true&staffID=" + Request.QueryString["staffID"] + "&viewedProfile=" + Eval("userID") %>'></asp:HyperLink>
                                    </div>
                                </ItemTemplate>
                                <ItemStyle CssClass="column" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Image" ItemStyle-Width="200px">
                                <ItemTemplate>
                                    <div style="position:relative;">
                                        <div class="gv_Image_Container">
                                            <asp:Image ID="Image1" runat="server" CssClass="gv_Image" ImageUrl='<%# "~/CSS and Images/Users/" + Eval("username") + "/Avatar/" + Eval("profileUrl")%>' />
                                        </div>
                                        <asp:HyperLink ID="HyperLink2" runat="server" CssClass="hyperLink" NavigateUrl='<%# "ViewProfilePage.aspx?login=true&staffID=" + Request.QueryString["staffID"] + "&viewedProfile=" + Eval("userID") %>'></asp:HyperLink>
                                    </div>
                                </ItemTemplate>
                                <ItemStyle Width="200px" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Name" ItemStyle-CssClass="column">
                                <ItemTemplate>
                                    <div class="columnLink">
                                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("Name") %>'></asp:Label>
                                        <asp:HyperLink ID="HyperLink3" CssClass="hyperLink" runat="server" NavigateUrl='<%# "ViewProfilePage.aspx?login=true&staffID=" + Request.QueryString["staffID"] + "&viewedProfile=" + Eval("userID") %>'></asp:HyperLink>
                                    </div>
                                </ItemTemplate>
                                <HeaderStyle CssClass="headerColumn" />
                                <ItemStyle CssClass="column"></ItemStyle>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Email" ItemStyle-CssClass="column">
                                <ItemTemplate>
                                    <div class="columnLink">
                                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("email") %>'></asp:Label>
                                        <asp:HyperLink ID="HyperLink4" CssClass="hyperLink" runat="server" NavigateUrl='<%# "ViewProfilePage.aspx?login=true&staffID=" + Request.QueryString["staffID"] + "&viewedProfile=" + Eval("userID") %>'></asp:HyperLink>
                                    </div>
                                </ItemTemplate>
                                <ItemStyle CssClass="column" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Phone" ItemStyle-CssClass="column">
                                <ItemTemplate>
                                    <div class="columnLink">
                                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("phoneNumber") %>'></asp:Label>
                                        <asp:HyperLink ID="HyperLink5" CssClass="hyperLink" runat="server" NavigateUrl='<%# "ViewProfilePage.aspx?login=true&staffID=" + Request.QueryString["staffID"] + "&viewedProfile=" + Eval("userID") %>'></asp:HyperLink>
                                    </div>
                                </ItemTemplate>
                                <ItemStyle CssClass="column" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Date Join" ItemStyle-CssClass="column" ItemStyle-Width="20px">
                                <ItemTemplate>
                                    <div class="columnLink2">
                                        <asp:Label ID="Label5" runat="server" Text='<%# Bind("dateJoined") %>'></asp:Label>
                                        <asp:HyperLink ID="HyperLink6" CssClass="hyperLink" runat="server" NavigateUrl='<%# "ViewProfilePage.aspx?login=true&staffID=" + Request.QueryString["staffID"] + "&viewedProfile=" + Eval("userID") %>'></asp:HyperLink>
                                    </div>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Wallet" ItemStyle-CssClass="column">
                                <ItemTemplate>
                                    <div class="columnLink">
                                        <asp:Label ID="Label6" runat="server" Text='<%# Bind("wallet", "{0:n}") %>'></asp:Label>
                                        <asp:HyperLink ID="HyperLink7" CssClass="hyperLink" runat="server" NavigateUrl='<%# "ViewProfilePage.aspx?login=true&staffID=" + Request.QueryString["staffID"] + "&viewedProfile=" + Eval("userID") %>'></asp:HyperLink>
                                    </div>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Address" ItemStyle-CssClass="column" HeaderStyle-CssClass="headerCss2">
                                <ItemTemplate>
                                    <div class="columnLink">
                                        <asp:Label ID="Label7" runat="server" Text='<%# Bind("address") %>'></asp:Label>
                                        <asp:HyperLink ID="HyperLink8" CssClass="hyperLink" runat="server" NavigateUrl='<%# "ViewProfilePage.aspx?login=true&staffID=" + Request.QueryString["staffID"] + "&viewedProfile=" + Eval("userID") %>'></asp:HyperLink>
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
