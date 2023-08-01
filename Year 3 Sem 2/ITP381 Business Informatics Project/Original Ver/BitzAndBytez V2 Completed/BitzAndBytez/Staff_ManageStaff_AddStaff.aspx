<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Staff_ManageStaff_AddStaff.aspx.cs" Inherits="BitzAndBytez.Staff_ManageStaff_AddStaff" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            var url = window.location.toString();
            url = url.split("Staff_ManageStaff_AddStaff.aspx", 1);
            url += "Staff_Dashboard.aspx";

            $('.collapse .navbar-nav').find('.active').removeClass('active');
            $('.collapse .navbar-nav li a').each(function () {
                if (this.href == url) {
                    $(this).parent().addClass('active');
                }
            });
        });
    </script>

    <style>
        .upperContainer{
            width:90%;
            margin:auto;
            justify-content:center;
            align-items:center;
        }
        .formContent{
            width:80%;
            margin:auto;
            background:#fff;
            padding: 25px 0 25px 0;
        }
        .formContent_row{
            width:600px;
            margin:auto;
            padding: 5px 0 5px 0;
            display:flex;
        }
        .div_label, .div_input{
            display:inline;
            padding: 0 5px 0 5px;
        }
        .div_title{
            text-align: left;
            flex:1;
            text-align:center;
        }
        .div_title *{
            font-weight:bold;
            font-size:20px;
        }
        .div_label{
            flex:2;
            text-align: right;
        }
        .div_input{
            flex:5;
        }
        .div_special{
            flex:1;
            text-align: center;
            margin-top:5px;
        }
        .btn_Cancel, .btn_Create{
            padding:6px 15px 6px 15px;
            color:darkslategray;
            border:1px solid transparent;
            border-radius:5px;
            font-size:16px;
            letter-spacing:1px;
            background: #fff;
            box-shadow: 0px 0px 8px #888888;
        }
        .btn_Cancel:hover, .btn_Create:hover{
            background: #ddd;
            box-shadow: 0px 0px #888888;
        }

        .btn_Delete, .btn_Update{
            padding:6px 15px 6px 15px;
            color:white;
            border:1px solid transparent;
            border-radius:5px;
            font-size:16px;
            letter-spacing:1px;
            box-shadow: 0px 0px 8px #888888;
        }
        .btn_Delete{
            background: #dc3545;
        }
        .btn_Update{
            background: #28a745;
        }
        .btn_Delete:hover, .btn_Update:hover{
            box-shadow: 0px 0px #888888;
        }

        .displayNone{
            display:none;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="upperContainer">
        <div class="formContent">
            <div class="formContent_row">
                <div class="div_title">
                    <asp:Label ID="lb_title" runat="server" Text="Label"></asp:Label>
                </div>
            </div>
            <div class="formContent_row">
                <div class="div_label">
                    <label>
                        Name:
                    </label>
                </div>
                <div class="div_input">
                    <asp:TextBox ID="tb_name" runat="server" Width="250px"></asp:TextBox>
                </div>
            </div>
            <div class="formContent_row">
                <div class="div_label">
                    <label>
                        Email:
                    </label>
                </div>
                <div class="div_input">
                    <asp:TextBox ID="tb_email" runat="server" Width="250px"></asp:TextBox>
                </div>
            </div>
            <div ID="row_Password" runat="server" class="formContent_row">
                <div class="div_label">
                    <label>
                        Password:
                    </label>
                </div>
                <div class="div_input">
                    <asp:TextBox ID="tb_password" runat="server" Width="250px"></asp:TextBox>
                </div>
            </div>
            <div class="formContent_row">
                <div class="div_label">
                    <label>
                        Role:
                    </label>
                </div>
                <div class="div_input">
                    <asp:DropDownList ID="ddl_role" Height="30" Width="250px" runat="server">
                        <asp:ListItem Value="manager">Manager</asp:ListItem>
                        <asp:ListItem Value="cso">CSO</asp:ListItem>
                        <asp:ListItem Value="sm">SM</asp:ListItem>
                        <asp:ListItem Value="pm">PM</asp:ListItem>
                    </asp:DropDownList>
                </div>
            </div>

            <%--  Buttons  --%>
            <div style="height:5px;"></div>
            <div class="formContent_row">
                <div class="div_special">
                    <asp:Button ID="btn_Delete" CssClass="btn_Delete" runat="server" Text="Delete" OnClick="btn_Delete_Click" />
                    <asp:Button ID="btn_Cancel" CssClass="btn_Cancel" runat="server" Text="Cancel" OnClick="btn_Cancel_Click" />
                    <div style="border:10px solid transparent;display:inline;"></div>
                    <asp:Button ID="btn_Update" CssClass="btn_Update" runat="server" Text="Save" OnClick="btn_Update_Click" />
                    <asp:Button ID="btn_Create" CssClass="btn_Create" runat="server" Text="Create" OnClick="btn_Create_Click" />
                </div>
            </div>
            <div class="formContent_row">
                <div class="div_special">
                    <asp:Label ID="lb_error" runat="server" Text="" ForeColor="Red"></asp:Label>
                    <asp:Label ID="lb_success" runat="server" Text="" ForeColor="Green"></asp:Label>
                </div>
            </div>
        </div>
    </div>
</asp:Content>