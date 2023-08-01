<%@ Page Title="" Language="C#" MasterPageFile="~/Staff_ServiceTransactions.master" AutoEventWireup="true" CodeBehind="Staff_ServiceTransactions_Appointments.aspx.cs" Inherits="BitzAndBytez.Staff_ServiceTransactions_Appointments" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head2" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            var url = window.location.toString();
            url = url.split("Staff_ServiceTransactions_Appointments.aspx", 1);
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
        /* Debugger */
        /*.contentContainer{
            border:1px solid red;
        }
        .contentContainer_left{
            border:1px solid green;
        }
        .contentContainer_right{
            border:1px solid red;
        }*/

        .contentContainer{
            margin:auto;
            display:flex;
        }
        .contentContainer_left{
            flex:1;
            border-right:1px solid black;
        }
        .contentContainer_left_rowTitle{
            width:100%;
            text-align:left;
            padding:0px 0px 5px 0px;
            font-weight:bold;
        }
        .contentContainer_left_row{
            width:100%;
            padding:0px 25px 30px 0px;
            text-align:center;
            align-content:center;
        }
        .contentContainer_left_row input{
            width:150px; 
            min-height:54px; 
            white-space: normal;
            border:1px solid grey;
            padding: 15px;
            border-radius:5px;
            border:1px solid transparent;
            box-shadow: -3px 5px 8px #888888;
            background:#17a2b8;
            color:#fff;
        }
        .contentContainer_left_row input:hover{
            background:#138496;
            box-shadow: 0px 0px #888888;
        }
        .contentContainer_right{
            flex:6;
        }
        .contentContainer_right_titleRow{
            padding:0 0 20px 25px;
        }
        .contentContainer_right_titleRow .lb_pageTitle{
            font-weight:bold;
            font-size:32px;
            margin-bottom:0.5rem;
            line-height:1.2;
            margin-top:0;
        }
        
        /* Buttons */
        .contentContainer_right_settings{
            padding:15px 25px 20px 25px;
        }
        .btn_reset, .btn_custEmail{
            padding:6px 24px 6px 24px;
            color:white;
            border:1px solid transparent;
            border-radius:5px;
            font-size:16px;
            background: #17a2b8;
            box-shadow: 0px 5px 8px #888888;
            margin-right:25px;
        }
        .btn_reset:hover, .btn_custEmail:hover{
            background: #138496;
            box-shadow: 0px 0px #888888;
        }
        .ddl_month{
            padding:8px 8px 8px 8px;
            color:white;
            border:1px solid transparent;
            border-radius:5px;
            font-size:16px;
            background: #17a2b8;
            box-shadow: 0px 5px 8px #888888;
            margin-right:25px;
        }
        .ddl_month:focus{
            background: #138496;
            box-shadow: 0px 0px #888888;
        }
        .ddl_month option{
            background:white;
            color:black;
        }
        .tb_custEmail{
            padding:7.5px 8px 7.5px 8px;
            color:black;
            border:1px solid grey;
            border-radius:5px;
            font-size:16px;
        }
        
        /* Appointments */
        .contentContainer_right_row{
            padding:15px 0 25px 0;
        }
        .template_container{
            border-bottom:1px solid black;
            padding:15px;
            margin: 0 25px 25px 25px;
            text-align:center;
        }
        .template_date{
            font-size:20px;
            color:black;
            font-weight:bold;
            margin-bottom:20px;
        }
        .template_timeStart{
            color:black;
            margin-bottom:5px;
        }
        .template_duration{
            color:black;
            margin-bottom:20px;
        }
        .lb_timeStartTitle, .lb_durationTitle{
            font-weight:bold;
        }
        .template_addInfoTitle{
            color:black;
            font-weight:bold;
            margin-bottom:3px;
        }
        .template_addInfo{
            color:black;
            border:1px solid black;
            min-height:40px;
            padding:10px;
            margin-bottom:20px;
        }
        .template_custEmailTitle{
            color:black;
            font-weight:bold;
            margin-bottom:2px;
        }
        .template_custEmail{
            color:black;
            margin-bottom:20px;
        }
        .template_staffInchargeTitle{
            color:black;
            font-weight:bold;
            margin-bottom:2px;
        }
        .template_staffIncharge{
            color:black;
            margin-bottom:20px;
        }
        .template_buttons{
            margin-bottom:20px;
        }
        .btn_deliver, .btn_cancel{
            padding:12px 24px 12px 24px;
            color:white;
            border:1px solid transparent;
            border-radius:5px;
            font-size:18px;
            box-shadow: 0px 5px 8px #888888;
        }
        .btn_deliver{
            margin-right:5px;
            background: #28a745;
        }
        .btn_deliver:hover{
            background: #218838;
            box-shadow: 0px 0px #888888;
        }
        .btn_cancel{
            margin-left:5px;
            background: #dc3545;
        }
        .btn_cancel:hover{
            background: #c82333;
            box-shadow: 0px 0px #888888;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
        <div class="contentContainer">
            <div class="contentContainer_left">
                <div class="contentContainer_left_rowTitle">
                    <label>
                        Filter by:
                    </label>
                </div>
                <div class="contentContainer_left_row">
                    <asp:Button ID="btn_PCBuild" runat="server" Text="PC Building Service" OnClick="btn_PCBuild_Click" />
                </div>
                <div class="contentContainer_left_row">
                    <asp:Button ID="btn_PCRepair" runat="server" Text="PC Repair Service" OnClick="btn_PCRepair_Click" />
                </div>
                <div class="contentContainer_left_row">
                    <asp:Button ID="btn_PCLesson" runat="server" Text="PC Building Lesson" OnClick="btn_PCLesson_Click" />
                </div>
                <div class="contentContainer_left_row">
                    <asp:Button ID="btn_onsiteDiag" runat="server" Text="Onsite Diagnosis" OnClick="btn_onsiteDiag_Click"  />
                </div>
            </div>
            <div class="contentContainer_right">
                <div class="contentContainer_right_titleRow">
                    <asp:Label ID="lb_pageTitle" CssClass="lb_pageTitle" runat="server" Text=""></asp:Label>
                </div>
                
                <div class="contentContainer_right_settings">
                    <asp:Button ID="btn_reset" CssClass="btn_reset" runat="server" Text="Reset" AutoPostBack="true" OnClick="btn_reset_Click" />
                    <asp:DropDownList ID="ddl_month" CssClass="ddl_month" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddl_month_SelectedIndexChanged">
                        <asp:ListItem>Month</asp:ListItem>
                        <asp:ListItem>January</asp:ListItem>
                        <asp:ListItem>February</asp:ListItem>
                        <asp:ListItem>March</asp:ListItem>
                        <asp:ListItem>April</asp:ListItem>
                        <asp:ListItem>May</asp:ListItem>
                        <asp:ListItem>June</asp:ListItem>
                        <asp:ListItem>July</asp:ListItem>
                        <asp:ListItem>August</asp:ListItem>
                        <asp:ListItem>September</asp:ListItem>
                        <asp:ListItem>October</asp:ListItem>
                        <asp:ListItem>November</asp:ListItem>
                        <asp:ListItem>December</asp:ListItem>
                    </asp:DropDownList>
                    <asp:TextBox ID="tb_custEmail" CssClass="tb_custEmail" placeholder="Customer Email" runat="server"></asp:TextBox>
                    <asp:Button ID="btn_custEmail" CssClass="btn_custEmail" runat="server" Text="Search" AutoPostBack="true" OnClick="btn_custEmail_Click" />
                </div>
                <div class="contentContainer_right_row">
                    <asp:DataList ID="dl_appointments" runat="server" BorderStyle="None" BorderWidth="1px" CellPadding="0" RepeatDirection="Horizontal" RepeatColumns="2" Width="100%" AutoPostBack="True" OnItemCommand="dl_appointments_ItemCommand">
                        <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
                        <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
                        <ItemStyle ForeColor="#003399" Width="50%" />
                        <ItemTemplate>
                            <div class="template_container">
                                <div class="template_date">
                                    <asp:Label ID="lb_date" runat="server" Text='<%# Eval("date") %>'></asp:Label>
                                </div>
                                <div class="template_timeStart">
                                    <asp:Label ID="lb_timeStartTitle" CssClass="lb_timeStartTitle" runat="server" Text="Time: "></asp:Label>
                                    <asp:Label ID="lb_timeStart" runat="server" Text='<%# Eval("start_time") %>'></asp:Label>
                                </div>
                                <div class="template_duration">
                                    <asp:Label ID="lb_durationTitle" CssClass="lb_durationTitle" runat="server" Text="Duration: "></asp:Label>
                                    <asp:Label ID="lb_duration" runat="server" Text='<%# Eval("duration") %>'></asp:Label>
                                </div>
                                <div class="template_addInfoTitle">
                                    <asp:Label ID="lb_addInfoTitle" runat="server" Text="Comment:"></asp:Label>
                                </div>
                                <div class="template_addInfo">
                                    <asp:Label ID="lb_addInfo" runat="server" Text='<%# Eval("additionalInfo") %>'></asp:Label>
                                </div>
                                <div class="template_custEmailTitle">
                                    <asp:Label ID="lb_custEmailTitle" runat="server" Text="Customer Email:"></asp:Label>
                                </div>
                                <div class="template_custEmail">
                                    <asp:Label ID="lb_custEmail" runat="server" Text='<%# Eval("cust_email") %>'></asp:Label>
                                </div>
                                <div class="template_staffInchargeTitle">
                                    <asp:Label ID="lb_staffInchargeTitle" runat="server" Text="Staff Incharge:"></asp:Label>
                                </div>
                                <div class="template_staffIncharge">
                                    <asp:Label ID="lb_staffIncharge" runat="server" Text='<%# Eval("staff_incharge") %>'></asp:Label>
                                </div>
                                <div class="template_buttons">
                                    <asp:Button ID="btn_deliver" CssClass="btn_deliver" runat="server" Text="Deliver" AutoPostBack="True" CommandName="Deliver" />
                                    <asp:Button ID="btn_cancel" CssClass="btn_cancel" runat="server" Text="Cancel" AutoPostBack="True" CommandName="Cancel" />
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:DataList>
                </div>
            </div>
        </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
