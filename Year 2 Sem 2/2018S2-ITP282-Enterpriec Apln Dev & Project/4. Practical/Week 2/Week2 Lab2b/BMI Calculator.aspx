<%@ Page Language="C#" AutoEventWireup="true" CodeFile="BMI Calculator.aspx.cs" Inherits="BMI_Calculator" %>

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

        .Line1, .Line2, .Line3{
            display:flex;
            margin:auto;
            width:300px;
        }

        .p{
            width:100px;
        }

        .tb, .tb2{
            height:25px;
            margin-top:10px;
        }

        .tb2:hover{
            cursor:not-allowed;
        }

        .btn{
            height:26px;
            margin-top:8px;
            margin-left:10px;
            margin-right:10px;
        }

        .btn:hover{
            cursor:pointer;
        }

        .btn2{
            height:26px;
            margin-top:25px;
        }

        .btn2:hover{
            cursor:pointer;
        }

        .Line4{
            display:flex;
            margin:auto;
            width:300px;
        }

        .p2{
            width:90px;
        }

        .tb3{
            height:35px;
            width:190px;
            margin-top:10px;
        }

        .tb3:hover{
            cursor:not-allowed;
        }

    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div class="container">
        <h1>Welcome to the BMI Calculator</h1>
        <div class="Line1">
            <p class="p">Weight (kg):</p>
            <asp:TextBox ID="TextBox1" CssClass="tb" runat="server"></asp:TextBox>
        </div>
        <div class="Line2">
            <p class="p">Height (m):</p>
            <asp:TextBox ID="TextBox2" CssClass="tb" runat="server"></asp:TextBox>
        </div>
        <div class="Line3">
            <p class="p">Your BMI is:</p>
            <asp:TextBox ID="TextBox3" CssClass="tb2" runat="server" ReadOnly="True"></asp:TextBox>
        </div>
        <div class="Line4">
            <p class="p2">Comment:</p>
            <asp:TextBox ID="TextBox4" CssClass="tb3" runat="server" ReadOnly="True" TextMode="MultiLine"></asp:TextBox>
        </div>
        <asp:Button ID="Button" CssClass="btn" runat="server" Text="Calculate" OnClick="Button_Click" />
        <asp:Button ID="Button1" CssClass="btn" runat="server" Text="Reset" OnClick="Button1_Click"  />
        <br />
        <asp:Button ID="Button2" CssClass="btn2" runat="server" Text="Switch to Temperaure Conversion" OnClick="Button2_Click"/>
    </div>
    </form>
</body>
</html>
