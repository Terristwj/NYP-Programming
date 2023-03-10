<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="CreateBooking.aspx.cs" Inherits="CreateBooking" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script>
        function getPageNum() {
            return 3;
        }
    </script>
    <style>
        #extraDiv{
            border:1px solid transparent;
        }

        .containerContent{
            border:1px solid black;
            width:500px;
            margin:auto;
            margin-top:30px;
        }

        .titleContainer{
            width:500px;
            text-align:center;
            text-decoration:underline;
            margin:auto;
        }

        .creationContainer{
            width:500px;
            margin:auto;
        }

        .validator{
            font-size:12px;
        }

        .dateContainer{
            font-family:Arial;
            font-size:20px;
            height:230px;
            width:350px;
            margin:auto;
        }

        .dateContainer2{
           padding-left:15px;
        }

        .tb_Date{
            height:20px;
            font-size:16px;
            padding-left:5px;
            margin-left:4.5px;
            text-align:center;
        }

        .calenderContainer{
            width:200px;
            margin:auto;
            margin-top:5px;
        }

        .timeContainer{
            font-family:Arial;
            font-size:20px;
            padding-top:7px;
            height:100px;
            width:350px;
            margin:auto;
        }

        .timeContainer2{
            float:left;
           padding-left:15px;
        }

        .ddl_Time {
            width: 180px;
            padding-left:5px;
            margin-left:10px;
            margin-top:3px;
            max-height: 600px;
            overflow-y: scroll;
            float:left;
        }

        .validator2{
            margin-left:5px;
            font-size:12px;
        }

        .passwordContainer{
            font-family:Arial;
            font-size:20px;
            padding-top:7px;
            padding-left:7px;
            height:50px;
            width:325px;
            margin:auto;
        }

        .tb_Password{
            height:20px;
            font-size:16px;
            padding-left:5px;
            margin-left:3px;
            width:91px;
        }

        .buttonContainer{
            width:500px;
            margin:auto;
            padding-top:20px;
            padding-bottom:20px;
        }

        .buttonContainer2{
            width:160px;
            height:35px;
            margin:auto;
        }

        .btn_Create{
            font-size:17px;
            border:1px solid black;
            background:white;
            padding-top:5px;
            padding-left:8px;
            padding-right:8px;
            padding-bottom:5px;
            cursor:pointer;
            float:left;
        }

        .btn_Cancel{
            font-size:17px;
            border:1px solid black;
            background:white;
            padding-top:5px;
            padding-left:8px;
            padding-right:8px;
            padding-bottom:5px;
            cursor:pointer;
            float:right;
        }

        .btn_Create:hover{
            background:rgb(255, 235, 238);
        }

        .btn_Cancel:hover{
            background:rgb(255, 235, 238);
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="extraDiv">
        <div class="containerContent">
            <div class="titleContainer">
                <h1>Create Booking</h1>
            </div>
            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <div class="creationContainer">
                        <div class="passwordContainer">
                            <label>Room Password: </label>
                            <asp:TextBox ID="tb_Password" CssClass="tb_Password" runat="server"></asp:TextBox>
                            <div>
                                <div style="border-left:160px transparent solid;height:1px;width:1px;float:left;"></div>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" Cssclass="validator" runat="server" ErrorMessage="Required" ForeColor="Red" ControlToValidate="tb_Password" Display="Dynamic" ValidationGroup="Create"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" Cssclass="validator" runat="server" ErrorMessage="7 Digit Code" ForeColor="Red" ControlToValidate="tb_Password" Display="Dynamic" ValidationGroup="Create" ValidationExpression="^(\d){7}$"></asp:RegularExpressionValidator >
                            </div>
                        </div>
                        <div class="dateContainer">
                            <div class="dateContainer2">
                                <label>Date: </label>
                                <asp:TextBox ID="tb_Date" CssClass="tb_Date" runat="server" ReadOnly="True"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" Cssclass="validator" runat="server" ErrorMessage="Required" ForeColor="Red" ControlToValidate="tb_Date" Display="Dynamic" ValidationGroup="Create"></asp:RequiredFieldValidator>
                            </div>
                            <div class="calenderContainer">
                                <asp:Calendar ID="Calendar1" runat="server" BackColor="White" BorderColor="#999999" CellPadding="4" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="Black" Height="180px" Width="200px" OnSelectionChanged="Calendar1_SelectionChanged">
                                    <DayHeaderStyle BackColor="#CCCCCC" Font-Bold="True" Font-Size="7pt" />
                                    <NextPrevStyle VerticalAlign="Bottom" />
                                    <OtherMonthDayStyle ForeColor="#808080" />
                                    <SelectedDayStyle BackColor="#666666" Font-Bold="True" ForeColor="White" />
                                    <SelectorStyle BackColor="#CCCCCC" />
                                    <TitleStyle BackColor="#999999" BorderColor="Black" Font-Bold="True" />
                                    <TodayDayStyle BackColor="#CCCCCC" ForeColor="Black" />
                                    <WeekendDayStyle BackColor="#FFFFCC" />
                                </asp:Calendar>
                            </div>
                        </div>
                        <div class="timeContainer">
                            <div class="timeContainer2">
                                <div style="float:left;">
                                    <label>Time: </label>
                                </div>
                                <asp:DropDownList ID="ddl_Time" runat="server" CssClass="ddl_Time" OnMouseDown="this.size=5;" OnFocusOut="this.size=1;" OnDblClick="this.size=1;">

                                    <asp:ListItem>~Select Time~</asp:ListItem>
                                    <asp:ListItem>07:00AM - 07:30AM</asp:ListItem>
                                    <asp:ListItem>07:30AM - 08:00AM</asp:ListItem>
                                    <asp:ListItem>08:00AM - 08:30AM</asp:ListItem>
                                    <asp:ListItem>08:30AM - 09:00AM</asp:ListItem>
                                    <asp:ListItem>09:00AM - 09:30AM</asp:ListItem>
                                    <asp:ListItem>09:30AM - 10:00AM</asp:ListItem>
                                    <asp:ListItem>10:00AM - 10:30AM</asp:ListItem>
                                    <asp:ListItem>10:30AM - 11:00AM</asp:ListItem>
                                    <asp:ListItem>11:00AM - 11:30AM</asp:ListItem>
                                    <asp:ListItem>11:30AM - 12:00PM</asp:ListItem>
                                    <asp:ListItem>12:00PM - 12:30PM</asp:ListItem>
                                    <asp:ListItem>12:30PM - 01:00PM</asp:ListItem>
                                    <asp:ListItem>01:00PM - 01:30PM</asp:ListItem>
                                    <asp:ListItem>01:30PM - 02:00PM</asp:ListItem>
                                    <asp:ListItem>02:00PM - 02:30PM</asp:ListItem>
                                    <asp:ListItem>02:30PM - 03:00PM</asp:ListItem>
                                    <asp:ListItem>03:00PM - 03:30PM</asp:ListItem>
                                    <asp:ListItem>03:30PM - 04:00PM</asp:ListItem>
                                    <asp:ListItem>04:00PM - 04:30PM</asp:ListItem>
                                    <asp:ListItem>04:30PM - 05:00PM</asp:ListItem>
                                    <asp:ListItem>05:00PM - 05:30PM</asp:ListItem>
                                    <asp:ListItem>05:30PM - 06:00PM</asp:ListItem>
                                    <asp:ListItem>06:00PM - 06:30PM</asp:ListItem>
                                    <asp:ListItem>06:30PM - 07:00PM</asp:ListItem>
                                    <asp:ListItem>07:00PM - 07:30PM</asp:ListItem>
                                    <asp:ListItem>07:30PM - 08:00PM</asp:ListItem>
                                    <asp:ListItem>08:00PM - 08:30PM</asp:ListItem>
                                    <asp:ListItem>08:30PM - 09:00PM</asp:ListItem>
                                    <asp:ListItem>09:00PM - 09:30PM</asp:ListItem>
                                    <asp:ListItem>09:30PM - 10:00PM</asp:ListItem>
                                    <asp:ListItem>10:00PM - 10:30PM</asp:ListItem>
                                    <asp:ListItem>10:30PM - 11:00PM</asp:ListItem>
                                    <asp:ListItem>11:00PM - 11:30PM</asp:ListItem>
                                    <asp:ListItem>11:30PM - 12:00AM</asp:ListItem>
                                    <asp:ListItem>12:00AM - 12:30AM</asp:ListItem>
                                    <asp:ListItem>12:30AM - 01:00AM</asp:ListItem>
                                    <asp:ListItem>01:00AM - 01:30AM</asp:ListItem>
                                    <asp:ListItem>01:30AM - 02:00AM</asp:ListItem>
                                    <asp:ListItem>02:00AM - 02:30AM</asp:ListItem>
                                    <asp:ListItem>02:30AM - 03:00PM</asp:ListItem>
                                    <asp:ListItem>03:00AM - 03:30AM</asp:ListItem>
                                    <asp:ListItem>03:30AM - 04:00AM</asp:ListItem>
                                    <asp:ListItem>04:00AM - 04:30AM</asp:ListItem>
                                    <asp:ListItem>04:30AM - 05:00AM</asp:ListItem>
                                    <asp:ListItem>05:00AM - 05:30AM</asp:ListItem>
                                    <asp:ListItem>05:30AM - 06:00AM</asp:ListItem>
                                    <asp:ListItem>06:00AM - 06:30AM</asp:ListItem>
                                    <asp:ListItem>06:30AM - 07:00AM</asp:ListItem>
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" Cssclass="validator2" runat="server" ErrorMessage="Required" ForeColor="Red" InitialValue="~Select Time~" ControlToValidate="ddl_Time" Display="Dynamic" ValidationGroup="Create"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
            <div class="buttonContainer">
                <div class="buttonContainer2">
                    <asp:Button ID="btn_Create" CssClass="btn_Create" runat="server" Text="Create" ValidationGroup="Create" OnClick="btn_Create_Click" />
                    <asp:Button ID="btn_Cancel" CssClass="btn_Cancel" runat="server" Text="Cancel" OnClick="btn_Cancel_Click" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>



