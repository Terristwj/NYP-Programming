<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="IT2605Prac03Client._default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        .label{
            display:inline;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <div>
            <p class="label">Your id:</p>
            <asp:TextBox ID="TbStudentId" runat="server"></asp:TextBox>
            <asp:Button ID="BtnTest" runat="server" Text="Test" OnClick="BtnTest_Click" />
        </div>
        <div>
            <p class="label">Response:</p>
            <asp:Label ID="LblResponse" runat="server" Text=""></asp:Label>
        </div>
        <div>
            <h1>Student Profile</h1>
            <table>
                <tr>
                    <td>
                        <p class="label">Student Name:</p>
                    </td>
                    <td>
                        <asp:TextBox ID="TbName" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <p class="label">Course Study:</p>
                    </td>
                    <td>
                        <asp:TextBox ID="TbCourse" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <p class="label">GPA:</p>
                    </td>
                    <td>
                        <asp:TextBox ID="TbGPA" runat="server"></asp:TextBox>
                    </td>
                </tr>
            </table>
        </div>
    </div>
    </form>
</body>
</html>
