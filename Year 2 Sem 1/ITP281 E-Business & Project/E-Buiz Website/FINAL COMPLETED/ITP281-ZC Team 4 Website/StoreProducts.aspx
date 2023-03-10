<%@ Page Title="Store" Language="C#" MasterPageFile="~/MasterStore.master" AutoEventWireup="true" CodeFile="StoreProducts.aspx.cs" Inherits="StoreProducts" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head2" Runat="Server">
    <script>
        function getPageNum2() {
            return 0;
        }
    </script>
    <style type="text/css">
        #SearchContainer{
            width:380px;
            float:left;
            font-family:Arial;
            margin-bottom:10px;
            margin-left:25px;
        }

        #SortByContainer{
            width:208.5px;
            float:right;
            font-family:Arial;
            margin-bottom:10px;
        }

        .tb_Search{
            height:18px;
            font-size:16px;
            padding-left:5px;
        }

        .btn_Search{
            height:24px;
            font-size:14px;
            padding-left:8px;
            padding-right:8px;
            cursor:pointer;
        }

        @media(min-width: 800px) {
            #SortByContainer {
                margin-right:10px
            }

            #SearchContainer{
                margin-left:30px
            }
        }

        @media(min-width: 1000px) {
            #SortByContainer {
                margin-right:50px
            }
        }

        @media(min-width: 1200px) {
            #SortByContainer {
                margin-right:70px
            }
        }

        @media(min-width: 1600px) {
            #SortByContainer {
                margin-right:120px
            }

            #SearchContainer{
                margin-left:60px
            }
        }

        .dlItemContainer{
            width:200px;
            background: rgba(255, 235, 238, 0.4);
            margin:auto;
            border:1px solid black;
            margin-top:5px;
            margin-bottom:25px;
            text-align:center;
        }

        .ddl_Sort{
            height:23px;
            font-size:14px;
            padding-left:5px;
        }

        .btn_DDL{
            height:24px;
            font-size:14px;
            padding-left:8px;
            padding-right:8px;
            cursor:pointer;
        }

        .auto-style1 {
            width: 100%;
            border-collapse:collapse;
        }

        .Row1{
            border-bottom:1px solid black;
        }

        .imgBtnContainer{
            height:200px;
            width:200px;
            margin-left:-1px;
        }

        .ImgBtn{
            height:100%;
            width:100%;
        }

        .lb_NameContainer{
            height:50px;
            width:193px;
            margin:auto;
        }

        .label{
            font-family:Arial;
            font-size:20px;
        }

        @media(min-width: 1100px) {
            .dlItemContainer{
                width:250px;
            }

            .imgBtnContainer{
                border:1px solid black;
                height:200px;
                width:200px;
                margin:auto;
            }
        }

        @media(min-width: 1300px) {
            .dlItemContainer{
                width:300px;
            }

            .lb_NameContainer{
                width:290px;
                height:25px;
            }
        }

        @media(min-width: 1500px) {
            .dlItemContainer{
                width:350px;
            }

            .imgBtnContainer{
                height:250px;
                width:250px;
            }

            .lb_NameContainer{
                width:300px;
            }
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <div>
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
            <div id="SearchContainer">
                <label>Search Name:</label>
                <asp:TextBox ID="tb_Search" CssClass="tb_Search" runat="server"></asp:TextBox>
                <asp:Button ID="btn_Search" CssClass="btn_Search" runat="server" Text="Search" OnClick="btn_Search_Click" />
            </div>
            <div id="SortByContainer">
                <label>Sort by:</label>
                <asp:DropDownList ID="ddl_Sort" CssClass="ddl_Sort" runat="server">
                    <asp:ListItem>Name</asp:ListItem>
                    <asp:ListItem>High Price</asp:ListItem>
                    <asp:ListItem>Low Price</asp:ListItem>
                    <asp:ListItem>High Stock</asp:ListItem>
                    <asp:ListItem>Low Stock</asp:ListItem>
                </asp:DropDownList>
                <asp:Button ID="btn_DDL" CssClass="btn_DDL" runat="server" Text="Sort" OnClick="btn_DDL_Click" />
            </div>

            <asp:DataList ID="dl_Products" runat="server" BorderStyle="None" BorderWidth="1px" CellPadding="0" RepeatColumns="3" RepeatDirection="Horizontal" Width="100%" OnItemCommand="dl_ItemCommand">
                <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
                <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
                <ItemStyle ForeColor="#003399" />
                <ItemTemplate>
                    <div class="dlItemContainer">
                        <table class="auto-style1">
                            <tr>
                                <td class="Row1">
                                    <div class="imgBtnContainer">
                                    <asp:ImageButton ID="ImgBtn" CssClass="ImgBtn" runat="server" ImageUrl='<%# "~/CSS and Images/ProductsImages/" + Eval("Product_ID") + "/" + Eval("ImageUrl")%>' CommandName="Select" />
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <div style="height:5px;"></div>
                                    <div class="lb_NameContainer">
                                        <asp:Label ID="lb_Name" CssClass="label lb_Name" runat="server" Text='<%# Eval("Name") %>' ></asp:Label>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <div style="height:2px;"></div>
                                    <asp:Label ID="lb_Price" CssClass="label" runat="server" Text='<%# "$" + Eval( "Unit_Price", "{0:0.00}") %>'></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <div style="height:2px;"></div>
                                    <asp:Label ID="lb_Stock" CssClass="label" runat="server" Text='<%# "Stock: " + Eval("Stock") %>'></asp:Label>
                                    <div style="height:5px;"></div>
                                </td>
                            </tr>
                        </table>
                    </div>
                </ItemTemplate>
                <SelectedItemStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
            </asp:DataList>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</asp:Content>

