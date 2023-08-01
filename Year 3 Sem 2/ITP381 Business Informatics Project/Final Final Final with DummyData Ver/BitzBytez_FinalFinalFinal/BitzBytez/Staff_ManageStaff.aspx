<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Staff_ManageStaff.aspx.cs" Inherits="BitzBytez.Staff_ManageStaff" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            var url = window.location.toString();
            url = url.split("Staff_ManageStaff.aspx", 1);
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
        .upperContainer {
            width: 90%;
            margin: auto;
            justify-content: center;
            align-items: center;
        }

        .upperContainer2 {
            width: 95%;
            margin: auto;
            background: #fff;
        }

        .mainHeader {
            width: 95%;
            margin: auto;
            border-bottom: 1px solid black;
        }

        .mainHeader_title {
            width: 95%;
            padding: 25px 0 15px 0;
            margin: auto;
            display: flex;
            font-weight: bold;
            font-size: 32px;
        }

            .mainHeader_title h2 {
                font-weight: bold;
                font-size: 32px;
            }

        /* Content */
        .mainContent {
            width: 95%;
            margin: auto;
            background: #fff;
            padding: 25px 0 25px 10px;
        }

        .contentContainer2 {
            display: flex;
        }

        .contentContainer_left {
            flex: 4;
        }

        .contentContainer_right {
            flex: 1;
        }

        /* Buttons */
        .btn_addStaff {
            padding: 25px;
            margin: auto;
            color: white;
            border: 1px solid transparent;
            border-radius: 5px;
            font-size: 16px;
            letter-spacing: 1px;
            background: #007bff;
            box-shadow: 0px 0px 8px #888888;
            vertical-align: middle;
            margin-top: 25px;
        }

            .btn_addStaff:hover {
                background: #0069d9;
                box-shadow: 0px 0px #888888;
            }

        .contentContainer_settings {
            padding: 15px 25px 10px 25px;
        }

        .contentContainer_settings2 {
            padding: 10px 25px 20px 153px;
        }

        .btn_reset, .btn_name {
            padding: 6px 21px 6px 21px;
            color: darkslategray;
            border: 1px solid transparent;
            border-radius: 5px;
            font-size: 16px;
            letter-spacing: 1px;
            background: #fff;
            box-shadow: 0px 0px 8px #888888;
        }

        .btn_reset {
            margin-right: 26px;
        }

            .btn_reset:hover, .btn_name:hover {
                background: #ddd;
                box-shadow: 0px 0px #888888;
            }

        .tb_name {
            padding: 7.5px 8px 7.5px 8px;
            color: black;
            border: 1px solid grey;
            border-radius: 5px;
            font-size: 16px;
            width: 180px;
            margin-right: 20px;
        }

        .ddl_role {
            padding: 8px 8px 8px 8px;
            color: darkslategray;
            border: 1px solid transparent;
            border-radius: 5px;
            font-size: 16px;
            letter-spacing: 1px;
            background: #fff;
            box-shadow: 0px 0px 8px #888888;
            margin-right: 25px;
            width: 180px;
        }

            .ddl_role:focus, .ddl_month:hover {
                background: #ddd;
                box-shadow: 0px 0px #888888;
            }

            .ddl_role option {
                background: white;
                color: black;
            }

        /* Staff List */
        .contentContainer_row {
            padding: 15px 0 25px 0;
        }

        .gv_staffList {
            width: 100%;
            border: 1px solid grey;
        }

        .gv_staffList_btnRevoke {
            background: #007bff;
            text-align: center;
            color: white !important;
            border-bottom: 1px solid black;
        }

            .gv_staffList_btnRevoke a {
                color: white !important;
            }

        th {
            padding: 10px 15px;
        }

        td {
            padding: 15px;
        }

        /* Toggle Button */
        .switch {
            position: absolute;
            display: inline-block;
            width: 98px;
            height: 41px;
            margin-left: -128px;
            border-radius: 5px;
            box-shadow: 0px 2px 8px #888888;
        }

            .switch:hover {
                box-shadow: 0px 0px #888888;
            }

            .switch input {
                display: none;
            }

        .slider {
            position: absolute;
            cursor: pointer;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background-color: #dc3545;
            -webkit-transition: .4s;
            transition: .4s;
        }
        /* Toggle: AND */
        input:checked + .slider {
            background-color: #28a745;
        }

            input:checked + .slider:before {
                transform: translateX(62px);
            }
        /*------ ADDED CSS ---------*/
        .on {
            display: none;
        }

        .on, .off {
            color: white;
            position: absolute;
            transform: translate(-50%,-50%);
            top: 50%;
            left: 50%;
            letter-spacing: 2px;
        }

        input:checked + .slider .on {
            display: block;
        }

        input:checked + .slider .off {
            display: none;
        }
        /*--------- END --------*/
        /* Rounded sliders */
        .slider.round {
            border-radius: 5px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="upperContainer">
        <div class="upperContainer2">
            <div class="mainHeader">
                <div class="mainHeader_title">
                    <h2>Manage Staff</h2>
                </div>
            </div>
            <div class="mainContent">
                <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <div class="contentContainer">
                            <div class="contentContainer2">
                                <div class="contentContainer_left">
                                    <div class="contentContainer_settings">
                                        <asp:Button ID="btn_reset" CssClass="btn_reset" runat="server" Text="Reset" AutoPostBack="true" OnClick="btn_reset_Click" />
                                        <asp:DropDownList ID="ddl_role" CssClass="ddl_role" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddl_role_SelectedIndexChanged">
                                            <asp:ListItem>Role</asp:ListItem>
                                            <asp:ListItem Value="manager">Manager</asp:ListItem>
                                            <asp:ListItem Value="cso">CSO</asp:ListItem>
                                            <asp:ListItem Value="sm">SM</asp:ListItem>
                                            <asp:ListItem Value="pm">PM</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                    <div class="contentContainer_settings2">

                                        <!-- Toggle Button -->
                                        <label class="switch">
                                            <asp:CheckBox ID="togBtn" runat="server" AutoPostBack="true" />
                                            <div class="slider round">
                                                <!--ADDED HTML -->
                                                <span class="on">AND</span>
                                                <span class="off">OR</span>
                                                <!--END-->
                                            </div>
                                        </label>

                                        <asp:TextBox ID="tb_name" CssClass="tb_name" placeholder="Name" runat="server"></asp:TextBox>
                                        <asp:Button ID="btn_name" CssClass="btn_name" runat="server" Text="Search" AutoPostBack="true" OnClick="btn_name_Click" />
                                    </div>
                                </div>
                                <div class="contentContainer_right">
                                    <asp:Button ID="btn_addStaff" CssClass="btn_addStaff" runat="server" Text="Add Staff" OnClick="btn_addStaff_Click" />
                                </div>
                            </div>


                            <div class="contentContainer_row">
                                <asp:GridView ID="gv_staffList" CssClass="gv_staffList" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" AutoPostBack="True" OnRowCommand="gv_staffList_RowCommand">
                                    <Columns>

                                        <asp:BoundField DataField="id" HeaderText="id" />
                                        <asp:BoundField DataField="role" HeaderText="Role" />
                                        <asp:BoundField DataField="email" HeaderText="Email" />
                                        <asp:BoundField DataField="username" HeaderText="Name" />

                                        <asp:ButtonField Text="Select" ItemStyle-CssClass="gv_staffList_btnRevoke" CommandName="Select">

                                            <ItemStyle CssClass="gv_staffList_btnRevoke" />
                                        </asp:ButtonField>

                                    </Columns>
                                    <HeaderStyle BackColor="#000" Font-Bold="True" ForeColor="White" CssClass="gv_Header" />
                                    <AlternatingRowStyle BackColor="#ddddddd" />
                                </asp:GridView>
                            </div>
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>
    </div>
</asp:Content>

