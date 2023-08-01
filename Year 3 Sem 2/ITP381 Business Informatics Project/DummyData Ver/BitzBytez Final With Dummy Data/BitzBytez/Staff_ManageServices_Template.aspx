<%@ Page Title="" Language="C#" MasterPageFile="~/Staff_ManageServices.master" AutoEventWireup="true" CodeBehind="Staff_ManageServices_Template.aspx.cs" Inherits="BitzBytez.Staff_ManageServices_Template" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head2" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            var url = window.location.toString();
            url = url.split("Staff_ManageServices_Template.aspx", 1);
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
        /* Debugging */
        /*.manageService_content{
            border:1px solid red;
        }
        .manageService_content_titleRow, .manageService_content_row{
            border:1px solid blue;
        }*/

        .manageService_content {
            height: 100%;
            width: 100%;
            margin: auto;
        }

        .manageService_content_titleRow {
            padding: 25px 0 20px 25px;
        }

            .manageService_content_titleRow .lb_pageTitle {
                font-weight: bold;
                font-size: 32px;
                margin-bottom: 0.5rem;
                line-height: 1.2;
                margin-top: 0;
            }

        .manageService_content_row1 {
            padding: 15px 25px 25px 25px;
            display: flex;
        }

        .manageService_content_row1_leftRow, .manageService_content_row1_rightRow {
            flex: 1;
        }

        .manageService_content_row1_rightRow {
        }

        .manageService_content_row2 {
            padding: 15px 25px 25px 25px;
        }

        .btn_day {
            border-radius: 10px;
            padding: 10px 15px 10px 15px;
            text-align: center;
            border: 1px solid transparent;
            box-shadow: 3px 3px 8px #888888;
            min-width: 72px;
        }

        .manageService_content_row3 {
            padding: 15px 25px 15px 25px;
        }

        .addContainer {
            border: 1px solid black;
            padding: 25px;
            border-radius: 10px 10px 0px 0px;
            text-align: center;
            align-content: center;
        }

        .addContainer_row2 {
            margin-top: 15px;
        }

        .addContainer_add input {
            width: 100%;
            border-radius: 0px 0px 15px 15px;
            padding: 5px 0 5px 0;
            border: 1px solid black;
            border-top: none;
            font-weight: bold;
        }

            .addContainer_add input:hover {
                color: white;
                background: #888888;
            }

        .manageService_content_row4 {
            padding: 15px 25px 45px 25px;
        }

        .btn_remove {
            border-radius: 100px;
            border: 1px solid grey;
            color: #000;
            font-weight: bold;
            box-shadow: 2px 1px #888888;
        }

            .btn_remove:hover {
                background: #888888;
                color: #fff;
                box-shadow: 0px 0px 0px #888888;
            }

        .lb_startTime {
            font-weight: bold;
            padding-left: 4px;
            font-size: 16px;
        }

        .lb_endTime {
            padding-left: 34px;
            font-size: 14px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <div class="manageService_content">
        <div class="manageService_content_titleRow">
            <asp:Label ID="lb_pageTitle" CssClass="lb_pageTitle" runat="server" Text=""></asp:Label>
        </div>

        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <div class="manageService_content_row manageService_content_row1">
                    <div class="manageService_content_row1_leftRow">
                        <h5 style="font-weight: bold;">Set Price</h5>
                        <table>
                            <tr>
                                <td>
                                    <asp:TextBox ID="tb_price" Width="215px" runat="server" Text=""></asp:TextBox>
                                </td>
                                <td>
                                    <asp:Button ID="btn_updatePrice" runat="server" Text='Update' AutoPostBack="True" OnClick="btn_updatePrice_Click" />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <asp:Label ID="lb_errorPrice" runat="server" ForeColor="Red" Text=""></asp:Label>
                                    <asp:Label ID="lb_successPrice" runat="server" ForeColor="Green" Text=""></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </div>

                    <div class="manageService_content_row1_rightRow">
                        <h5 style="font-weight: bold;">Staff Incharge</h5>
                        <table>
                            <tr>
                                <td>
                                    <asp:DropDownList ID="ddl_Staff" Width="215px" runat="server">
                                    </asp:DropDownList>
                                </td>
                                <td>
                                    <asp:Button ID="btn_updateStaff" runat="server" Text='Update' AutoPostBack="True" OnClick="btn_updateStaff_Click" />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <asp:Label ID="lb_errorStaff" runat="server" ForeColor="Red" Text=""></asp:Label>
                                    <asp:Label ID="lb_successStaff" runat="server" ForeColor="Green" Text=""></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>

                <div class="manageService_content_row manageService_content_row2">
                    <asp:DataList ID="dl_daysOfTheWeek" runat="server" BorderStyle="None" BorderWidth="1px" CellPadding="0" RepeatDirection="Horizontal" Width="100%" AutoPostBack="True" OnItemCommand="dl_daysOfTheWeek_ItemsCommand">
                        <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
                        <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
                        <ItemStyle ForeColor="#003399" />
                        <ItemTemplate>
                            <asp:Button ID="btn_day" CssClass="btn_day" runat="server" Text='<%# Eval("dayShort") %>' AutoPostBack="True" CommandName="Select" />
                        </ItemTemplate>
                    </asp:DataList>
                </div>

                <div class="manageService_content_row manageService_content_row3">
                    <h5 style="font-weight: bold;">Add Timeslot</h5>
                    <div class="addContainer">
                        <div class="addContainer_row1">
                            <div>
                                Timeslot:
                            </div>
                            <div>
                                <asp:TextBox ID="tb_timeSlot" runat="server"></asp:TextBox>
                            </div>
                        </div>
                        <div class="addContainer_row2">
                            <div>
                                <asp:Label ID="lb_error" runat="server" ForeColor="Red" Text=""></asp:Label>
                            </div>
                        </div>
                    </div>
                    <div class="addContainer_add">
                        <asp:Button ID="btn_addDay" runat="server" Text="A D D" OnClick="btn_addDay_Click" AutoPostBack="True" />
                    </div>
                </div>

                <div class="manageService_content_row manageService_content_row4">
                    <h5 style="font-weight: bold;">Listed Timeslots</h5>
                    <asp:DataList ID="dl_timeSlot" runat="server" BorderStyle="None" BorderWidth="1px" CellPadding="0" RepeatColumns="3" RepeatDirection="Horizontal" Width="100%" AutoPostBack="True" OnItemCommand="dl_timeSlot_ItemsCommand">
                        <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
                        <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
                        <ItemStyle ForeColor="#003399" />
                        <ItemTemplate>
                            <table>
                                <tr>
                                    <td>
                                        <div style="height: 15px;"></div>
                                        <asp:Button ID="btn_remove" CssClass="btn_remove" runat="server" Text="X" AutoPostBack="True" CommandName="Select" />
                                        <asp:Label ID="lb_startTime" CssClass="lb_startTime" runat="server" Text='<%# Eval("start_time") %>'></asp:Label>
                                        <div style="height: 2px;"></div>
                                    </td>
                                </tr>
                                </tr>
                                <td>
                                    <div style="height: 2px;">
                                    </div>
                                    <asp:Label ID="lb_endTime" runat="server" CssClass="lb_endTime" Text='<%# "( End: "+Eval("end_time")+" )" %>'></asp:Label>
                                    <div style="height: 15px;">
                                    </div>
                                </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </asp:DataList>
                </div>

            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</asp:Content>
