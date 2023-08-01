<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Staff_AddProduct.aspx.cs" Inherits="BitzBytez.Manager_AddProduct" validateRequest="false" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
    <title>Add a new product</title>

    <style>
        .vertical-center {
            margin: auto 0;
        }
    </style>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container" style="background: white;">

        <div style="margin:auto; text-align:center; padding:50px; padding-bottom:0px;">
            <h2><strong><span style="letter-spacing:-1px;">New Product</span></strong></h2>
            <p>Fill in the details for the new product.</p>
        </div>


        <div style="padding:50px;">
            <div class="row col-md-12" style="margin:0px;">
                <div class="row col-md-12" style="margin:0px; padding:0px;">
                    <div class="vertical-center col-md-3" style="padding: 10px;">
                        Name
                    </div>
                    <div class="col-md-9" style="padding: 10px;">
                        <asp:TextBox ID="tb_Name" runat="server" class="form-control"></asp:TextBox>
                    </div>
                </div>
            </div>

            <div id="test" runat="server"></div>

            <div class="row col-md-12" style="margin: 0px;">
                <div class="vertical-center col-md-3" style="padding: 10px;">
                    Description
                </div>
                <div class="col-md-9" style="padding: 10px;">
                    <asp:TextBox ID="tb_Desc" runat="server" class="form-control" Rows="10" TextMode="MultiLine"></asp:TextBox>
                </div>
            </div>

            <div class="row col-md-12" style="margin: 0px;">
                <div class="vertical-center col-md-3" style="padding: 10px;">
                    Type
                </div>
                <div class="col-md-9 vertical-center" style="padding:10px;">
                    <asp:DropDownList ID="ddl_Type" runat="server" CssClass="form-control"></asp:DropDownList>
                </div>
            </div>

            <div class="row col-md-12" style="margin: 0px;">
                <div class="vertical-center col-md-3" style="padding: 10px;">
                    Product Image Upload
                </div>
                <div class="col-md-9 vertical-center" style="padding: 10px;">
                    <%--<button id="btn_uploadImg" onclick="click()" class="btn btn-lg btn-dark">Upload Images</button>--%>
                    <asp:FileUpload ID="UploadImages" runat="server" AllowMultiple="true"/>
                </div>
            </div>

            <div class="col-md-12" style="margin: 0px;">
                <asp:Label ID="listofuploadedfiles" runat="server"/>  
            </div>

            <div style="margin: auto; text-align: center; padding: 60px; padding-bottom: 20px;">
                <h2><strong><span style="letter-spacing:-1px;">Configuration Categories</span></strong></h2>
                <p>Each product can have different configuration categories like Memory Capacity, Color and etc. 
                    Please fill in the configuration details below so that they can be displayed on the product details page. 
                    The configuration details are displayed in the form of text or color.
                </p>
            </div>

            <%--1st--%>

            <div style="margin: auto; text-align: center; padding: 30px; padding-bottom: 0px;">
                <h5><b>1st Category</b></h5>
                <p>Enter the category and select its display type.</p>
            </div>

            <div class="row col-md-12 d-flex justify-content-center" style="margin: 0px;">
<%--                <div class="vertical-center col-md-2" style="padding: 10px; font-size: 20px;">
                    <label style="margin: 0;">Category</label>
                </div>--%>
                <div class="col-md-5" style="padding: 10px;">
                    <asp:TextBox ID="tb_ConfigCat1" runat="server" class="form-control" placeholder="Category">
                    </asp:TextBox>
                </div>
            </div>

            <div class="row col-md-12 d-flex justify-content-center" style="margin: 0px;">
<%--                <div class="vertical-center col-md-2" style="padding: 10px; font-size: 20px;">
                    <label style="margin: 0;">Display Type</label>
                </div>--%>
                <div class="col-md-5 vertical-center" style="padding: 10px;">
                    <asp:DropDownList ID="ddl_DisplayType1" runat="server" CssClass="form-control" placeholder="Display Type"></asp:DropDownList>
                </div>
            </div>

            <%--2nd--%>
            
            <div style="margin: auto; text-align: center; padding: 30px; padding-bottom: 0px;">
                <h5><b>2nd Category</b></h5>
                <p>Enter the category and select its display type.</p>
            </div>

            <div class="row col-md-12 d-flex justify-content-center" style="margin: 0px;">
