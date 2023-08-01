<%@ Page Title="" Language="C#" MasterPageFile="~/Staff_ManageServices.master" AutoEventWireup="true" CodeBehind="Staff_ManageServices_General.aspx.cs" Inherits="BitzAndBytez.Staff_ManageServices_General" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head2" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            var url = window.location.toString();
            url = url.split("Staff_ManageServices_General.aspx", 1);
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
        }
        .addContainer_left, .addContainer_right{
            border:1px solid red;
        }*/

        .manageService_content{
            height:100%;
            width:100%;
            margin:auto;
        }
        .manageService_content_titleRow{
            padding:25px 0 15px 25px;
        }
        .manageService_content_titleRow h2{
            font-weight:bold;
        }
        .manageService_content_row1{
            padding:15px 25px 15px 25px;
        }
        .addContainer{
            border:1px solid black;
            padding:25px;
            display:flex;
            border-radius: 10px 10px 0px 0px;
        }
        .addContainer_left{
            flex:1;
        }
        .addContainer_leftRow2, .addContainer_leftRow3{
            margin-top:15px;
        }
        .addContainer_right{
            flex:1;
        }
        .addContainer_right input{
            height:100%;
            width:100%;
            text-align:center;
        }
        .addContainer_add input{
            width:100%;
            border-radius: 0px 0px 15px 15px;
            padding: 5px 0 5px 0 ;
            border:1px solid black;
            border-top:none;
            font-weight:bold;
        }
        .addContainer_add input:hover{
            color:white;
            background: #888888;
        }

        .manageService_content_row2{
            padding:15px 25px 25px 25px;
        }
        .btn_remove{
            border-radius:100px;
            border:1px solid grey;
            color:#000;
            font-weight:bold;
            box-shadow: 2px 1px #888888;
        }
        .btn_remove:hover{
            background: #888888;
            color:#fff;
            box-shadow: 0px 0px #888888;
        }
        .lb_name{
            font-weight:bold;
            padding-left:4px;
            font-size:16px;
        }
        .lb_date{
            padding-left:34px;
            font-size:14px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <div class="manageService_content">
        <div class="manageService_content_titleRow">
            <h2>General</h2>
        </div>

        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
            <div class="manageService_content_row manageService_content_row1">
                <h5 style="font-weight:bold;">Add Unavailable Day</h5>
                <div class="addContainer">
                    <div class="addContainer_left">
                        <div class="addContainer_leftRow1">
                            <div>
                                Occasion:
                            </div>
                            <div>
                                <asp:TextBox ID="tb_occasion" runat="server"></asp:TextBox>
                            </div>
                        </div>
                        <div class="addContainer_leftRow2">
                            <div>
                                Date:
                            </div>
                            <div>
                                <asp:TextBox ID="tb_date" runat="server" ReadOnly="True"></asp:TextBox>
                            </div>
                        </div>
                        <div class="addContainer_leftRow3">
                            <div>
                                <asp:Label ID="lb_error" runat="server" ForeColor="Red" Text=""></asp:Label>
                            </div>
                        </div>
                    </div>
                    <div class="addContainer_right">
                        <div>
                            <asp:Calendar ID="Calendar1" runat="server" AutoPostBack="True" 
                                OnSelectionChanged="Calendar1_SelectionChanged"></asp:Calendar>
                        </div>
                    </div>
                </div>
                <div class="addContainer_add">
                    <asp:Button ID="btn_addDay" runat="server" Text="A D D" OnClick="btn_addDay_Click" AutoPostBack="True"/>
                </div>
            </div>

            <div class="manageService_content_row manageService_content_row2">
                <h5 style="font-weight:bold;">Unavailable Days</h5>
                <asp:DataList ID="dl_holidays" runat="server" BorderStyle="None" BorderWidth="1px" CellPadding="0" RepeatColumns="3" RepeatDirection="Horizontal" Width="100%" AutoPostBack="True" OnItemCommand="dl_ItemCommand" >
                    <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
                    <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
                    <ItemStyle ForeColor="#003399" />
                    <ItemTemplate>
                        <table>
                            <tr>
                                <td>
                                    <div style="height:15px;"></div>
                                    <asp:Button ID="btn_remove" CssClass="btn_remove" runat="server" Text="X" AutoPostBack="True" CommandName="Select" />
                                    <asp:Label ID="lb_name" CssClass="lb_name" runat="server" Text='<%# Eval("name") %>' ></asp:Label>
                                    <div style="height:2px;"></div>
                                </td>
                            </tr>
                            </tr>
                                <td>
                                    <div style="height:2px;">
                                    </div>
                                    <asp:Label ID="lb_date" runat="server" CssClass="lb_date" Text='<%# "( "+Eval("date")+" )" %>'></asp:Label>
                                    <div style="height:15px;">
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