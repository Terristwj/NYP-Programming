<%@ Page Title="Select Donation" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="DonateSelectDonation.aspx.cs" Inherits="DonateSelectDonation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script>
        function getPageNum() {
            return 5;
        }
    </script>
    <style>
        #extraDiv{
            border:1px solid transparent;
        }

        .contentHeader{
            padding-top:25px;
            padding-bottom:25px;
        }

        .contentHeaderContainer{
            border:1px solid grey;
            width:600px;
            margin:auto;
            text-align:center;
            padding-top:20px;
            padding-bottom:25px;
        }

        .title{
            font-family:Arial;
            font-size:25px;
            font-weight:bold;
            text-decoration:underline;
        }

        .headerContent{
            padding-top:2px;
            padding-bottom:2px;
            font-family:Arial;
            font-size:16px;
        }

        .usernameContainer{
            padding-top:10px;
            padding-bottom:15px;
            width:400px;
            margin:auto;
        }

        .passwordContainer{
            padding-top:10px;
            padding-bottom:15px;
            width:400px;
            margin:auto;
        }

        .tb_Username{
            font-size:16px;
            padding-left:6px;
            width:170px;
        }

        .tb_Password{
            font-size:16px;
            padding-left:6px;
            width:170px;
        }

        .validatorContainer{
            text-align:left;
            width:90px;
            margin:auto;
        }

        .validator{
            color:red;
            float:left;
            font-size:12px;
        }

        .contentHeaderContainer2{
            border:1px solid grey;
            border-top:none;
            width:600px;
            margin:auto;
            text-align:center;
            padding-top:15px;
            padding-bottom:15px;
        }

        .amountContainer{
            padding-top:10px;
            padding-bottom:10px;
            width:400px;
            margin:auto;
        }

        .ddl_Donate{
            width:150px;
            font-size:16px;
            padding-left:5px;
            height:25px;
        }

        .btn_Donate{
            border:1px solid black;
            background:white;
            font-size:16px;
            padding-top:5px;
            padding-bottom:5px;
            padding-left:12px;
            padding-right:12px;
            cursor:pointer;
        }

        .btn_Donate:hover{
            background:rgb(255, 235, 238);
        }

        .btn_Back{
            border:1px solid black;
            background:white;
            font-size:16px;
            padding-top:5px;
            padding-bottom:5px;
            padding-left:20px;
            padding-right:20px;
            cursor:pointer;
        }

        .btn_Back:hover{
            background:rgb(255, 235, 238);
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="extraDiv">
        <div class="contentHeader">
            <div class="contentHeaderContainer">
                <div class="title">
                    <label>Verification</label>
                </div>
                <div class="headerContent">
                    <div class="usernameContainer">
                        <label>Username: </label>
                        <asp:TextBox ID="tb_Username" CssClass="tb_Username" runat="server"></asp:TextBox>
                        <div class="validatorContainer">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" CssClass="validator" runat="server" ErrorMessage="Required" ControlToValidate="tb_Username" ValidationGroup="Donate"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="passwordContainer">
                        <label>Password: </label>
                        <asp:TextBox ID="tb_Password" CssClass="tb_Password" runat="server"></asp:TextBox>
                        <div class="validatorContainer">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" CssClass="validator" runat="server" ErrorMessage="Required" ControlToValidate="tb_Password" ValidationGroup="Donate"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                </div>
            </div>
            <div class="contentHeaderContainer2">
                <div class="title">
                    <label>Select Amount</label>
                </div>
                <div class="headerContent">
                    <div class="amountContainer">
                        <label>Amount: </label>
                        <asp:DropDownList ID="ddl_Donate" CssClass="ddl_Donate" runat="server">
                            <asp:ListItem Value="5.00">$5.00</asp:ListItem>
                            <asp:ListItem Value="10.00">$10.00</asp:ListItem>
                            <asp:ListItem Value="15.00">$15.00</asp:ListItem>
                            <asp:ListItem Value="20.00">$20.00</asp:ListItem>
                            <asp:ListItem Value="30.00">$30.00</asp:ListItem>
                            <asp:ListItem Value="50.00">$50.00</asp:ListItem>
                            <asp:ListItem Value="75.00">$75.00</asp:ListItem>
                            <asp:ListItem Value="100.00">$100.00</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>
                <asp:Button ID="btn_Donate" CssClass="btn_Donate" runat="server" Text="Donate" ValidationGroup="Donate" OnClick="btn_Donate_Click" />
                <label>&nbsp;</label>
                <asp:Button ID="btn_Back" CssClass="btn_Back" runat="server" Text="Back" OnClick="btn_Back_Click"/>
            </div>
        </div>
        <div>
        </div>
    </div>
</asp:Content>

