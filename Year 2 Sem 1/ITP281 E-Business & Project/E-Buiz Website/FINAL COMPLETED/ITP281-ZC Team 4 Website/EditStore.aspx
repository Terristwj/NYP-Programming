<%@ Page Title="Edit Store" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="EditStore.aspx.cs" Inherits="EditStore" %>

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
            margin-right:9px;
        }

        .tb_Search{
            font-size:15px;
            height:20px;
            padding-left:4px;
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
            margin-right:17px;
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
            float:left;
            margin-left:30px;
        }

        .ddl_SortOnly{
            font-size:14px;
            height:30px;
        }

        .btn_SortOnly{
            font-size:14px;
            cursor:pointer;
            height:30px;
            padding-left:10px;
            padding-right:10px;
            border:1px solid grey;
            background:white;
            margin-left:3px;
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

        .GV_container{
            width:603px;
            margin:auto;
            border:1px solid black;
        }

        .gv_Header{
            height:43.5px;
        }

        .gv_Products{
            width:100%;
        }

        .column{
            text-align:center;
            font-family:Arial;
            font-size:14px;
        }

        .linkContainer{
            padding-top:5px;
            padding-bottom:5px;
            display:flex;
        }

        .link{
            font-family:Arial;
            color:blue;
            text-decoration:underline;
            flex:1;
            cursor:pointer;
            border:none;
            background:none;
        }

        .link:visited{
            color:blue;
        }

        .link:hover{
            color:deeppink;
        }

        .gv_Image_Container{
            border:1px solid black;
            height:50px;
            width:50px;
            margin:auto;
        }

        .gv_Image{
            height:100%;
            width:100%;
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

            .sortContainer2{
                float:right;
                margin-right:4%;
            }

            .searchContainer2{
                margin-right:4%;
            }
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="extraDiv">
        <div class="title">
            <h2>Edit Store</h2>
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
                            <asp:Button ID="btn_Add" CssClass="btn_Add" runat="server" Text="Add Item" OnClick="btn_Add_Click" />
                            <asp:Button ID="btn_Back" CssClass="btn_Back" runat="server" Text="Back" OnClick="btn_Back_Click" />
                        </div>
                    </div>
                    <div class="sortContainer">
                        <div class="sortContainer1">
                            <label>Sort By Only:</label>
                            <asp:DropDownList ID="ddl_SortOnly" CssClass="ddl_SortOnly" runat="server">
                                <asp:ListItem>None</asp:ListItem>
                                <asp:ListItem>Category - Products</asp:ListItem>
                                <asp:ListItem>Category - Food</asp:ListItem>
                                <asp:ListItem>Category - Medicine</asp:ListItem>
                                <asp:ListItem>Category - Sponsor Products</asp:ListItem>
                            </asp:DropDownList>
                            <asp:Button ID="btn_SortOnly" CssClass="btn_SortOnly" runat="server" Text="Sort" OnClick="btn_SortOnly_Click" />
                        </div>
                        <div class="sortContainer2">
                            <label>Sort By:</label>
                            <asp:DropDownList ID="ddl_Sort" CssClass="ddl_Sort" runat="server">
                                <asp:ListItem>Product ID</asp:ListItem>
                                <asp:ListItem>Category</asp:ListItem>
                                <asp:ListItem>Name</asp:ListItem>
                                <asp:ListItem>High Price</asp:ListItem>
                                <asp:ListItem>Low Price</asp:ListItem>
                                <asp:ListItem>High Stock</asp:ListItem>
                                <asp:ListItem>Low Stock</asp:ListItem>
                            </asp:DropDownList>
                            <asp:Button ID="btn_Sort" CssClass="btn_Sort" runat="server" Text="Sort" OnClick="btn_Sort_Click" />
                        </div>
                    </div>
                </div>
                <div class="GV_container">
                    <asp:GridView ID="gv_Products" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" CssClass="gv_Products" OnRowCommand="gv_Products_RowCommand">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:BoundField DataField="Product_ID" HeaderText="Product ID" ItemStyle-CssClass="column" >
                                <ItemStyle CssClass="column"></ItemStyle>
                            </asp:BoundField>
                            <asp:BoundField DataField="Category" HeaderText="Category" ItemStyle-CssClass="column" >
                                <ItemStyle CssClass="column"></ItemStyle>
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="Image">
                                <ItemTemplate>
                                    <div class="gv_Image_Container">
                                        <asp:Image ID="Image1" runat="server" ImageUrl=<%# "~/CSS and Images/ProductsImages/" + Eval("Product_ID") + "/" + Eval("ImageUrl")%> CssClass="gv_Image" />
                                    </div>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField HeaderText="Name" DataField="Name" ItemStyle-CssClass="column" >
                                <ItemStyle CssClass="column"></ItemStyle>
                            </asp:BoundField>
                            <asp:BoundField HeaderText="Price" DataField="Unit_Price" DataFormatString="{0:c}" ItemStyle-CssClass="column" >
                                <ItemStyle CssClass="column"></ItemStyle>
                            </asp:BoundField>
                            <asp:BoundField HeaderText="Stock" DataField="Stock" ItemStyle-CssClass="column" >
                                <ItemStyle CssClass="column"></ItemStyle>
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="Controls" ItemStyle-CssClass="column" >
                                <ItemTemplate>
                                    <div class="linkContainer">
                                        <asp:HyperLink ID="hl_Edit" CssClass="link" runat="server" NavigateUrl=<%# "EditProduct.aspx?login=true&staffID=" + Request.QueryString["staffID"] + "&product=" + Eval("Product_ID") %>>Edit</asp:HyperLink>
                                        <div style="border-left:10px solid transparent;"></div>
                                        <asp:Button ID="btn_Delete" CssClass="link" runat="server" Text="Delete" CommandName="Delete" CommandArgument='<%# Eval("Product_ID") %>' />
                                    </div>
                                </ItemTemplate>
                                <ItemStyle CssClass="column"></ItemStyle>
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

