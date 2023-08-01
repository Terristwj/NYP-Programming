<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Staff_ManageStaff_ViewUsers.aspx.cs" Inherits="BitzBytez.Staff_ManageStaff_ViewUsers" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            var url = window.location.toString();
            url = url.split("Staff_ManageStaff_ViewUsers.aspx", 1);
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
        }
        .mainHeader{
            width:95%;
            margin:auto;
            border-bottom:1px solid black;
        }
        .mainHeader_title{
            width:95%;
            padding:25px 0 15px 0;
            margin:auto;
            display:flex;
            
            font-weight:bold;
            font-size:32px;
        }
        .mainHeader_title h2{
            font-weight:bold;
            font-size:32px;
        }

        /* Content */
        .mainContent{
            width:95%;
            margin:auto;
            background:#fff;
            padding:25px 0 25px 10px;
        }

        /* Buttons */
        .contentContainer_settings{
            padding:15px 25px 10px 25px;
        }
        .btn_reset, .btn_nameEmail{
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
        .btn_reset:hover, .btn_nameEmail:hover{
            background: #ddd;
            box-shadow: 0px 0px #888888;
        }
        .tb_nameEmail{
            padding:7.5px 8px 7.5px 8px;
            color:black;
            border:1px solid grey;
            border-radius:5px;
            font-size:16px;
            width:180px;
            margin-right:20px;
        }
        
        /* User List */
        .contentContainer_row{
            padding:15px 0 25px 0;
        }
        .gv_userList{
            width:100%;
            border:1px solid grey;
        }
        th{
            padding:10px 15px;
        }
        td{
            padding:15px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="upperContainer">
        <div class="upperContainer2">
            <div class="mainHeader">
                <div class="mainHeader_title">
                    <h2>View Users</h2>
                </div>
            </div>
            <div class="mainContent">
                <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                    <div class="contentContainer">
                        <div class="contentContainer_settings">
                            <asp:Button ID="btn_reset" CssClass="btn_reset" runat="server" Text="Reset" AutoPostBack="true" OnClick="btn_reset_Click" />
                            <asp:TextBox ID="tb_nameEmail" CssClass="tb_nameEmail" placeholder="Name/Email" runat="server"></asp:TextBox>
                            <asp:Button ID="btn_nameEmail" CssClass="btn_nameEmail" runat="server" Text="Search" AutoPostBack="true" OnClick="btn_nameEmail_Click" />
                        </div>
                            
                        

                        <div class="contentContainer_row">
                            <asp:GridView ID="gv_userList" CssClass="gv_userList" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None">
                                <Columns>

                                    <asp:BoundField DataField="id" HeaderText="id" />
                                    <asp:BoundField DataField="email" HeaderText="Email" />
                                    <asp:BoundField DataField="username" HeaderText="Name" />

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

