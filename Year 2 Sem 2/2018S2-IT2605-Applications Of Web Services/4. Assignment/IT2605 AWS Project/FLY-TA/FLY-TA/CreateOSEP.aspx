<%@ Page Title="FLY-TA Staff Create OSEP" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="CreateOSEP.aspx.cs" Inherits="FLY_TA.CreateOSEP" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        #Content{
            background:linear-gradient(180deg, rgba(224, 255, 255, 0.25) 0%, rgba(255, 255, 255, 1) 25%, rgba(255, 255, 255, 1) 75%, rgba(225, 255, 255, 0.25) 100%);
            min-height:700px;
            width:100%;
            padding-top:40px;
        }

        #form{
            margin-top:20px;
            border:1px solid black;
            width:850px;
            height:490px;
            margin:auto;
        }

        #title{
            text-align:center;
            border-bottom:1px dashed grey;
        }

        .table {
            width: 100%;
            font-family:Arial;
            font-size:18px;
            margin-top:10px;
            margin-bottom:10px;
        }

        .leftCol{
            text-align:right;
            padding-top:6px;
            padding-bottom:6px;
            margin-left:25px;
            width:330px;
        }

        .leftColArea{
            text-align:right;
            padding-top:6px;
            padding-bottom:6px;
            margin-left:25px;
            width:330px;
            margin-top:0px;
            padding-top:0px;
        }

        .field{
            width:180px;
            font-family:Arial;
            font-size:14px;
        }

        .fieldArea{
            font-family:Arial;
            font-size:14px;
            height:100px;
        }
        
        #footer{
            border-top:1px dashed grey;
        }

        #btnContainer{
            width:200px;
            margin:auto;
            margin-top:20px;
        }

        .button1, .button2{
            border:1px solid black;
            cursor:pointer;
            background:white;
            font-family:Arial;
            font-size:18px;
            width:90px;
            padding:2px;
        }

        .button1{
            float:left;
        }

        .button2{
            float:right;
        }

        .button1:hover, .button2:hover{
            background:#f2f2f2;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="Content">
        <div id="form">
            <div id="title">
                <h2>Create OSEP</h2>
            </div>
            <div id="input">
                <table class="table">
                    <tr>
                        <td class="leftCol">Title:</td>
                        <td>
                            <asp:TextBox ID="tb_Title" runat="server" CssClass="field"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="leftColArea">
                            Description:
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
                        </td>
                        <td>
                            <asp:TextBox ID="tb_Description" runat="server" TextMode="MultiLine" CssClass="fieldArea" Width="180px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="leftCol">Start Date:</td>
                        <td>
                            <asp:TextBox ID="tb_DurationStart" runat="server" TextMode="Date" CssClass="field"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="leftCol">End Date:</td>
                        <td>
                            <asp:TextBox ID="tb_DurationEnd" runat="server" TextMode="Date" CssClass="field"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="leftCol">Accommodation Type:</td>
                        <td>
                            <asp:DropDownList ID="ddl_AccommodationType" runat="server" CssClass="field">
                                <asp:ListItem>Hostel</asp:ListItem>
                                <asp:ListItem>Home-Stay</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td class="leftCol">Quota:</td>
                        <td>
                            <asp:TextBox ID="tb_Quota" runat="server" CssClass="field"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="leftCol">Fee:</td>
                        <td>
                            <asp:TextBox ID="tb_Fee" runat="server" CssClass="field"></asp:TextBox>
                        </td>
                    </tr>
                </table>
            </div>
            <div id="footer">
                <div id="btnContainer">
                    <asp:Button ID="btn_Cancel" runat="server" Text="Cancel" OnClick="btn_Cancel_Click" CssClass="button1" />
                    <asp:Button ID="btn_Create" runat="server" Text="Create" OnClick="btn_Create_Click" CssClass="button2" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>