<%--                <div class="vertical-center col-md-2" style="padding: 10px; font-size: 20px;">
                    <label style="margin: 0;">Category</label>
                </div>--%>
                <div class="col-md-5" style="padding: 10px;">
                    <asp:TextBox ID="tb_ConfigCat2" runat="server" class="form-control" placeholder="Category">
                    </asp:TextBox>
                </div>
            </div>

            <div class="row col-md-12 d-flex justify-content-center" style="margin: 0px;">
<%--                <div class="vertical-center col-md-2" style="padding: 10px; font-size: 20px;">
                    <label style="margin: 0;">Display Type</label>
                </div>--%>
                <div class="col-md-5 vertical-center" style="padding: 10px;">
                    <asp:DropDownList ID="ddl_DisplayType2" runat="server" CssClass="form-control"></asp:DropDownList>
                </div>
            </div>

            <%--3rd--%>
            
            <div style="margin: auto; text-align: center; padding: 30px; padding-bottom: 0px;">
                <h5><b>3rd Category</b></h5>
                <p>Enter the category and select its display type.</p>
            </div>

            <div class="row col-md-12 d-flex justify-content-center" style="margin: 0px;">
<%--                <div class="vertical-center col-md-2" style="padding: 10px; font-size: 20px;">
                    <label style="margin: 0;">Category</label>
                </div>--%>
                <div class="col-md-5" style="padding: 10px;">
                    <asp:TextBox ID="tb_ConfigCat3" runat="server" class="form-control" placeholder="Category">
                    </asp:TextBox>
                </div>
            </div>

            <div class="row col-md-12 d-flex justify-content-center" style="margin: 0px;">
<%--                <div class="vertical-center col-md-2" style="padding: 10px; font-size: 20px;">
                    <label style="margin: 0;">Display</label>
                </div>--%>
                <div class="col-md-5 vertical-center" style="padding: 10px;">
                    <asp:DropDownList ID="ddl_DisplayType3" runat="server" CssClass="form-control"></asp:DropDownList>
                </div>
            </div>

            <%--4th--%>

            <div style="margin: auto; text-align: center; padding: 30px; padding-bottom: 0px;">
                <h5><b>4th Category</b></h5>
                <p>Enter the category and select its display type.</p>
            </div>

            <div class="row col-md-12 d-flex justify-content-center" style="margin: 0px;">
<%--                <div class="vertical-center col-md-2" style="padding: 10px; font-size: 20px;">
                    <label style="margin: 0;">Category</label>
                </div>--%>
                <div class="col-md-5" style="padding: 10px;">
                    <asp:TextBox ID="tb_ConfigCat4" runat="server" class="form-control" placeholder="Category">
                    </asp:TextBox>
                </div>
            </div>

            <div class="row col-md-12 d-flex justify-content-center" style="margin: 0px;">
<%--                <div class="vertical-center col-md-2" style="padding: 10px; font-size: 20px;">
                    <label style="margin: 0;">Display</label>
                </div>--%>
                <div class="col-md-5 vertical-center" style="padding: 10px;">
                    <asp:DropDownList ID="ddl_DisplayType4" runat="server" CssClass="form-control"></asp:DropDownList>
                </div>
            </div>

            <div style="padding: 10px; padding-top: 30px; text-align: center">
                <asp:Button ID="btn_Next" class="btn btn-primary" runat="server" Text="Next" OnClick="btn_Next_Click" />
            </div>

            <div class="row col-md-12 d-flex justify-content-center" style="font-weight:bold; letter-spacing:-1px; padding:20px; margin:0px; font-size:18px;">For Presentation Purposes:</div>

            <div class="row col-md-12 d-flex justify-content-center" style="margin: 0px;">
                <div style="padding-right:10px;">
                    <asp:Button ID="btn_populate1" CssClass="btn btn-success" runat="server" Text="Product 1" OnClick="btn_populate1_Click"/>
                </div>
                <div style="padding-right:10px;">
                    <asp:Button ID="btn_clear" CssClass="btn btn-warning" runat="server" Text="Clear" OnClick="btn_clear_Click"/>
                </div>
                <div>
                    <asp:Button ID="btn_delete" CssClass="btn btn-danger" runat="server" Text="Delete Product 1" OnClick="btn_delete_Click"/>
                </div>
            </div>
            
        </div>
    </div>

    <script>
<%--        function click () {
            document.getElementById('<%= UploadImages.ClientID %>').click();
            document.getElementById('<%= UploadImages.ClientID %>').click();
            console.log("click")
        }--%>

<%--        document.getElementById('btn_uploadImg').addEventListener('click', openDialog);

        function openDialog() {
            document.getElementById('<%= UploadImages.ClientID %>').click();
        }--%>
    </script>

</asp:Content>
