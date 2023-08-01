<%@ Page Title="" Language="C#" MasterPageFile="~/Customer_Profile.master" AutoEventWireup="true" CodeBehind="Cust_ChangePassword.aspx.cs" Inherits="BitzBytez.Cust_ChangePassword" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head2" runat="server">
    <script>
        $(document).ready(function () {
            var url = window.location.toString();
            url = url.split("Cust_ChangePassword.aspx", 1);
            url += "Cust_Notification.aspx";

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
            margin-bottom:5px;
        }
        .div_title *{
            font-weight:bold;
            font-size:24px;
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
        .btn_Change{
            padding:6px 15px 6px 15px;
            color:darkslategray;
            border:1px solid transparent;
            border-radius:5px;
            font-size:16px;
            letter-spacing:1px;
            background: #fff;
            box-shadow: 0px 0px 8px #888888;
        }
        .btn_Change:hover{
            background: #ddd;
            box-shadow: 0px 0px #888888;
        }

        .displayNone{
            display:none;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <div class="upperContainer">
        <div class="formContent">
            <div class="formContent_row">
                <div class="div_title">
                    <asp:Label ID="lb_title" runat="server" Text="Change Password"></asp:Label>
                </div>
            </div>
            <div class="formContent_row">
                <div class="div_label">
                    <label>
                        Current:
                    </label>
                </div>
                <div class="div_input">
                    <asp:TextBox ID="tb_curPassword" runat="server" Width="250px" TextMode="Password"></asp:TextBox>
                </div>
            </div>
            <div class="formContent_row">
                <div class="div_label">
                    <label>
                        New:
                    </label>
                </div>
                <div class="div_input">
                    <asp:TextBox ID="tb_newPassword" runat="server" Width="250px" TextMode="Password"></asp:TextBox>
                </div>
            </div>
            <div ID="row_Password" runat="server" class="formContent_row">
                <div class="div_label">
                    <label>
                        Confirm:
                    </label>
                </div>
                <div class="div_input">
                    <asp:TextBox ID="tb_conPassword" runat="server" Width="250px" TextMode="Password"></asp:TextBox>
                </div>
            </div>

            <%--  Buttons  --%>
            <div style="height:5px;"></div>
            <div class="formContent_row">
                <div class="div_special">
                    <asp:Button ID="btn_Change" CssClass="btn_Change" runat="server" Text="Change" OnClick="btn_Change_Click" />
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
