<%@ Page Title="FLY-TA Staff View OSEP" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="ViewOSEP.aspx.cs" Inherits="FLY_TA.ViewOSEP" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        #Content{
            background:linear-gradient(180deg, rgba(224, 255, 255, 0.25) 0%, rgba(255, 255, 255, 1) 25%, rgba(255, 255, 255, 1) 75%, rgba(225, 255, 255, 0.25) 100%);
            min-height:700px;
            width:100%;
            padding-top:30px;
        }

        #container1{
            margin-top:20px;
            width:850px;
            margin:auto;
            height:30px;
        }
        

        .button{
            border:1px solid black;
            cursor:pointer;
            background:white;
            font-family:Arial;
            font-size:18px;
            width:90px;
            padding:2px;
            float: right;
        }

        .button:hover{
            background:#f2f2f2;
        }

        #container2{
            margin-top:20px;
            width:850px;
            margin:auto;
            margin-top: 20px;
        }

        .gvRow{
            text-align:center;
        }

        .Col{
            width:80px;
        }

        #container3{
            margin-top:20px;
            width:850px;
            margin:auto;
            margin-top: 20px;
        }

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="Content">
        <div id="container1">
            <asp:Button ID="btn_Back" runat="server" Text="Back" OnClick="btn_Back_Click" CssClass="button" />
        </div>
        
        <div id="container2">
            <asp:GridView ID="gv_OSEP_List" runat="server" AutoGenerateColumns="False" RowStyle-CssClass="gvRow" OnSelectedIndexChanged="gv_OSEP_List_SelectedIndexChanged" DataKeyNames="Id">
                <Columns>
                    <asp:BoundField DataField="Id" HeaderText="OSEP ID" ReadOnly="True" SortExpression="Id" />
                    <asp:BoundField DataField="Title" HeaderText="Title" ReadOnly="True" SortExpression="Title" />
                    <asp:BoundField DataField="Duration" HeaderText="Duration" ReadOnly="True" SortExpression="Duration" />
                    <asp:BoundField DataField="Accommodation_Type" HeaderText="Accommodation Type" ReadOnly="True" SortExpression="Accommodation_Type" />
                    <asp:BoundField DataField="Quota" HeaderText="Quota" SortExpression="Quota" ItemStyle-CssClass="Col" >
                    <ItemStyle CssClass="Col"></ItemStyle>
                    </asp:BoundField>
                    <asp:BoundField DataField="No_Of_Registered" HeaderText="Number Registered" ReadOnly="True" SortExpression="No_Of_Registered" ItemStyle-CssClass="Col">
                    <ItemStyle CssClass="Col"></ItemStyle>
                    </asp:BoundField>
                    <asp:BoundField DataField="Fees" HeaderText="Fee" ReadOnly="True" SortExpression="Fees" ItemStyle-CssClass="Col" >
                    <ItemStyle CssClass="Col"></ItemStyle>
                    </asp:BoundField>
                    <asp:CommandField  HeaderText="View Students" ShowSelectButton="True" ItemStyle-CssClass="Col">
                    <ItemStyle CssClass="Col"></ItemStyle>
                    </asp:CommandField>
                </Columns>
                <RowStyle CssClass="gvRow"></RowStyle>
            </asp:GridView>
        </div>

        <div id="container3">
            <asp:GridView ID="gv_Registration_List" runat="server" AutoGenerateColumns="False" RowStyle-CssClass="gvRow">
                <Columns>
                    <asp:BoundField DataField="Name" HeaderText="Student Name" SortExpression="Name" />
                    <asp:BoundField DataField="Admin_No" HeaderText="Admin Number" SortExpression="Admin_No" />
                    <asp:BoundField DataField="Course" HeaderText="Course" SortExpression="Course" />
                    <asp:BoundField DataField="Contact_No" HeaderText="Contact Number" SortExpression="Contact_No" />
                    <asp:BoundField DataField="PEM_Group" HeaderText="PEM Group" SortExpression="PEM_Group" />
                    <asp:BoundField DataField="Emergency_Person" HeaderText="Emergency Person" SortExpression="Emergency_Person" />
                    <asp:BoundField DataField="Emergency_Contact" HeaderText="Emergency Contact" SortExpression="Emergency_Contact" />
                </Columns>
            </asp:GridView>
        </div>
    </div>
</asp:Content>
