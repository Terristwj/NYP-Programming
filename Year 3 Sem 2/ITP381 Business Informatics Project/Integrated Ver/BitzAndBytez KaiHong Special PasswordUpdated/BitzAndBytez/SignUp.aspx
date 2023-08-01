﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="SignUp.aspx.cs" Inherits="BitzAndBytez.SignUp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        @import url('https://fonts.googleapis.com/css?family=Numans');

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
        <div class="vertical-center" style="width: 100%">
            <div class="d-flex justify-content-center h-100">
                <div class="card" style="height:auto;">
                    <div class="card-header">
                        <h3>Sign Up</h3>
                        <div class="d-flex justify-content-end social_icon">
                            <span><i class="fab fa-facebook-square"></i></span>
                            <span><i class="fab fa-google-plus-square"></i></span>
                            <span><i class="fab fa-twitter-square"></i></span>
                        </div>
                    </div>
                    <div class="card-body">
                        
                            <div class="input-group form-group">
<%--                                <div class="input-group-prepend">
                                    <span class="input-group-text"><i class="fas fa-user"></i></span>
                                </div>--%>
                                <asp:TextBox ID="tb_username" type="text" runat="server" class="form-control" placeholder="username"></asp:TextBox>
                            </div>

                            <div class="input-group form-group">
                                <asp:TextBox ID="tb_email" type="text" runat="server" class="form-control" placeholder="email"></asp:TextBox>
                            </div>

                            <div class="input-group form-group">
<%--                                <div class="input-group-prepend">
                                    <span class="input-group-text"><i class="fas fa-key"></i></span>
                                </div>--%>
                                <asp:TextBox ID="tb_password" type="password" runat="server" class="form-control" placeholder="password"></asp:TextBox>
                            </div>

                            <div class="input-group form-group">
<%--                                <div class="input-group-prepend">
                                    <span class="input-group-text"><i class="fas fa-key"></i></span>
                                </div>--%>
                                <asp:TextBox ID="tb_cPassword" type="password" runat="server" class="form-control" placeholder="confirm password"></asp:TextBox>
                            </div>
                        
                            <div class="form-group">
                                <asp:Label ID="lb_error" runat="server" Text="" ForeColor="Red"></asp:Label>
                            </div>

                            <div class="form-group">
                                <asp:Button ID="btn_cancel" runat="server" class="btn float-left login_btn" Text="Cancel" OnClick="btn_cancel_Click" />
                                <asp:Button ID="btn_signUp" runat="server" class="btn float-right login_btn" Text="Sign Up" OnClick="btn_signUp_Click" />
                            </div>

                        
                    </div>
<%--                    <div class="card-footer">
                        <div class="d-flex justify-content-center links">
                            Don't have an account?<a href="#">Sign Up</a>
                        </div>
                        <div class="d-flex justify-content-center">
                            <a href="#">Forgot your password?</a>
                        </div>
                    </div>--%>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
