<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Registration_Form.aspx.cs" Inherits="Registration_Form" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

   
    <div>
    
        <h1>Customer Registration</h1>
        NAME&nbsp;
        <asp:TextBox ID="tb_CustName" runat="server" Width="266px">Jake Loh</asp:TextBox>
        <br />
        <br />
        NRIC&nbsp;&nbsp;&nbsp; <asp:TextBox ID="tb_NRIC" runat="server" Width="163px">S9828897A</asp:TextBox>
        <br />
        <br />
        HP&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="tb_Hp" runat="server" Width="183px">99199919</asp:TextBox>
        <br />
        <br />
        EMAIL
        <asp:TextBox ID="tb_Email" runat="server" Width="262px" AutoCompleteType="JobTitle">JakeLoh@gmail.com</asp:TextBox>
        <br />
        <asp:Panel ID="Panel1" runat="server" GroupingText="GENDER" Width="350px">
            <asp:RadioButtonList ID="rbl_Gender" runat="server" Width="186px">
                <asp:ListItem>Female</asp:ListItem>
                <asp:ListItem>Male</asp:ListItem>
            </asp:RadioButtonList>
        </asp:Panel>
        <asp:Panel ID="Panel2" runat="server" GroupingText="NOTIFICATIONS" Width="351px">
            Send product updates and promotion info to :<asp:CheckBoxList ID="cbl_Notifications" runat="server" Width="120px">
                <asp:ListItem>HP</asp:ListItem>
                <asp:ListItem>EMAIL</asp:ListItem>
            </asp:CheckBoxList>
        </asp:Panel>
        <asp:Panel ID="Panel3" runat="server" GroupingText="BIRTHDAY MONTH" Width="352px">
            <asp:DropDownList ID="ddl_BirthdayMonth" runat="server">
                <asp:ListItem>Jan</asp:ListItem>
                <asp:ListItem>Feb</asp:ListItem>
                <asp:ListItem>Mar</asp:ListItem>
                <asp:ListItem>Apr</asp:ListItem>
                <asp:ListItem>May</asp:ListItem>
                <asp:ListItem>Jun</asp:ListItem>
            </asp:DropDownList>
        </asp:Panel>
        <br />
        <br />
        <asp:Button ID="btn_Submit" runat="server" OnClick="btn_Submit_Click" Text="Submit" Width="160px" />
        <br />
    
    </div>


</asp:Content>

