<%@ Page Title="" Language="C#" MasterPageFile="~/Staff_ServiceTransactions.master" AutoEventWireup="true" CodeBehind="Staff_ServiceTransactions_Transactions.aspx.cs" Inherits="BitzAndBytez.Staff_ServiceTransactions_Transactions" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head2" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            var url = window.location.toString();
            url = url.split("Staff_ServiceTransactions_Transactions.aspx", 1);
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
            padding:15px 25px 10px 25px;
        }
        .contentContainer_right_settings2{
            padding:10px 25px 20px 153px;
        }
        .btn_reset, .btn_custEmail, .btn_date, .btn_dateDisabled{
            padding:6px 24px 6px 24px;
            color:white;
            border:1px solid transparent;
            border-radius:5px;
            font-size:16px;
            background: #17a2b8;
            box-shadow: 0px 5px 8px #888888;
            margin-right:25px;
        }
        .btn_dateDisabled{
            opacity:0.65;
        }
        .btn_reset:hover, .btn_custEmail:hover, .btn_date:hover{
            background: #138496;
            box-shadow: 0px 0px #888888;
        }
        .tb_custEmail, .tb_date{
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
        .btn_deliever, .btn_cancel{
            padding:12px 24px 12px 24px;
            color:white;
            border:1px solid transparent;
            border-radius:5px;
            font-size:18px;
        }
        .btn_deliever{
            background: #28a745;
        }
        .btn_cancel{
            background: #dc3545;
        }

        /* Toggle Button */
        .switch {
            position: absolute;
            display: inline-block;
            width: 98px;
            height: 41px;
            margin-left:-128px;
            border-radius:5px;
            box-shadow: 0px 5px 8px #888888;
        }
        .switch:hover{
            box-shadow: 0px 0px #888888;
        }
        .switch input {
            display:none;
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
        .on
        {
            display: none;
        }
        .on, .off
        {
            color: white;
            position: absolute;
            transform: translate(-50%,-50%);
            top: 50%;
            left: 50%;
            letter-spacing:2px;
        }
        input:checked+ .slider .on
        {
            display: block;
        }
        input:checked + .slider .off
        {
            display: none;
        }
        /*--------- END --------*/
        /* Rounded sliders */
        .slider.round {
            border-radius:5px;
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
                    <asp:TextBox ID="tb_date" CssClass="tb_date" placeholder="Date" runat="server"></asp:TextBox>
                    <asp:Button ID="btn_date" CssClass="btn_date" runat="server" Text="Search" AutoPostBack="true" OnClick="btn_date_Click" />
                </div>
                <div class="contentContainer_right_settings2">
                    
                    <!-- Toggle Button -->
                    <label class="switch">
                        <asp:CheckBox ID="togBtn" runat="server" AutoPostBack="true" OnCheckedChanged="togBtn_CheckedChanged" />
                        <div class="slider round">
                            <!--ADDED HTML -->
                            <span class="on">AND</span>
                            <span class="off">OR</span>
                            <!--END-->
                        </div>
                    </label>

                    <asp:TextBox ID="tb_custEmail" CssClass="tb_custEmail" placeholder="Customer Email" runat="server"></asp:TextBox>
                    <asp:Button ID="btn_custEmail" CssClass="btn_custEmail" runat="server" Text="Search" AutoPostBack="true" OnClick="btn_custEmail_Click" />
                </div>
                <div class="contentContainer_right_row">
                    <asp:DataList ID="dl_appointments" runat="server" BorderStyle="None" BorderWidth="1px" CellPadding="0" RepeatDirection="Horizontal" RepeatColumns="2" Width="100%">
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
                                    <asp:Button ID="btn_status" CssClass='<%# Eval("status").ToString().Equals("Delivered") ? "btn_deliever" : "btn_cancel" %>' runat="server" Text='<%# Eval("status").ToString().Equals("Delivered") ? "Delivered" : "Cancelled" %>' Enabled="False" />
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
