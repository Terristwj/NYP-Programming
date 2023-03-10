<%@ Page Title="Store" Language="C#" MasterPageFile="~/MasterStore.master" AutoEventWireup="true" CodeFile="Store.aspx.cs" Inherits="Store" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head2" Runat="Server">
    <style type="text/css">
        .table {
            width: 100%;
            margin:auto;
            border: 1px solid grey;
            border-collapse:collapse;
            text-align:center;
        }

        @media(min-width: 940px) {
            .table{
                width:735px;
            }
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
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <table class="table">
        <tr>
            <td class="tableTitle">
                <h2>Welcome to the Store!</h2>
            </td>
        </tr>
        <tr>
            <td class="tableContent">
                <div id="FirstTableContent">
                    <p>
                        In Mum's Story Store, we offer a large variety of baby products. 
                        Our products range from necessities to food to medication.
                    </p>
                </div>
            </td>
        </tr>
        <tr>
            <td class="tableTitle">
                <h2>How to use the Store?</h2>
            </td>
        </tr>
        <tr>
            <td class="tableContent">
                <div id="SecondTableContent">
                    <p>Click on the other catergories to begin shopping!</p>
                </div>
            </td>
        </tr>
    </table>
</asp:Content>