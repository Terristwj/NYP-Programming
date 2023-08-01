<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Staff_AddWarrantyInfo.aspx.cs" Inherits="BitzBytez.Staff_AddWarrantyInfo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .vertical-center {
            margin: auto 0;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container" style="background: white; min-height:798px;">

        <div style="margin: auto; text-align: center; padding: 50px; padding-bottom: 0px;">
            <h2><b>Warranty Information</b></h2>
            <p>Fill in the details for various products' warranty.</p>
        </div>

        <div style="padding: 50px;">
            <div class="row col-md-12" style="margin: 0px;">
                <div class="row col-md-12" style="margin: 0px; padding: 0px;">
                    <div class="vertical-center col-md-3" style="padding: 10px;">
                        <label style="margin: 0;">Manufacturer</label>
                    </div>
                    <div class="col-md-9 vertical-center" style="padding: 10px;">
                        <asp:DropDownList ID="ddl_manufacturer" runat="server" CssClass="form-control"></asp:DropDownList>
                    </div>
                </div>
            </div>

            <div class="row col-md-12" style="margin: 0px;">
                <div class="vertical-center col-md-3" style="padding: 10px;">
                    <label style="margin: 0;">Component Type</label>
                </div>
                <div class="col-md-9 vertical-center" style="padding: 10px;">
                    <asp:DropDownList ID="ddl_componentType" runat="server" CssClass="form-control"></asp:DropDownList>
                </div>
            </div>

            <div id="test_" runat="server"></div>

            <div class="row col-md-12" style="margin: 0px;">
                <div class="vertical-center col-md-3" style="padding: 10px;">
                    <label style="margin: 0;">Warranty Duration (Years)</label>
                </div>
                <div class="col-md-9" style="padding: 10px;">
                    <asp:TextBox ID="tb_warrantyPeriod" runat="server" class="form-control" Rows="10" TextMode="Number"></asp:TextBox>
                </div>
            </div>

            <div class="row col-md-12" style="margin: 0px;">
                <div class="vertical-center col-md-3" style="padding: 10px;">
                    <label style="margin: 0;">Registration Link</label>
                </div>
                <div class="col-md-9 vertical-center" style="padding: 10px;">
                    <asp:TextBox ID="tb_regLink" runat="server" class="form-control"></asp:TextBox>
                </div>
            </div>

            <div class="row col-md-12" style="margin: 0px;">
                <div class="vertical-center col-md-3" style="padding: 10px;">
                    <label style="margin: 0;">Contact Information</label>
                </div>
                <div class="col-md-9 vertical-center" style="padding: 10px;">
                    <asp:TextBox ID="tb_contactInfo" runat="server" class="form-control" TextMode="MultiLine"></asp:TextBox>
                </div>
            </div>

            <div class="row col-md-12" style="margin: 0px;">
                <div id="status" runat="server" class="col-md-6" style="padding: 10px; padding-top: 30px; font-size: 14px; margin: auto; text-align:center; color:darkgreen; letter-spacing:-1px;">
                </div>
            </div>

            <div style="padding: 10px; padding-top: 30px; text-align: center">
                <asp:Button ID="btn_Add" class="btn btn-primary" runat="server" Text="Add" OnClick="btn_Add_Click"/>
            </div>
        </div>
    </div>
</asp:Content>
