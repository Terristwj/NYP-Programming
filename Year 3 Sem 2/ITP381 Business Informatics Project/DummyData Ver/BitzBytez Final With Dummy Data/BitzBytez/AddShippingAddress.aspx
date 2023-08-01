<%@ Page Title="" Language="C#" MasterPageFile="~/Customer_Profile.master" AutoEventWireup="true" CodeBehind="AddShippingAddress.aspx.cs" Inherits="BitzBytez.AddShippingAddress" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head2" runat="server">
    <style>
        .vertical-center {
            margin: auto 0;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">

    <div style="margin: 0 auto; width: 915px;">
        <div style="margin: auto; text-align: center; padding: 50px; padding-bottom: 0px;" class="col-md-10">
            <h2><b>Add a new Shipping Address</b></h2>
            <p>Enter the details for a new shipping address below.</p>
        </div>

        <div id="test" runat="server"></div>

        <div style="padding: 50px;">

            <div class="d-flex justify-content-center" style="margin: 0 auto;">
                <div class="vertical-center col-md-3" style="padding: 10px;">
                    <label style="margin: 0;">Full Name<span style="color:red">*</span></label>
                </div>
                <div class="vertical-center" style="padding: 10px;">
                    <asp:TextBox ID="tb_fullName" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
            </div>

            <div class="d-flex justify-content-center" style="margin: 0 auto;">
                <div class="vertical-center col-md-3" style="padding: 10px;">
                    <label style="margin: 0;">Address Line 1<span style="color:red">*</span></label>
                </div>
                <div class="vertical-center" style="padding: 10px;">
                    <asp:TextBox ID="tb_addressLine1" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
            </div>

            <div class="d-flex justify-content-center" style="margin: 0 auto;">
                <div class="vertical-center col-md-3" style="padding: 10px;">
                    <label style="margin: 0;">Address Line 2</label>
                </div>
                <div class="vertical-center" style="padding: 10px;">
                    <asp:TextBox ID="tb_addressLine2" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
            </div>

            <div class="d-flex justify-content-center" style="margin: 0 auto;">
                <div class="vertical-center col-md-3" style="padding: 10px;">
                    <label style="margin: 0;">City</label>
                </div>
                <div class="vertical-center" style="padding: 10px;">
                    <asp:TextBox ID="tb_city" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
            </div>

            <div class="row d-flex justify-content-center" style="margin: 0 auto;">
                <div class="vertical-center col-md-3" style="padding: 10px;">
                    <label style="margin: 0;">State/Province/Region</label>
                </div>
                <div class="vertical-center" style="padding: 10px;">
                    <asp:TextBox ID="tb_stateProvinceRegion" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
            </div>

            <div class="row d-flex justify-content-center" style="margin: 0 auto;">
                <div class="vertical-center col-md-3" style="padding: 10px;">
                    <label style="margin: 0;">Postal Code<span style="color:red">*</span></label>
                </div>
                <div class="vertical-center" style="padding: 10px;">
                    <asp:TextBox ID="tb_postalCode" runat="server" CssClass="form-control" TextMode="Number"></asp:TextBox>
                </div>
            </div>

            <div class="row d-flex justify-content-center" style="margin: 0 auto;">
                <div class="vertical-center col-md-3" style="padding: 10px;">
                    <label style="margin: 0;">Country<span style="color:red">*</span></label>
                </div>
                <div class="vertical-center" style="padding: 10px;">
                    <asp:DropDownList ID="ddl_country" runat="server" CssClass="form-control"></asp:DropDownList>
                </div>
            </div>

            <div style="padding: 10px; padding-top: 30px; text-align: center">
                <asp:Button ID="btn_Add" class="btn btn-primary" runat="server" Text="Add" OnClick="btn_Add_Click"/>
            </div>

        </div>
    </div>
    
</asp:Content>
