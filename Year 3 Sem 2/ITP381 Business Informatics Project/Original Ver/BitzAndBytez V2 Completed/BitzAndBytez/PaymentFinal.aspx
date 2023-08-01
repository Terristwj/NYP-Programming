<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="PaymentFinal.aspx.cs" Inherits="BitzAndBytez.PaymentFinal" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        #extraDiv{
        }

        #content-container{
        }

        #content-container2{
            width:720px;
            height:400px;
            margin:auto;
            margin-top:1px;
            background:#fff;
        }

        .title{
            width:443px;
            margin:auto;
            margin-bottom:-5px;
            text-align:center;
            margin-top:20px;
        }
        .title h2{
            font-size:20px;
            font-weight:bold;
        }

        #CardContainer{
            width:450px;
            background:white;
            margin:auto;
            border:1px solid grey;
            margin-top:20px;
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


        

        #BtnContainer{
            display:block;
            margin-top:15px;
        }

        #BtnContainer2{
            width:270px;
            margin:auto;
        }

        .btn_Checkout{
            display:inline;
            float:right;
            width:130px;
            
            padding:6px 15px 6px 15px;
            color:darkslategray;
            border:1px solid transparent;
            border-radius:5px;
            font-size:16px;
            letter-spacing:1px;
            background: #fff;
            box-shadow: 0px 0px 8px #888888;
        }

        .btnSpace{
            display:inline;
        }

        .btn_Cancel{
            display:inline;
            width:110px;
            
            padding:6px 15px 6px 15px;
            color:darkslategray;
            border:1px solid transparent;
            border-radius:5px;
            font-size:16px;
            letter-spacing:1px;
            background: #fff;
            box-shadow: 0px 0px 8px #888888;
        }

        .btn_Checkout:hover, .btn_Cancel:hover{
            background: #ddd;
            box-shadow: 0px 0px #888888;
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
                                            <asp:Label ID="lb_cardNumber" runat="server" Font-Size="24px" Text='5341-2142-4123-4124'></asp:Label>
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
                <asp:Image ID="img_CVV" CssClass="CVVImage" runat="server" ImageUrl="~/img/CreditCardCVV.PNG" />
                <div style="border-left:54px solid transparent;display:inline"></div>
            </div>
            
            <div style="height:20px;">
            </div>
            
            <div id="BtnContainer">
                <div id="BtnContainer2">
                    <asp:Button ID="btn_Cancel" CssClass="btn_Cancel" runat="server" Text="Cancel" OnClick="btn_Cancel_Click" />
                    <div class="btnSpace"></div>
                    <asp:Button ID="btn_Checkout" CssClass="btn_Checkout" runat="server" Text="Check Out" OnClick="btn_Checkout_Click" />
                </div>
            </div>

            <div style="1px solid red;">
            </div>
        </div>
    </div>
</asp:Content>

