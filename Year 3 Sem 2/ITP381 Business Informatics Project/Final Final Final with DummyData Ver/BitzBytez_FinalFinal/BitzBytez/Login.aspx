<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="BitzBytez.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style>
        @import url('https://fonts.googleapis.com/css?family=Numans');

        html, body {
            background-image: url('img/bg_login.jpg');
            background-size: cover;
            background-repeat: no-repeat;
            height: 100%;
            margin: 0;
            font-family: 'Numans', sans-serif;
        }

        .container {
            height: 100%;
            align-content: center;
        }

        .card {
            height: 370px;
            /*margin-top: auto;
            margin-bottom: auto;
            top: 50%;
            bottom: 50%;*/
            width: 400px;
            background-color: rgba(0,0,0,0.5) !important;
        }

        .social_icon span {
            font-size: 60px;
            margin-left: 10px;
            color: #FFC312;
        }

        .social_icon span:hover {
            color: white;
            cursor: pointer;
        }

        .card-header h3 {
            color: white;
        }

        .social_icon {
            position: absolute;
            right: 20px;
            top: -45px;
        }

        .input-group-prepend span {
            width: 50px;
            background-color: #FFC312;
            color: black;
            border: 0 !important;
        }

        input:focus {
            outline: 0 0 0 0 !important;
            box-shadow: 0 0 0 0 !important;
        }

        .remember {
            color: white;
        }

        .remember input {
            width: 20px;
            height: 20px;
            margin-left: 15px;
            margin-right: 5px;
        }

        .login_btn {
            color: black;
            background-color: #FFC312;
            width: 100px;
        }

        .login_btn:hover {
            color: black;
            background-color: white;
        }

        .links {
            color: white;
        }

        .links a {
            margin-left: 4px;
        }

        .vertical-center {
            margin: 0;
            position: absolute;
            top: 50%;
            -ms-transform: translateY(-50%);
            transform: translateY(-50%);
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <div style="height: 100vh; width: 100%; color: black;">
        <div class="vertical-center" style="width:100%">
            <div class="d-flex justify-content-center h-100">
            <div class="card">
                <div class="card-header">
                    <h3>Sign In</h3>
                    <div class="d-flex justify-content-end social_icon">
                        <span><i class="fab fa-facebook-square"></i></span>
                        <span><i class="fab fa-google-plus-square"></i></span>
                        <span><i class="fab fa-twitter-square"></i></span>
                    </div>
                </div>
                <div class="card-body">
                    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                            <div class="input-group form-group">
                                <div class="input-group-prepend">
                                    <span class="input-group-text"><i class="fas fa-user"></i></span>
                                </div>
                                <asp:TextBox ID="tb_username" type="text" runat="server" class="form-control" placeholder="email"></asp:TextBox>
                            </div>
                            <div class="input-group form-group">
                                <div class="input-group-prepend">
                                    <span class="input-group-text"><i class="fas fa-key"></i></span>
                                </div>
                                <asp:TextBox ID="tb_password" type="password" runat="server" class="form-control" placeholder="password"></asp:TextBox>
                            </div>
                            <div class="row align-items-center remember">
                            </div>
                            <div class="form-group">
                                <asp:Button ID="btn_submit" runat="server" class="btn float-right login_btn" Text="Login" OnClick="btn_submit_Click" />
                            </div>
                            <div class="form-group">
                                <asp:Label ID="lb_error" runat="server" Text="" ForeColor="Red"></asp:Label>
                            </div>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
                <div class="d-flex justify-content-center">
                    <asp:Button ID="btn_staff" CssClass="btn btn-info" runat="server" Text="Paul (Manager)" style="margin: 5px 5px 5px 5px;" OnClick="btn_staff_Click"/>
                    <asp:Button ID="btn_customer" CssClass="btn btn-success" runat="server" Text="KH (Customer)" style="margin: 5px 5px 5px 5px;" OnClick="btn_customer_Click"/>
                </div>
                <div class="card-footer">
                    <div class="d-flex justify-content-center links">
                        Don't have an account?<a href="SignUp.aspx">Sign Up</a>
                    </div>
                </div>
            </div>
        </div>
        </div>
    </div>
</asp:Content>

