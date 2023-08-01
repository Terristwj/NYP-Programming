<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="BookingHistory.aspx.cs" Inherits="BitzBytez.BookingHistory" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            var url = window.location.toString();
            url = url.split("BookingHistory.aspx", 1);
            url += "CustomerProfile.aspx";

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
        
        
        .upperContainer{
            width:90%;
            margin:auto;
            justify-content:center;
            align-items:center;
        }
        .upperContainer2{
            width:95%;
            margin:auto;
            background:#fff;
            padding-top:20px;
            padding-bottom:30px;
        }
        .mainContent{
            width:100%;
            margin:auto;
            background:#fff;
            padding:25px 0 25px 25px;
        }


        .contentContainer{
            margin:auto;
            display:flex;
        }
        .contentContainer_left{
            flex:1;
        }
        .contentContainer_left_row{
            width:100%;
            padding:0px 15px 35px 0px;
            text-align:center;
            align-content:center;
        }
        .contentContainer_left_row input{
            width:180px; 
            min-height:54px; 
            white-space: normal;
            border:1px solid grey;
            padding: 30px 20px 30px 20px;
            border-radius:5px;
            border:1px solid transparent;
            box-shadow: -3px 5px 8px #888888;
            background:#444;
            letter-spacing:2px;
            color:#fff;
        }
        .btn_pageSelected{
            background:#000 !important;
            box-shadow: 0px 0px #888888 !important;
        }
        .contentContainer_left_row input:hover{
            background:#000;
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
        .btn_reset, .btn_date{
            padding:6px 21px 6px 21px;
            color:darkslategray;
            border:1px solid transparent;
            border-radius:5px;
            font-size:16px;
            letter-spacing:1px;
            background: #fff;
            box-shadow: 0px 0px 8px #888888;
        }
        .btn_reset{
            margin-right:26px;
        }
        .btn_reset:hover, .btn_date:hover{
            background: #ddd;
            box-shadow: 0px 0px #888888;
        }
        .tb_date{
            padding:7.5px 8px 7.5px 8px;
            color:black;
            border:1px solid grey;
            border-radius:5px;
            font-size:16px;
            width:180px;
            margin-right:20px;
        }
        .ddl_status{
            padding:8px 8px 8px 8px;
            color:darkslategray;
            border:1px solid transparent;
            border-radius:5px;
            font-size:16px;
            letter-spacing:1px;
            background: #fff;
            box-shadow: 0px 0px 8px #888888;
            margin-right:25px;
            width:180px;
        }
        .ddl_status:focus, .ddl_month:hover{
            background: #ddd;
            box-shadow: 0px 0px #888888;
        }
        .ddl_status option{
            background:white;
            color:black;
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
        .lb_timeStartTitle, .lb_durationTitlem, .lb_priceTitle{
            font-weight:bold;
        }
        .template_bookingTitle{
            color:black;
            font-weight:bold;
            margin-bottom:4px;
        }
        .template_booking{
            color:black;
            margin-bottom:20px;
        }
        .template_price{
            color:black;
            margin-bottom:20px;
        }
        .template_buttons{
            margin-bottom:20px;
        }
        .btn_deliever, .btn_cancel, .btn_revoke{
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
        .btn_revoke{
            background: #6c757d;
        }

        /* Toggle Button */
        .switch {
            position: absolute;
            display: inline-block;
            width: 98px;
            height: 41px;
            margin-left:-128px;
            border-radius:5px;
            box-shadow: 0px 2px 8px #888888;
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



       
        .displayNone{
            display:none;
        }
        
        /* Radio Button */
        .radioButton input, .radioButtonActive input{
            display:none;
        }
        .radioButton label, .radioButtonActive label{
            cursor:pointer;
        }
        .radioButton, .radioButtonActive{
            border:1px solid black;
            padding: 6px 15px;
            margin-right:10px;
            border:1px solid transparent;
            border-radius:5px;
            font-size:16px;
            letter-spacing:1px;
            cursor:pointer;
        }
        .radioButton{
            color:darkslategray;
            background: #fff;
            box-shadow: 0px 0px 8px #888888;
        }
        .radioButton:hover{
            background: #ddd;
            box-shadow: 0px 0px #888888;
        }
        .radioButtonActive{
            background: #000;
            color:white;
            box-shadow: 0px 0px #888888;
        }
        .gv_appointments_btn{
            background:#dc3545;
            box-shadow: 0px 0px 8px #888888;
        }
        .gv_appointments_btn a{
            color:white !important;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <div class="upperContainer">
        <div class="upperContainer2">
            <div class="mainContent">
                <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                    <div class="contentContainer">
                        <div class="contentContainer_left">
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
                                <label class="lb_pageTitle">Booking History</label>
                            </div>
                
                            <div class="contentContainer_right_settings">
                                <asp:Button ID="btn_reset" CssClass="btn_reset" runat="server" Text="Reset" AutoPostBack="true" OnClick="btn_reset_Click" />
                                <asp:DropDownList ID="ddl_status" CssClass="ddl_status" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddl_status_SelectedIndexChanged">
                                    <asp:ListItem>Status</asp:ListItem>
                                    <asp:ListItem>Delivered</asp:ListItem>
                                    <asp:ListItem>Cancelled</asp:ListItem>
                                    <asp:ListItem>Revoked</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                            <div class="contentContainer_right_settings2">
                    
                                <!-- Toggle Button -->
                                <label class="switch">
                                    <asp:CheckBox ID="togBtn" runat="server" AutoPostBack="true"/>
                                    <div class="slider round">
                                        <!--ADDED HTML -->
                                        <span class="on">AND</span>
                                        <span class="off">OR</span>
                                        <!--END-->
                                    </div>
                                </label>
                                
                                <asp:TextBox ID="tb_date" CssClass="tb_date" placeholder="Date" runat="server"></asp:TextBox>
                                <asp:Button ID="btn_date" CssClass="btn_date" runat="server" Text="Search" AutoPostBack="true" OnClick="btn_date_Click" />
                            </div>

                            <div class="contentContainer_right_settings">
                                <asp:RadioButton ID="rb_list" CssClass="radioButtonActive" Checked="true" runat="server" Text="List" GroupName="filter" AutoPostBack="True" OnCheckedChanged="rb_CheckedChanged"/>
                                <asp:RadioButton ID="rb_grid" CssClass="radioButton" runat="server" Text="Grid" GroupName="filter" AutoPostBack="True" OnCheckedChanged="rb_CheckedChanged"/>
                            </div>

                            <div class="contentContainer_right_row">
                                <asp:DataList ID="dl_appointments" runat="server" BorderStyle="None" BorderWidth="1px" CellPadding="0" RepeatDirection="Horizontal" RepeatColumns="2" Width="100%" >
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
                                            <div class="template_bookingTitle">
                                                <asp:Label ID="lb_bookingTitle" runat="server" Text="Booking:"></asp:Label>
                                            </div>
                                            <div class="template_booking">
                                                <asp:Label ID="lb_booking" runat="server" Text='<%# Eval("serviceName") %>'></asp:Label>
                                            </div>
                                            <div class="template_price">
                                                <asp:Label ID="lb_priceTitle" CssClass="lb_priceTitle" runat="server" Text="Price:"></asp:Label>
                                                <asp:Label ID="lb_price" runat="server" Text='<%# "$" + Eval("price") %>'></asp:Label>
                                            </div>
                                            <div class="template_buttons">
                                                <asp:Button ID="btn_status" CssClass='<%# Eval("status").ToString().Equals("Delivered") ? "btn_deliever" : Eval("status").ToString().Equals("Cancelled") ? "btn_cancel" : "btn_revoke"%>' runat="server" Text='<%# Eval("status") %>' Enabled="False" />
                                            </div>
                                        </div>
                                    </ItemTemplate>
                                </asp:DataList>

                                <asp:GridView ID="gv_appointments" Width="100%" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None">
                                    <Columns>

                                        <asp:BoundField DataField="date" HeaderText="Date" />
                                        <asp:BoundField DataField="start_time" HeaderText="Time" />
                                        <asp:BoundField DataField="duration" HeaderText="Duration" />
                                        <asp:BoundField DataField="serviceName" HeaderText="Service" />
                                        <asp:BoundField DataField="price" HeaderText="Price" />
                                        <asp:BoundField DataField="additionalInfo" HeaderText="Comment" />
                                        <asp:BoundField DataField="status" HeaderText="Status" />

                                    </Columns>
                                    <HeaderStyle BackColor="#000" Font-Bold="True" ForeColor="White" CssClass="gv_Header" />
                                    <RowStyle BackColor="#ffffff" />
                                    <AlternatingRowStyle BackColor="#ddddddd" />
                                </asp:GridView>
                            </div>
                        </div>
                    </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>
    </div>
</asp:Content>

