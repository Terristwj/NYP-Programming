<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Staff_AddProductConfigCombo.aspx.cs" Inherits="BitzBytez.AddProductConfigCombo" %>
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

    <div style="margin: auto; text-align: center; padding: 50px; padding-bottom: 0px;">
        <h2><b>New Product Configuration Combination</b></h2>
        <p>Fill in the details for the new product configuration combination.</p>
    </div>

        <div id="test" runat="server"></div>

        <div style="padding:50px;">
            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <div class="row col-md-12" style="margin: 0px;">
                        <div class="vertical-center col-md-3" style="padding: 10px;">
                            <label style="margin: 0;">Configuration 1</label>
                        </div>
                        <div class="col-md-9 vertical-center" style="padding: 10px;">
                            <asp:DropDownList ID="ddl_config1" runat="server" CssClass="form-control"></asp:DropDownList>
                        </div>
                    </div>

                    <div class="row col-md-12" style="margin: 0px;">
                        <div class="vertical-center col-md-3" style="padding: 10px;">
                            <label style="margin: 0;">Configuration 2</label>
                        </div>
                        <div class="col-md-9 vertical-center" style="padding: 10px;">
                            <asp:DropDownList ID="ddl_config2" runat="server" CssClass="form-control"></asp:DropDownList>
                        </div>
                    </div>

                    <div class="row col-md-12" style="margin: 0px;">
                        <div class="vertical-center col-md-3" style="padding: 10px;">
                            <label style="margin: 0;">Configuration 3</label>
                        </div>
                        <div class="col-md-9 vertical-center" style="padding: 10px;">
                            <asp:DropDownList ID="ddl_config3" runat="server" CssClass="form-control"></asp:DropDownList>
                        </div>
                    </div>

                    <div class="row col-md-12" style="margin: 0px;">
                        <div class="vertical-center col-md-3" style="padding: 10px;">
                            <label style="margin: 0;">Configuration 4</label>
                        </div>
                        <div class="col-md-9 vertical-center" style="padding: 10px;">
                            <asp:DropDownList ID="ddl_config4" runat="server" CssClass="form-control"></asp:DropDownList>
                        </div>
                    </div>

                    <div class="row col-md-12" style="margin: 0px;">
                        <div class="vertical-center col-md-3" style="padding: 10px;">
                            <label style="margin: 0;">Price</label>
                        </div>
                        <div class="col-md-9" style="padding: 10px;">
                            <asp:TextBox ID="tb_price" runat="server" class="form-control"></asp:TextBox>
                        </div>
                    </div>

                    <div class="row col-md-12" style="margin: 0px;">
                        <div class="vertical-center col-md-3" style="padding: 10px;">
                            <label style="margin: 0;">Quantity</label>
                        </div>
                        <div class="col-md-9" style="padding: 10px;">
                            <asp:TextBox ID="tb_quantity" runat="server" class="form-control"></asp:TextBox>
                        </div>
                    </div>

                    <div class="row col-md-12" style="margin: 0px;">
                        <div id="status" runat="server" class="col-md-6" style="padding: 10px; padding-top: 30px; font-size: 14px; margin: auto; text-align: center; color: darkgreen; letter-spacing: -1px;">
                        </div>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>

            <div style="padding: 10px; padding-top: 30px; text-align: center">
                <asp:Button ID="btn_Add" class="btn btn-primary" runat="server" Text="Add" OnClick="btn_Add_Click"/>
            </div>

            <div style="padding: 10px; padding-top: 5px; text-align: center" id="div_Done" runat="server">
                <asp:Button ID="btn_Done" class="btn btn-primary" runat="server" Text="Done" OnClick="btn_Done_Click"/>
            </div>

            <div class="row col-md-12 d-flex justify-content-center" style="font-weight:bold; letter-spacing:-1px; padding:20px; margin:0px; font-size:18px;">For Presentation Purposes:</div>

            <div class="row col-md-12 d-flex justify-content-center" style="margin: 0px;">
                <div style="padding:10px; padding-left:0px;">
                    <asp:Button ID="btn_populateCombo1" CssClass="btn btn-success" runat="server" Text="Combo 1" OnClick="btn_populateCombo1_Click"/>
                </div>
                <div style="padding:10px; padding-left:0px;">
                    <asp:Button ID="btn_populateCombo2" CssClass="btn btn-success" runat="server" Text="Combo 2" OnClick="btn_populateCombo2_Click"/>
                </div>
                <div style="padding:10px; padding-left:0px;">
                    <asp:Button ID="btn_populateCombo3" CssClass="btn btn-success" runat="server" Text="Combo 3" OnClick="btn_populateCombo3_Click"/>
                </div>
                <div style="padding:10px; padding-left:0px;">
                    <asp:Button ID="btn_populateCombo4" CssClass="btn btn-success" runat="server" Text="Combo 4" OnClick="btn_populateCombo4_Click"/>
                </div>
                <div style="padding:10px; padding-left:0px;">
                    <asp:Button ID="btn_populateCombo5" CssClass="btn btn-success" runat="server" Text="Combo 5" OnClick="btn_populateCombo5_Click"/>
                </div>
                <div style="padding:10px; padding-left:0px;">
                    <asp:Button ID="btn_populateCombo6" CssClass="btn btn-success" runat="server" Text="Combo 6" OnClick="btn_populateCombo6_Click"/>
                </div>
                <div style="padding:10px; padding-left:0px;">
                    <asp:Button ID="btn_clear" CssClass="btn btn-warning" runat="server" Text="Clear" OnClick="btn_clear_Click"/>
                </div>
                <div style="padding:10px; padding-left:0px;">
                    <asp:Button ID="btn_delete" CssClass="btn btn-danger" runat="server" Text="Delete Product 1" OnClick="btn_delete_Click"/>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
