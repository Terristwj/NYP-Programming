<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ViewStoreReceipt2.aspx.cs" Inherits="ViewStoreReceipt2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script>
        function getPageNum() {
            return 3;
        }
    </script>
    <style>
        #extraDiv{
            border:1px solid transparent;
        }

        .content{
            height:auto;
        }

        .titleContainer{
            width:650px;
            text-align:center;
            font-family:Arial;
            font-size:25px;
            margin:auto;
            margin-top:20px;
            margin-bottom:15px;
        }

        .receiptContainer{
            width:650px;
            margin:auto;
            border:1px solid black;
            overflow-y:scroll;
            max-height:344px;
        }

        .gv_Header{
            height:43.5px;
        }

        .gv_Products{
            width:100%;
            font-family:Arial;
            font-size:16px;
        }

        .column{
            text-align:center;
            font-family:Arial;
            font-size:14px;
        }

        .gv_Product_Column_Container{
            height:51px;
        }

        .gv_Image_Container{
            border:1px solid black;
            height:50px;
            width:50px;
            float:left;
            margin-left:8px;
        }

        .gv_Image{
            height:100%;
            width:100%;
        }

        .gv_Name_Container{
            float:left;
            margin-top:17px;
            margin-left:8px;
        }

        
        .billingTable{
            width:650px;
            margin:auto;
            margin-top:40px;
        }

        .billingTableHeader {
            height:44px;
        }

        .billingTitle{
            font-family:Arial;
            font-size:20px;
            border:1px solid black;
            border-bottom:none;
            width:188px;
            padding-top:10px;
            padding-bottom:10px;
            padding-left:25px;
            background:#fd90be;
            color:white;
            float:left;
        }

        .billingContent{
            font-family:Arial;
            font-size:22px;
            border:1px solid black;
            background:#feeef4;
        }

        .totalPriceContainer{
            border-bottom:1px solid grey;
            padding-top:10px;
            padding-bottom:10px;
            padding-left:10px;
        }

        .walletContainer{
            border-bottom:1px solid grey;
            padding-top:10px;
            padding-bottom:10px;
            padding-left:10px;
        }

        .walletCBContainer{
            float:right;
            margin-right:15px;
            margin-top:3px;
            font-size:18px;
        }

        .netPriceContainer{
            border-bottom:1px solid grey;
            padding-top:10px;
            padding-bottom:10px;
            padding-left:10px;
        }

        .deliverysContainer{
            border-bottom:1px solid grey;
            padding-top:10px;
            padding-bottom:10px;
            padding-left:10px;
        }

        .addressContainer{
            padding-top:10px;
            padding-left:10px;
            padding-bottom:10px;
        }

        .tb_Address{
            width:96%;
            height:50px;
            font-family:Arial;
            font-size:22px;
            padding-left:10px;
            cursor:default;
        }

        .buttonContainer{
            width:650px;
            margin:auto;
            margin-top:20px;
            margin-bottom:50px;
        }

        .buttonContainer2{
            width:100px;
            margin:auto;
            height:40px;
        }

        .btn_Confirm{
            padding-top:10px;
            padding-bottom:10px;
            padding-left:10px;
            padding-right:10px;
            font-family:Arial;
            font-size:16px;
            width:100px;
            background:white;
            border:1px solid black;
            cursor:pointer;
            float:left;
        }

        .btn_Cancel{
            padding-top:10px;
            padding-bottom:10px;
            padding-left:10px;
            padding-right:10px;
            font-family:Arial;
            font-size:16px;
            width:100px;
            background:white;
            border:1px solid black;
            cursor:pointer;
            float:right;
        }

        .btn_Confirm:hover, .btn_Cancel:hover{
           background: rgb(255, 238, 243);
        }

        @media(min-width:1200px){
            .titleContainer{
                width:80%;
                max-width:1000px;
            }

            .receiptContainer{
                width:80%;
                max-width:1000px;
            }

            .billingTable{
                width:80%;
                max-width:1000px;
            }
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="extraDiv">
        <div class="titleContainer">
            <label>Order ID: </label>
            <asp:Label ID="lb_OrderID" CssClass="lb_OrderID" runat="server" Text="Label"></asp:Label>
        </div>

        <div class="receiptContainer">
            <asp:GridView ID="gv_Products" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" CssClass="gv_Products">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:TemplateField HeaderText="Product">
                        <ItemTemplate>
                            <div class="gv_Product_Column_Container">
                            <div class="gv_Image_Container">
                                <asp:Image ID="Image1" runat="server" ImageUrl=<%# "~/CSS and Images/ProductsImages/" + Eval("Product_ID") + "/" + Eval("ImageUrl")%> CssClass="gv_Image" />
                            </div>
                            <div class="gv_Name_Container">
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("Name") %>'></asp:Label>
                            </div>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField HeaderText="Unit Price" DataField="Unit_Price" DataFormatString="{0:c}" ItemStyle-CssClass="column" >
                        <ItemStyle CssClass="column"></ItemStyle>
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="Quantity">
                        <ItemTemplate>
                            <asp:Label ID="lb_Qty" runat="server" Text='<%# Eval("Quantity") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle CssClass="column" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Price">
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# "$"+(Convert.ToDouble(Eval("Unit_Price")) * Convert.ToDouble(Eval("Quantity"))).ToString(".00") %>'></asp:Label>
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
        <div class="billingTable">
            <div class="billingTableHeader">
                <div class="billingTitle">
                    <label>Billing Information</label>
                </div>
            </div>
            <div class="billingContent">
                <div class="totalPriceContainer">
                    <label>Total Price: </label>
                    <asp:Label ID="lb_TotalPrice" runat="server" Text="Label"></asp:Label>
                </div>
                <div class="walletContainer">
                    <label>E-Wallet: </label>
                    <asp:Label ID="lb_Wallet" runat="server" Text="Label"></asp:Label>
                    <div class="walletCBContainer">
                        <asp:CheckBox ID="cb_Wallet" runat="server" Text="Used E-Wallet" Enabled="False" />
                    </div>
                </div>
                <div class="netPriceContainer">
                    <label>Net Price: </label>
                    <asp:Label ID="lb_NetPrice" runat="server" Text="Label"></asp:Label>
                </div>
                <div class="deliverysContainer">
                    <label>Delivery Date: </label><br />
                    <asp:Label ID="lb_DeliveryDate" runat="server" Text="Label"></asp:Label>
                </div>
                <div class="addressContainer">
                    <label>Delivery Address: </label><br />
                    <asp:TextBox ID="tb_Address" CssClass="tb_Address" runat="server" ReadOnly="True"></asp:TextBox>
                </div>
            </div>

            <div class="buttonContainer">
                <div class="buttonContainer2">
                    <asp:Button ID="btn_Cancel" CssClass="btn_Cancel" runat="server" Text="Back" OnClick="btn_Cancel_Click" />
                </div>
            </div>

        </div>
    </div>
</asp:Content>

