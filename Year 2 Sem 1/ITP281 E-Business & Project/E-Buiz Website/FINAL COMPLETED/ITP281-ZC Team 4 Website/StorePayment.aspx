<%@ Page Title="Payment" Language="C#" MasterPageFile="~/MasterStore.master" AutoEventWireup="true" CodeFile="StorePayment.aspx.cs" Inherits="StorePayment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head2" Runat="Server">
    <script>
        function getPageNum2() {
            return 4;
        }
    </script>
    <style>
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
            display:flex;
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
            flex:2;
        }

        .creditCardContainer{
            border:1px solid red;
            font-family:Arial;
            font-size:20px;
            border:1px solid black;
            border-bottom:none;
            border-left:none;
            min-width:408.5px;
            max-width:900px;
            padding-top:5px;
            padding-bottom:5px;
            padding-left:25px;
            background:rgb(255, 238, 243);
            height:32.5px;
            color:white;
            float:right;
            flex:3;
        }

        .creditCardContainer2{
            color:black;
            height:32px;
            float:right;
            margin-right:20px;
        }

        .creditCardTitle{
            float:left;
            margin-top:5px;
        }

        .Pnl_CreditCardNone{
            float:left;
            height:32px;
            margin-left:15px;
        }

        .Pnl_CreditCard{
            float:left;
            height:32px;
            margin-left:15px;
        }

        .img_Card{
            height:32px;
            float:left;
        }

        .lb_CardNumber{
            float:left;
            margin-top:5px;
            margin-left:5px;
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
        }

        .validator{
            font-size:17px;
        }

        .buttonContainer{
            width:650px;
            margin:auto;
            margin-top:20px;
            margin-bottom:50px;
        }

        .buttonContainer2{
            width:250px;
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
            .receiptContainer{
                width:80%;
                max-width:1000px;
            }

            .billingTable{
                width:80%;
                max-width:1000px;
            }

            .billingTitle{
                flex:none;
            }

            .creditCardContainer2{
                margin-right:10%;;
            }
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
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
            <div class="creditCardContainer">
                <div class="creditCardContainer2">
                    <div class="creditCardTitle">
                        <label>Credit Card: </label>
                    </div>
                    <asp:Panel ID="Pnl_CreditCard" CssClass="Pnl_CreditCard" runat="server">
                        <asp:Image ID="img_Card" CssClass="img_Card" runat="server" ImageUrl="~/CSS and Images/Images and fonts/MasterCard.jpg" />
                        <asp:Label ID="lb_CardNumber" CssClass="lb_CardNumber" runat="server" Text="Label"></asp:Label>
                    </asp:Panel>
                    <asp:Panel ID="Pnl_CreditCardNone" CssClass="Pnl_CreditCardNone" runat="server">
                        <asp:Label ID="Label3" CssClass="lb_CardNumber" runat="server" Text="None"></asp:Label>
                    </asp:Panel>
                </div>
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
                    <asp:CheckBox ID="cb_Wallet" runat="server" Text="Use E-Wallet" Enabled="False" />
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
                <asp:TextBox ID="tb_Address" CssClass="tb_Address" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" CssClass="validator" runat="server" ErrorMessage="Required" ControlToValidate="tb_Address" ValidationGroup="Confirm" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
            </div>
        </div>

        <div class="buttonContainer">
            <div class="buttonContainer2">
                <asp:Button ID="btn_Confirm" CssClass="btn_Confirm" runat="server" Text="Confirm" OnClick="btn_Confirm_Click" ValidationGroup="Confirm" />
                <asp:Button ID="btn_Cancel" CssClass="btn_Cancel" runat="server" Text="Cancel" OnClick="btn_Cancel_Click" />
            </div>
        </div>

    </div>
</asp:Content>

