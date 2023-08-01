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

    <div class="container" style="background: white; min-height: 100vh">

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

            <div class="row col-md-12 d-flex justify-content-center" style="font-weight:bold; letter-spacing:-1px; padding:20px; margin:0px; font-size:18px;">For Presentation Purposes:</div>

            <div class="row col-md-12 d-flex justify-content-center" style="margin: 0px;">
                <div style="padding:10px; padding-left:0px;">
                    <asp:Button ID="btn_populateCat1" CssClass="btn btn-success" runat="server" Text="Category 1" OnClick="btn_populateCat1_Click"/>
                </div>
                <div style="padding:10px; padding-left:0px;">
                    <asp:Button ID="btn_populateCat2" CssClass="btn btn-success" runat="server" Text="Category 2" OnClick="btn_populateCat2_Click"/>
                </div>
                <div style="padding:10px; padding-left:0px;">
                    <asp:Button ID="btn_populateCat3" CssClass="btn btn-success" runat="server" Text="Category 3" OnClick="btn_populateCat3_Click"/>
                </div>
                <div style="padding:10px; padding-left:0px;">
                    <asp:Button ID="btn_populateCat4" CssClass="btn btn-success" runat="server" Text="Category 4" OnClick="btn_populateCat4_Click"/>
                </div>
                <div style="padding:10px; padding-left:0px;">
                    <asp:Button ID="btn_populateCat5" CssClass="btn btn-success" runat="server" Text="Category 5" OnClick="btn_populateCat5_Click"/>
                </div>
                <div style="padding:10px; padding-left:0px;">
                    <asp:Button ID="btn_populateCat6" CssClass="btn btn-success" runat="server" Text="Category 6" OnClick="btn_populateCat6_Click"/>
                </div>
                <div style="padding:10px; padding-left:0px;">
                    <asp:Button ID="btn_populateCat7" CssClass="btn btn-success" runat="server" Text="Category 7" OnClick="btn_populateCat7_Click"/>
                </div>
                <div style="padding:10px; padding-left:0px;">
                    <asp:Button ID="btn_clear" CssClass="btn btn-warning" style="padding-right:10px;" runat="server" Text="Clear" OnClick="btn_clear_Click"/>
                </div>
                <div style="padding:10px; padding-left:0px;">
                    <asp:Button ID="btn_delete" CssClass="btn btn-danger" runat="server" Text="Delete Product 1" OnClick="btn_delete_Click"/>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
