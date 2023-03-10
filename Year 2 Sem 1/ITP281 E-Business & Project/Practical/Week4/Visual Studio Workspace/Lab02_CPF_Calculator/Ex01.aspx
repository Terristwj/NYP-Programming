<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="Ex01.aspx.cs" Inherits="Ex01" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            width: 517px;
        }
        .auto-style3 {
            width: 517px;
            height: 23px;
        }
        .auto-style4 {
            height: 23px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <h1>VPF Calculator</h1>
    <table class="auto-style1">
        <tr>
            <td class="auto-style2">Salary</td>
            <td>
                <asp:TextBox ID="TbSalary" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style3">Employee Contribution</td>
            <td class="auto-style4">
                <asp:Label ID="LblEmployeeCon" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">Employer Contribution</td>
            <td>
                <asp:Label ID="LblEmployerCon" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">Total Contribution</td>
            <td>
                <asp:Label ID="LblTotalCon" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style3">Net Salary</td>
            <td class="auto-style4">
                <asp:Label ID="LblNetSalary" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style3">Ordinary Account</td>
            <td class="auto-style4">
                <asp:Label ID="LblOrdinaryAcc" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style3">Special Account</td>
            <td class="auto-style4">
                <asp:Label ID="LblSpecialAcc" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">Medisave Account</td>
            <td>
                <asp:Label ID="LblMedisaveAcc" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">&nbsp;</td>
            <td>
                <asp:Button ID="Button1" runat="server" Text="Button" OnClick="Button1_Click" />
            </td>
        </tr>
    </table>
</asp:Content>

