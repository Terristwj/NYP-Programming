<%@ Page Title="" Language="C#" MasterPageFile="~/MasterStore.master" AutoEventWireup="true" CodeFile="StoreErrorPage.aspx.cs" Inherits="StoreErrorPage" %>

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
            background:white;
            border:1px solid black;
            width:300px;
            text-align:center;
            margin:auto;
            margin-top:10px;
            position:relative;
        }

        #TheOnlyContainer:hover{
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

        .btn_ToLogin{
            position:absolute;
            width:100%;
            height:100%;
            top:0;
            left:0;
            opacity:0;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <div id="TheOnlyContainer">
        <h1>
            <asp:Label ID="lb_Error" runat="server" Text="Label"></asp:Label>
        </h1>
        <asp:Button ID="btn_ToLogin" CssClass="btn_ToLogin" runat="server" Text="Button" OnClick="btn_ToLogin_Click" Enabled="False" />
    </div>
</asp:Content>

