<%@ Page Language="C#" AutoEventWireup="true" CodeFile="showRSS.aspx.cs" Inherits="showRSS" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        .line1, .line2{
            display:flex;
            width:800px;
            height:40px;
        }

        .line2{
            margin-top:10px;
        }

        .p, .btn{
            flex:1;
            text-align:center;
        }

        .btn:hover{
            cursor:pointer;
        }

        .ddl{
            flex:5;
        }

        .description{
            margin-top:17px;
            flex:6;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <h1>CNN News</h1>
        <asp:Label ID="lblErr" runat="server" Text="Sample"></asp:Label>
        <div class="line1">
            <p class="p">Title:</p>
            <asp:DropDownList ID="ddlTitle" Cssclass="ddl" runat="server"></asp:DropDownList>
            <asp:Button ID="btnGet" Cssclass="btn" runat="server" Text="Get" OnClick="btnGet_Click" />
        </div>
        <div class="line2">
            <p class="p">Description:</p>
            <asp:Label ID="lblDesc" Cssclass="description" runat="server" Text="Label"></asp:Label>
        </div>
    </div>
    </form>
</body>
</html>
