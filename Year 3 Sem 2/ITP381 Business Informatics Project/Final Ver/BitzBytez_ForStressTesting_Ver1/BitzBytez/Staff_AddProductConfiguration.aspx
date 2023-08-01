<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Staff_AddProductConfiguration.aspx.cs" Inherits="BitzBytez.AddProductConfiguration" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
    <title>Add a new product</title>

    <style>
        .vertical-center {
            margin: auto 0;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container" style="background: white; height: 100vh">

        <div style="margin:auto; text-align:center; padding:50px; padding-bottom:0px;">
            <h2><b>New Product Configuration Combination</b></h2>
            <p>Fill in the details for the new product configuration combination.</p>
        </div>

        <div id="test" runat="server"></div>

        <div style="padding:50px;">

            <%--Display Type--%>

<%--            <div class="row col-md-12" style="margin: 0px;">
                <div class="vertical-center col-md-3" style="padding: 10px; font-size: 20px;">
                    <label style="margin: 0;">Display Type</label>
                </div>
                <div class="col-md-9 vertical-center" style="padding: 10px;">
                    <asp:DropDownList ID="ddl_DisplayType" runat="server" CssClass="form-control"></asp:DropDownList>
                </div>
            </div>--%>

            <%--Configuration Category--%>

            <div class="row col-md-12" style="margin: 0px;">
                <div class="vertical-center col-md-3" style="padding: 10px;">
                    <label style="margin: 0;">Configuration Category</label>
                </div>
                <div class="col-md-9 vertical-center" style="padding: 10px;">
                    <asp:DropDownList ID="ddl_ConfigCategory" runat="server" CssClass="form-control"></asp:DropDownList>
                </div>
            </div>

            <%--Configuration--%>

            <div class="row col-md-12" style="margin: 0px;">
                <div class="vertical-center col-md-3" style="padding: 10px;">
                    <label style="margin: 0;">Configuration</label>
                </div>
                <div class="col-md-9" style="padding: 10px;">
                    <asp:TextBox ID="tb_Config" runat="server" class="form-control"></asp:TextBox>
                </div>
            </div>

            <div class="row col-md-12" style="margin: 0px;">
                <div id="status" runat="server" class="col-md-6" style="padding: 10px; padding-top: 30px; font-size: 14px; margin: auto; text-align: center; color: darkgreen; letter-spacing: -1px;">
                </div>
            </div>

            <div style="padding: 10px; padding-top: 30px; text-align: center">
                <asp:Button ID="btn_Add" class="btn btn-primary" runat="server" Text="Add" OnClick="btn_Add_Click"/>
            </div>
            <div style="padding: 10px; padding-top: 5px; text-align: center">
                <asp:Button ID="btn_AddCombo" class="btn btn-primary" runat="server" Text="Add Combinations" OnClick="btn_AddCombo_Click"/>
            </div>
        </div>
    </div>

</asp:Content>
