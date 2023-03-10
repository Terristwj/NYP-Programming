<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Registration_Form.aspx.cs" Inherits="Registration_Form" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            width: 10%;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <h1>Customer Registration</h1>
        

    </div>
    <table class="auto-style1">
        <tr>
            <td class="auto-style2">NAME</td>
            <td>
                <asp:TextBox ID="tb_NAME" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">NRIC</td>
            <td>
                <asp:TextBox ID="tb_NRIC" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">HP</td>
            <td>
                <asp:TextBox ID="tb_HP" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">EMAIL</td>
            <td>
                <asp:TextBox ID="tb_EMAIL" runat="server"></asp:TextBox>
            </td>
        </tr>
    </table>

    <asp:Panel ID="Panel1" runat="server" GroupingText="Gender">
        <asp:RadioButtonList ID="rbl_Gender" runat="server">
            <asp:ListItem Value="M">Male</asp:ListItem>
            <asp:ListItem Value="F">Female</asp:ListItem>
        </asp:RadioButtonList>
    </asp:Panel>

    <asp:Panel ID="Panel2" runat="server" GroupingText="Notification">
        Send product updates and promotion info to :

        <asp:CheckBoxList ID="cbl_Notifications" runat="server">

            <asp:ListItem>HP</asp:ListItem>
            <asp:ListItem>EMAIL</asp:ListItem>

        </asp:CheckBoxList>
    </asp:Panel>

    <asp:Panel ID="Panel3" runat="server" GroupingText="Birthday Month">
        <asp:DropDownList ID="ddl_BirthdayMonth" runat="server">

            <asp:ListItem>January</asp:ListItem>
            <asp:ListItem>February</asp:ListItem>
            <asp:ListItem>March</asp:ListItem>
            <asp:ListItem>May</asp:ListItem>
            <asp:ListItem>April</asp:ListItem>
            <asp:ListItem>June</asp:ListItem>
            <asp:ListItem>July</asp:ListItem>
            <asp:ListItem>August</asp:ListItem>
            <asp:ListItem>September</asp:ListItem>
            <asp:ListItem>October</asp:ListItem>
            <asp:ListItem>November</asp:ListItem>
            <asp:ListItem>December</asp:ListItem>

        </asp:DropDownList>
    </asp:Panel>

    <asp:button ID="btm_Submit" runat="server" text="Submit" OnClick="btm_Submit_Click"/>
    </form>
</body>

</html>
