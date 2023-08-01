<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="ServicesRegister.aspx.cs" Inherits="BitzBytez.ServicesRegister" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            var url = window.location.toString();
            url = url.split("ServicesRegister.aspx", 1);
            url += "Services.aspx";

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
        }
        .div_title *{
            font-weight:bold;
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
        }
        .div_special #ContentPlaceHolder1_Calendar1{
            margin:auto;
        }
        .div_special #ContentPlaceHolder1_Calendar1{
            margin:auto;
        }
        .btn_Cancel, .btn_Submit{
            padding:6px 15px 6px 15px;
            color:darkslategray;
            border:1px solid transparent;
            border-radius:5px;
            font-size:16px;
            letter-spacing:1px;
            background: #fff;
            box-shadow: 0px 0px 8px #888888;
        }
        .btn_Cancel:hover, .btn_Submit:hover{
            background: #ddd;
            box-shadow: 0px 0px #888888;
        }

        @media (max-width: 1560px) {
        }
        @media (max-width: 1100px) {
        }
        @media (max-width: 991px) { 
        }
        @media (max-width: 950px) {
        }
        @media (max-width: 740px) {
        }
        @media (max-width: 640px) {
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

    <div class="upperContainer">
        <div class="formContent">
            <div class="formContent_row">
                <div class="div_title">
                    <h5>
                        Service Registration:
                    </h5>
                </div>
            </div>
            
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <div class="formContent_row formContent_row1">
                        <div class="div_label">
                            <label>
                                Date:
                            </label>
                        </div>
                        <div class="div_input">
                            <asp:TextBox ID="tb_date" runat="server" Width="250px" ReadOnly="True" CssClass="form-control"></asp:TextBox>
                        </div>
                    </div>
                    <div class="formContent_row formContent_row2" style="margin-top:20px;">
                        <div class="div_special">
                            <asp:Calendar ID="Calendar1" runat="server" AutoPostBack="True"
                                 ShowGridLines="True" OnDayRender="Calendar1_DayRender" OnSelectionChanged="Calendar1_SelectionChanged">  
                                <SelectedDayStyle Font-Bold="True" />  
                                <NextPrevStyle Font-Size="9pt"/>  
                                <DayHeaderStyle Font-Bold="True" />  
                            </asp:Calendar>  
                        </div>
                    </div>

                    <div style="height:20px;"></div>

                    <div class="formContent_row">
                        <div class="div_title">
                            <h5>
                                Service Information:
                            </h5>
                        </div>
                    </div>
                    <div class="formContent_row formContent_row3">
                        <div class="div_label">
                            <label>
                                Service:
                            </label>
                        </div>
                        <div class="div_input">
                            <asp:DropDownList ID="ddl_service" Height="30px" Width="250px" runat="server" OnSelectedIndexChanged="ddl_service_SelectedIndexChanged"  CssClass="form-control" AutoPostBack="True">
                                <asp:ListItem>PC Building Service</asp:ListItem>
                                <asp:ListItem>PC Repair Service</asp:ListItem>
                                <asp:ListItem>PC Building Lesson</asp:ListItem>
                                <asp:ListItem>Onsite Diagnosis</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="formContent_row formContent_row4">
                        <div class="div_label">
                            <label>
                                Price:
                            </label>
                        </div>
                        <div class="div_input">
                            <asp:TextBox ID="tb_price" runat="server" Width="250px" ReadOnly="True" CssClass="form-control"></asp:TextBox>
                        </div>
                    </div>
                    <div class="formContent_row formContent_row5">
                        <div class="div_label">
                            <label>
                                Time:
                            </label>
                        </div>
                        <div class="div_input">
                            <asp:DropDownList ID="ddl_time" Height="30px" Width="250px" runat="server" CssClass="form-control">
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="formContent_row formContent_row6">
                        <div class="div_label">
                            <label>
                                Duration:
                            </label>
                        </div>
                        <div class="div_input">
                            <asp:TextBox ID="tb_duration" runat="server" Width="250px" text="1 hour" ReadOnly="True" CssClass="form-control"></asp:TextBox>
                        </div>
                    </div>
                    <div class="formContent_row formContent_row7">
                        <div class="div_label">
                            <label>
                                Additional Information:
                            </label>
                        </div>
                        <div class="div_input">
                            <asp:TextBox ID="tb_additionalInfo" runat="server" Height="120px" Width="250px" TextMode="MultiLine" CssClass="form-control"></asp:TextBox>
                        </div>
                    </div>
                    <div style="height:5px;"></div>
                    <div class="formContent_row formContent_row8">
                        <div class="div_special">
                            <asp:Button ID="btn_Cancel" CssClass="btn_Cancel" runat="server" Text="Cancel" OnClick="btn_Cancel_Click" />
                            <div style="border:10px solid transparent;display:inline;"></div>
                            <asp:Button ID="btn_Submit" CssClass="btn_Submit" runat="server" Text="Submit" OnClick="btn_Submit_Click" />
                        </div>
                    </div>
                    <div class="formContent_row formContent_row8">
                        <div class="div_special">
                            <asp:Label ID="lb_error" runat="server" Text="" ForeColor="Red"></asp:Label>
                        </div>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>
</asp:Content>
