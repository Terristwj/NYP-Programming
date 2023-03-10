<%@ Page Title="" Language="C#" MasterPageFile="~/MasterStore.master" AutoEventWireup="true" CodeFile="StorePaymentComplete.aspx.cs" Inherits="StorePaymentComplete" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head2" Runat="Server">
    <script>
        function getPageNum2() {
            return 4;
        }
    </script>
    <style>
        @keyframes MasterLgnBtn{
            0%{border-radius:0%;}
            10%{border-radius:12.5%;}
            20%{border-radius:25%;}
            30%{border-radius:37.5%;}
            40%{border-radius:50%;}
        }

        #TheOnlyContainer{
            width:300px;
            text-align:center;
            margin:auto;
            margin-top:10px;
            position:relative;
        }

        .btn_Complete:hover{
            background: radial-gradient(white, white, rgba(255, 179, 191,1));
            border: 3px rgba(255, 179, 191, 1) solid;
            padding: 18px 25px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            margin: 4px 2px;
            cursor: pointer;
            font-size:18px;
            display:block;
            margin:auto;
            animation-name: MasterLgnBtn;
            animation-duration: 1.1s;
            animation-iteration-count: infinite;
            animation-direction:alternate;
        }

        .btn_Complete{
            border:1px solid black;
            background: white;
            min-height:50px;
            width:250px;
            font-size:20px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <div id="TheOnlyContainer">
        <asp:Button ID="btn_Complete" CssClass="btn_Complete" runat="server" Text="Transaction Complete" OnClick="btn_Complete_Click" />
    </div>
</asp:Content>

