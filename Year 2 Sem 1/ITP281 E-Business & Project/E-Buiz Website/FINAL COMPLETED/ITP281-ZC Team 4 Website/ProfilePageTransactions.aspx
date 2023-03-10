<%@ Page Title="Transactions" Language="C#" MasterPageFile="~/MasterTransactions.master" AutoEventWireup="true" CodeFile="ProfilePageTransactions.aspx.cs" Inherits="ProfilePageTransactions" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head2" Runat="Server">
    <style type="text/css">
        .table {
            width: 100%;
            margin:auto;
            border: 1px solid grey;
            border-collapse:collapse;
            text-align:center;
        }

        .tableTitle{
            background: #d0f1f2;
            border-bottom: 1px solid grey;
        }


        .tableContent{
            border-bottom: 1px solid grey;
        }

        #FirstTableContent{
            width:500px;
            margin:auto;
            margin-top:40px;
            margin-bottom:40px;
        }

        #SecondTableContent{
            width:500px;
            margin:auto;
            margin-top:40px;
            margin-bottom:40px;
        }

        .buttonContainer{
            margin:auto;
            margin-top:50px;
        }

        .buttonContainer2{
            margin:auto;
            width:127px;
        }

        .btn_Back{
            border:1px solid black;
            background:white;
            font-size:20px;
            padding-top:7px;
            padding-bottom:7px;
            padding-left:7px;
            padding-right:7px;
            cursor:pointer;
        }

        .btn_Back:hover{
            background:rgb(255, 235, 238);
        }

        @media(min-width: 940px) {
            .table{
                width:735px;
            }

            .buttonContainer{
                width:735px;
            }
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <table class="table">
        <tr>
            <td class="tableTitle">
                <h2>Welcome to Transactions!</h2>
            </td>
        </tr>
        <tr>
            <td class="tableContent">
                <div id="FirstTableContent">
                    <p>
                        Here is where you can view your past transactions since
                        your very beginnings in joining Mum's Story.
                    </p>
                </div>
            </td>
        </tr>
        <tr>
            <td class="tableTitle">
                <h2>How to use Transactions?</h2>
            </td>
        </tr>
        <tr>
            <td class="tableContent">
                <div id="SecondTableContent">
                    <p>Click on one of the catergories to begin viewing!</p>
                </div>
            </td>
        </tr>
    </table>
    <div class="buttonContainer">
        <div class="buttonContainer2">
            <asp:Button ID="btn_Back" CssClass="btn_Back" runat="server" Text="Back To Edit" OnClick="btn_Back_Click" />
        </div>
    </div>
</asp:Content>

