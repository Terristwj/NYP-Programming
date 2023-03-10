<%@ Page Title="Select Funds" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="SelectFunds.aspx.cs" Inherits="SelectFunds" %>

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

        #content-container{
        }

        #content-container2{
            width: 620px;
            height:400px;
            margin:auto;
            margin-top:1px;
        }
        
        .title{
            width:443px;
            margin:auto;
            text-decoration:underline;
            margin-bottom:-5px;
        }

        #CardContainer{
            width:440px;
            background:white;
            margin:auto;
            border:1px solid grey;
        }

        .img_Card{
            margin-left:3px;
            margin-top:3px;
            height:70px;
        }

        .auto-style2 {
            width: 100%;
        }

        #CVVContainer{
            width:441px;
            margin:auto;
        }

        .CVVLabel{
            display:inline;
            font-family: Arial;
        }

        .tb_CVV{
            padding-top:1px;
            width:345px;
            padding-left:3px;
        }

        .CVVImage{
            height:20px;
            margin-bottom:-6px;
            display:inline;
        }
        
        #ddl_AmountContainer{
            width:443px;
            margin:auto;
        }

        .ddl_Amount{
            font-size:18px;
            width: 210px;
            height:35px;
            padding-left:20px;
        }

        .ddl_Amount ListItem{
            color:red;
        }

        #ButtonContainer{
            float:right;
            display:inline;
            height:30px;
        }

        .button{
            font-size:18px;
            background:white;
            border:1px solid grey;
            padding-top:5px;
            padding-bottom:5px;
            width:90px;
            cursor:pointer;
        }

        .button:hover{
            background:rgb(255, 235, 238);
        }

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="content-container">
        <div id="content-container2">
            <div style="height:10px;">
            </div>

            <div class="title">
                <h2>Selected Credit Card</h2>
            </div>

            <div id="CardContainer">
                <table class="auto-style2">
                    <tr>
                        <td>
                            <div style="position:relative;">
                                <table class="auto-style2">
                                    <tr>
                                        <td>
                                            <asp:Image ID="img_Card" runat="server" CssClass="img_Card" ImageUrl='~/CSS and Images/Images and fonts/MasterCard.jpg' />
                                        </td>
                                        <td>
                                            <asp:Label ID="lb_cardNumber" runat="server" Font-Size="29px" Text='5341-2142-4123-4124'></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </td>
                    </tr>
                </table>
            </div>

            <div style="height:20px;"></div>

            <div id="CVVContainer">
                <div class="CVVLabel">
                    <label>CVV: &nbsp;</label>
                </div>
                <asp:TextBox ID="tb_CVV" runat="server" CssClass="tb_CVV" Font-Size="11" PlaceHolder="3 Digits"></asp:TextBox>
                <asp:Image ID="img_CVV" CssClass="CVVImage" runat="server" ImageUrl="~/CSS and Images/Images and fonts/CreditCardCVV.PNG" />
                <div style="border-left:54px solid transparent;display:inline"></div>
                <div style="display:inline">
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Invalid Format" ControlToValidate="tb_CVV" ForeColor="Red" ValidationExpression="^\d{3}$" Display="Dynamic" Font-Names="Arial" ValidationGroup="Add"></asp:RegularExpressionValidator>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Required" ControlToValidate="tb_CVV" ForeColor="Red" Display="Dynamic" Font-Names="Arial" ValidationGroup="Add"></asp:RequiredFieldValidator>
                </div>
            </div>
            
            <div style="height:20px;">
            </div>

            <div class="title">
                <h2>Select Amount To Add</h2>
            </div>

            <div id="ddl_AmountContainer">
                <asp:DropDownList ID="ddl_Amount" CssClass="ddl_Amount" runat="server">
                    <asp:ListItem Value="5">$5.00</asp:ListItem>
                    <asp:ListItem Value="10">$10.00</asp:ListItem>
                    <asp:ListItem Value="15">$15.00</asp:ListItem>
                    <asp:ListItem Value="20">$20.00</asp:ListItem>
                    <asp:ListItem Value="30">$30.00</asp:ListItem>
                    <asp:ListItem Value="50">$50.00</asp:ListItem>
                    <asp:ListItem Value="75">$75.00</asp:ListItem>
                    <asp:ListItem Value="100">$100.00</asp:ListItem>
                </asp:DropDownList>

                <div id="ButtonContainer">
                    <asp:Button ID="btn_Add" CssClass="button" runat="server" Text="Add" OnClick="btn_Add_Click" ValidationGroup="Add" />
                    <div style="display:inline;border-left:15px solid transparent;"></div>
                    <asp:Button ID="btn_Cancel" CssClass="button" runat="server" Text="Cancel" OnClick="btn_Cancel_Click" />
                </div>
            </div>

        </div>
    </div>
</asp:Content>

