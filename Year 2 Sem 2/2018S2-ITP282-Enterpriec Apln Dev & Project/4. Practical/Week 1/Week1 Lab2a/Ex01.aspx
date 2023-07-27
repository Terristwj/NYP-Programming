<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Ex01.aspx.cs" Inherits="Ex01" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        body h1{
            text-align:center;
        }

        body{
            font-size:22px;
        }

        .auto-style1 {
            border:1px solid black;
            padding:5px;
        }
        .auto-style3 {
            width: 174px;
        }
        .auto-style4 {
            width: 256px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h1> CPF Calculator </h1>
    <table class="auto-style1" align="center">
        <tr>
            <td class="auto-style4">Salary</td>
            <td class="auto-style3">
                <asp:textbox runat="server" ID="TbSalary"></asp:textbox>
            </td>
        </tr>
        <tr>
            <td class="auto-style4">Employee Contribution</td>
            <td class="auto-style3">
                <asp:label runat="server" text="" ID="LblEmployeeCon"></asp:label>
            </td>
        </tr>
        <tr>
            <td class="auto-style4">Employer Contribution</td>
            <td class="auto-style3">
                <asp:label runat="server" text="" ID="LblEmployerCon"></asp:label>
            </td>
        </tr>
        <tr>
            <td class="auto-style4">Total Contribution</td>
            <td class="auto-style3">
                <asp:label runat="server" text="" ID="LblTotalCon"></asp:label>
            </td>
        </tr>
        <tr>
            <td class="auto-style4">Net Salary</td>
            <td class="auto-style3">
                <asp:label runat="server" text="" ID="LblNetSalary"></asp:label>
            </td>
        </tr>
        <tr>
            <td class="auto-style4">Ordinary Account</td>
            <td class="auto-style3">
                <asp:label runat="server" text="" ID="LblOrdAcct"></asp:label>
            </td>
        </tr>
        <tr>
            <td class="auto-style4">Special Account</td>
            <td class="auto-style3">
                <asp:label runat="server" text="" ID="LblSpecAcct"></asp:label>
            </td>
        </tr>
        <tr>
            <td class="auto-style4">Medisave Account</td>
            <td class="auto-style3">
                <asp:label runat="server" text="" ID="LblMsAcct"></asp:label>
            </td>
        </tr>
        <tr>
            <td class="auto-style4">&nbsp;</td>
            <td class="auto-style3">
                <asp:button runat="server" text="Calculate" ID="BtnCalculate" OnClick="BtnCalculate_Click"/>
            </td>
        </tr>
    </table>
</asp:Content>

