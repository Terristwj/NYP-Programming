<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Lab2b.aspx.cs" Inherits="Lab2b" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        .container{
            text-align:center;
            border:1px solid black;
            margin:auto;
            width:800px;
            padding-top:20px;
            padding-bottom:30px;
            margin-top:20px;
        }

        .Line1{
            display:flex;
            width:650px;
            padding-left:15px;
            margin:auto;
        }

        .tb{
            height:20px;
            margin-top:12px;
            margin-left:5px;
        }

        .btn{
            height:26px;
            margin-top:12px;
            margin-left:10px;
            margin-right:10px;
        }

        .btn:hover{
            cursor:pointer;
        }

        .btn2{
            height:26px;
            width:60px;
            margin-left:22px;
        }

        .btn2:hover{
            cursor:pointer;
        }

        .btn3{
            height:26px;
            margin-top:25px;
            margin-left:20px;
        }

        .btn3:hover{
            cursor:pointer;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div class="container">
        <h1>Welcome to Temperature Conversion</h1>
        <p>Tool for converting between Fahrenheit and Celcius temperature.</p>
        <div class="Line1">
            <p>Fahrenheight:</p>
            <asp:TextBox ID="TextBox1" CssClass="tb" runat="server"></asp:TextBox>
            <asp:Button ID="Button1" CssClass="btn" runat="server" Text="<-- Convert -->" OnClick="Button1_Click" />
            <p>Celcius:</p>
            <asp:TextBox ID="TextBox2" CssClass="tb" runat="server"></asp:TextBox>
        </div>
        <asp:Button ID="Button2" CssClass="btn2" runat="server" Text="Reset" OnClick="Button2_Click" />
        <br />
        <asp:Button ID="Button3" CssClass="btn3" runat="server" Text="Switch to BMI Calculator" OnClick="Button3_Click" />
    </div>
    </form>
</body>
</html>
