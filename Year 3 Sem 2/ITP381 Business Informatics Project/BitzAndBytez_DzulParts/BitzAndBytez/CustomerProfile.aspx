<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="CustomerProfile.aspx.cs" Inherits="BitzAndBytez.CustomerProfile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>
        $(document).ready(function () {
            $('.button-left').click(function () {
                $('.sidebar').toggleClass('fliph');
            });

        });
    </script>
    <style>
        @import "https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css";
        @import url('https://fonts.googleapis.com/css?family=Roboto:100,100i,300,300i,400,400i,500,500i,700');

        body {
            font-size: 14px;
            color: #333;
            list-style: 26px;
            font-family: 'Roboto', sans-serif;
        }

        /** ======================  base css ==============================**/

        a:hover {
            text-decoration: none;
        }
        /** ======================  header ==============================**/
        .header {
            background-color: #3c8dbc;
        }

        .header .dropdown-menu {
            position: absolute;
            right: 0;
            left: auto;
            border-radius: 0px;
        }

        .header .user-image {
            float: left;
            width: 25px;
            height: 25px;
            border-radius: 50%;
            margin-right: 10px;
            margin-top: -2px;
        }

        .header .navbar-light .navbar-nav .nav-link {
            color: #fff;
        }

        .header .navbar-light .navbar-nav .nav-link:hover, .header .navbar-light .navbar-nav .nav-link:focus {
            background: rgba(0,0,0,0.1);
            color: #f6f6f6;
        }

        .header .fa.fa-fw.fa-bars {
            color: #fff;
        }

        .header .navbar-light .navbar-nav .nav-link {
            color: #fff;
            padding: 10px 20px;
            position: relative;
        }

        .header li > a > .label {
            position: absolute;
            top: 9px;
            right: 7px;
            text-align: center;
            font-size: 9px;
            padding: 2px 3px;
            line-height: .9;
            background-color: #333;
            border-radius: .25em;
        }

        .header li > a:after {
            display: none;
        }

        .header-ul {
            border-top-left-radius: 4px;
            border-top-right-radius: 4px;
            border-bottom-right-radius: 0;
            border-bottom-left-radius: 0;
            background-color: #ffffff;
            padding: 7px 10px;
            border-bottom: 1px solid #f4f4f4;
            color: #333;
            font-size: 14px;
        }

        .navbar-nav > .notifications-menu > .dropdown-menu, .navbar-nav > .messages-menu > .dropdown-menu, .navbar-nav > .tasks-menu > .dropdown-menu {
            width: 280px;
            padding: 0 0 0 0;
            margin: 0;
            top: 100%;
        }

        .navbar-nav > .messages-menu > .dropdown-menu li .menu > li > a > div > img {
            margin: auto 10px auto auto;
            width: 40px;
            height: 40px;
        }

        .navbar-nav > .messages-menu > .dropdown-menu li .menu > li > a, .navbar-nav > .notifications-menu > .dropdown-menu li .menu > li > a {
            margin: 0;
            padding: 10px 10px;
            display: block;
            white-space: nowrap;
            border-bottom: 1px solid #f4f4f4;
        }

        .navbar-nav > .messages-menu > .dropdown-menu li .menu > li > a > h4 {
            padding: 0;
            margin: 0 0 0 45px;
            color: #333;
            font-size: 15px;
            position: relative;
        }

        .navbar-nav > .messages-menu > .dropdown-menu li .menu > li > a > p {
            margin: 0 0 0 45px;
            font-size: 12px;
            color: #888888;
        }

        .footer-ul a {
            border-top-left-radius: 0;
            border-top-right-radius: 0;
            border-bottom-right-radius: 4px;
            border-bottom-left-radius: 4px;
            font-size: 12px;
            background-color: #fff;
            padding: 7px 10px;
            border-bottom: 1px solid #eeeeee;
            color: #333;
            display: block;
        }

        .dropdown-menu-over .menu {
            max-height: 200px;
            margin: 0;
            padding: 0;
            list-style: none;
            overflow-x: hidden;
        }

        .navbar-nav > .notifications-menu > .dropdown-menu li .menu > li > a {
            color: #444444;
            overflow: hidden;
            text-overflow: ellipsis;
            padding: 10px;
        }

        .navbar-nav > .notifications-menu > .dropdown-menu li .menu > li > a > .glyphicon, .navbar-nav > .notifications-menu > .dropdown-menu li .menu > li > a > .fa, .navbar-nav > .notifications-menu > .dropdown-menu li .menu > li > a > .ion {
            width: 20px;
        }

        a.navbar-brand {
            width: 165px;
        }


        /***    left menu ****/

        /***********************  TOP Bar ********************/
        .sidebar {
            width: 240px;
            background-color: #000;
            transition: all 0.5s ease-in-out;
        }

        .bg-defoult {
            background-color: #222;
        }

        .sidebar ul {
            list-style: none;
            margin: 0px;
            padding: 0px;
        }

        .sidebar li a, .sidebar li a.collapsed.active {
            display: block;
            padding: 8px 12px;
            color: #fff;
            border-left: 0px solid #dedede;
            text-decoration: none;
        }

        .sidebar li a.active {
            background-color: #000;
            border-left: 5px solid #dedede;
            transition: all 0.5s ease-in-out;
        }

        .sidebar li a:hover {
            background-color: #000 !important;
        }

        .sidebar li a i {
            padding-right: 5px;
        }

        .sidebar ul li .sub-menu li a {
            position: relative;
        }

        .sidebar ul li .sub-menu li a:before {
            font-family: FontAwesome;
            content: "\f105";
            display: inline-block;
            padding-left: 0px;
            padding-right: 10px;
            vertical-align: middle;
        }

        .sidebar ul li .sub-menu li a:hover:after {
            content: "";
            position: absolute;
            left: -5px;
            top: 0;
            width: 5px;
            background-color: #111;
            height: 100%;
        }

        .sidebar ul li .sub-menu li a:hover {
            background-color: #222;
            padding-left: 20px;
            transition: all 0.5s ease-in-out;
        }

        .sub-menu {
            border-left: 5px solid #dedede;
        }

        .sidebar li a .nav-label, .sidebar li a .nav-label + span {
            transition: all 0.5s ease-in-out;
        }


        .sidebar.fliph li a .nav-label, .sidebar.fliph li a .nav-label + span {
            display: none;
            transition: all 0.5s ease-in-out;
        }

        .sidebar.fliph {
            width: 42px;
            transition: all 0.5s ease-in-out;
        }

        .sidebar.fliph li {
            position: relative;
        }

        .sidebar.fliph .sub-menu {
            position: absolute;
            left: 39px;
            top: 0;
            background-color: #222;
            width: 150px;
            z-index: 100;
        }


        .user-panel {
            clear: left;
            display: block;
            float: left;
        }

        .user-panel > .image > img {
            width: 100%;
            max-width: 45px;
            height: auto;
        }

        .user-panel > .info, .user-panel > .info > a {
            color: #fff;
        }

        .user-panel > .info > p {
            font-weight: 600;
            margin-bottom: 9px;
        }

        .user-panel {
            clear: left;
            display: block;
            float: left;
            width: 100%;
            margin-bottom: 15px;
            padding: 25px 15px;
            border-bottom: 1px solid;
        }

        .user-panel > .info {
            padding: 0px 5px 5px 15px;
            /*line-height: 1;
            position: absolute;
            left: 55px;*/
        }

        .fliph .user-panel {
            display: none;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container" style="background: white; padding-left: 0px; min-height:600px;">
        <div class="row">
            <div>
                <div class="sidebar left" style="min-height: 795px;">
                    <div class="user-panel">
                        <div class="pull-left image">
                            <img src="http://via.placeholder.com/160x160" class="rounded-circle" alt="User Image">
                        </div>
                        <div class="pull-left info">
                            <p>Welcome, </p>
                            <h4 style="letter-spacing:-1px;"><strong>Peter Tan</strong></h4>
                        </div>
                    </div>
                    <ul class="list-sidebar bg-defoult">
                        <li><a href="#" data-toggle="collapse" data-target="#dashboard" class="collapsed active"><i class="fa fa-history"></i><span class="nav-label">&emsp;History</span><span class="fa fa-chevron-left pull-right"></span></a>
                            <ul class="sub-menu collapse" id="dashboard">
                                <li><a href="#">Purchases</a></li>
                                <li><a href="#">Bookings</a></li>
                            </ul>
                        </li>
<%--                        <li><a href="#"><i class="fa fa-diamond"></i><span class="nav-label">Layouts</span></a> </li>
                        <li><a href="#" data-toggle="collapse" data-target="#products" class="collapsed active"><i class="fa fa-bar-chart-o"></i><span class="nav-label">Graphs</span> <span class="fa fa-chevron-left pull-right"></span></a>
                            <ul class="sub-menu collapse" id="products">
                                <li class="active"><a href="#">CSS3 Animation</a></li>
                                <li><a href="#">General</a></li>
                                <li><a href="#">Buttons</a></li>
                                <li><a href="#">Tabs & Accordions</a></li>
                                <li><a href="#">Typography</a></li>
                                <li><a href="#">FontAwesome</a></li>
                                <li><a href="#">Slider</a></li>
                                <li><a href="#">Panels</a></li>
                                <li><a href="#">Widgets</a></li>
                                <li><a href="#">Bootstrap Model</a></li>
                            </ul>
                        </li>--%>
<%--                        <li><a href="#"><i class="fa fa-laptop"></i><span class="nav-label">Grid options</span></a> </li>
                        <li><a href="#" data-toggle="collapse" data-target="#tables" class="collapsed active"><i class="fa fa-table"></i><span class="nav-label">Tables</span><span class="fa fa-chevron-left pull-right"></span></a>
                            <ul class="sub-menu collapse" id="tables">
                                <li><a href="">Static Tables</a></li>
                                <li><a href="">Data Tables</a></li>
                                <li><a href="">Foo Tables</a></li>
                                <li><a href="">jqGrid</a></li>
                            </ul>
                        </li>
                        <li><a href="#" data-toggle="collapse" data-target="#e-commerce" class="collapsed active"><i class="fa fa-shopping-cart"></i><span class="nav-label">E-commerce</span><span class="fa fa-chevron-left pull-right"></span></a>
                            <ul class="sub-menu collapse" id="e-commerce">
                                <li><a href="">Products grid</a></li>
                                <li><a href="">Products list</a></li>
                                <li><a href="">Product edit</a></li>
                                <li><a href="">Product detail</a></li>
                                <li><a href="">Cart</a></li>
                                <li><a href="">Orders</a></li>
                                <li><a href="">Credit Card form</a> </li>
                            </ul>
                        </li>--%>
                        <li>
                            <asp:LinkButton ID="btn_warrantyTracker" runat="server"><a href="#"><i class="fa fa-clock-o"></i><span class="nav-label">&emsp;Warranty Tracker</span></asp:LinkButton>
                        </li>
                        <li>
                            <asp:LinkButton ID="btn_viewBookings" runat="server"><i class="fa fa-calendar-alt"></i><span class="nav-label">&emsp;Upcoming Bookings</span></asp:LinkButton>
                        </li>
                        <li>
                            <asp:LinkButton ID="btn_changePassword" runat="server"><i class="fa fa-key"></i><span class="nav-label">&emsp;Change Password</span></asp:LinkButton>
                        </li>
                        <li>
                            <asp:LinkButton ID="btn_LogOut" runat="server"><i class="fa fa-power-off"></i><span class="nav-label">&emsp;Log Out</span></asp:LinkButton>
                        </li>

                    </ul>
                </div>
            </div>
            <div></div>
        </div>
    </div>
</asp:Content>
