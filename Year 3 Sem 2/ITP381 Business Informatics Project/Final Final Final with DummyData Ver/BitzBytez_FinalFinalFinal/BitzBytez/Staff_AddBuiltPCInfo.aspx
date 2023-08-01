<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Staff_AddBuiltPCInfo.aspx.cs" Inherits="BitzBytez.Staff_AddBuiltPCWarrantyInfo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        function disableBtn() {
            var component = document.getElementById('<%= btn_Add.ClientID %>').disabled = true;
            var component = document.getElementById('<%= btn_Done.ClientID %>').disabled = true;
        }

        function enableBtn() {
            var component = document.getElementById('<%= btn_Add.ClientID %>').disabled = false;
            var component = document.getElementById('<%= btn_Done.ClientID %>').disabled = false;
        }

        function checkInput() {
            var dateBuilt = document.getElementById('<%= tb_dateBuilt.ClientID %>').value;
            var component = document.getElementById('<%= ddl_componentType.ClientID %>').value;
            var manufacturer = document.getElementById('<%= ddl_manufacturer.ClientID %>').value;
            var productName = document.getElementById('<%= ddl_productName.ClientID %>').value;
            var variation = document.getElementById('<%= ddl_variation.ClientID %>').value;
            var warrantyType = document.getElementById('<%= ddl_warrantyType.ClientID %>').value;
            var serialNo = document.getElementById('<%= tb_serialNo.ClientID %>').value;
            var regDate = document.getElementById('<%= dp_regDate.ClientID %>').value;

            console.log("triggered");

            if (dateBuilt.length > 0 &&
                component.length > 0 &&
                manufacturer.length > 0 &&
                productName.length > 0 &&
                variation.length > 0 &&
                warrantyType.length > 0 &&
                serialNo.length > 0 &&
                regDate.length > 0)
            {
                console.log("Input check: " + component.length + " " + manufacturer.length + " " + productName.length + " " + variation.length + " " + warrantyType.length + " " + serialNo.length + " " + regDate.length)
                enableBtn();
            } else {
                console.log("invalid input");
            }
        }
        
        function GetScrollPosition() {
            document.getElementById('<%= hfScrollvalue.ClientID %>').value = document.documentElement.scrollTop;
            sessionStorage.setItem("ABPIScrollPos", document.documentElement.scrollTop);
        }

        function SetScrollPosition() {
            document.documentElement.scrollTop = document.getElementById('<%= hfScrollvalue.ClientID %>').value;
        }

        function EndRequest(sender, args) {
            setTimeout('SetScrollPosition()', 60);
        }

        function pageLoad(sender, args) { 
            
            sessionStorage.getItem("ABPIScrollPos");
            setInterval('GetScrollPosition()', 300);
            
            var i = '<%= Session["ComponentWarrantyDetails"] %>';

            if (i != null) {
                enableBtn();
            } else {
                disableBtn();
            }

            console.log("called");
        };

    </script>
    <style>
        .vertical-center {
            margin: auto 0;
        }

        .componentHeader {
            padding: 10px;
        }

        .rwd-table {
            font-size: 14px;
            margin: auto;
            min-width: 300px;
            max-width: 600px;
            border-collapse: collapse;
        }

        .rwd-table tr:first-child {
            border-top: none;
            background: #428bca;
            color: #fff;
        }

        .rwd-table tr {
            border-top: 1px solid #ddd;
            border-bottom: 1px solid #ddd;
            background-color: #f5f9fc;
        }

        .rwd-table tr:nth-child(odd):not(:first-child) {
            background-color: #ebf3f9;
        }

        .rwd-table th {
            display: none;
        }

        .rwd-table td {
            display: block;
        }

        .rwd-table td:first-child {
            margin-top: .5em;
        }

        .rwd-table td:last-child {
            margin-bottom: .5em;
        }

        .rwd-table td:before {
            content: attr(data-th) ": ";
            font-weight: bold;
            width: 120px;
            display: inline-block;
            color: #000;
        }

        .rwd-table th,
        .rwd-table td {
            text-align: left;
        }

        .rwd-table {
            color: #333;
            border-radius: .4em;
            overflow: hidden;
        }

        .rwd-table tr {
            border-color: #bfbfbf;
        }

        .rwd-table th,
        .rwd-table td {
            padding: .5em 1em;
        }

        @media screen and (max-width: 601px) {
            .rwd-table tr:nth-child(2) {
                border-top: none;
            }
        }

        @media screen and (min-width: 600px) {
            .rwd-table tr:hover:not(:first-child) {
                background-color: #d8e7f3;
            }

            .rwd-table td:before {
                display: none;
            }

            .rwd-table th,
            .rwd-table td {
                display: table-cell;
                padding: .25em .5em;
            }

            .rwd-table th:first-child,
            .rwd-table td:first-child {
                padding-left: 0;
            }

            .rwd-table th:last-child,
            .rwd-table td:last-child {
                padding-right: 0;
            }

            .rwd-table th,
            .rwd-table td {
                padding: 1em !important;
            }
        }

        /*body {
            background: #4B79A1;
            background: -webkit-linear-gradient(to left, #4B79A1, #283E51);
            background: linear-gradient(to left, #4B79A1, #283E51);
        }*/

        h1 {
            text-align: center;
            font-size: 2.4em;
            color: #f2f2f2;
        }

        .container {
            display: block;
            text-align: center;
        }

        h3 {
            display: inline-block;
            position: relative;
            text-align: center;
            font-size: 1.5em;
            color: #cecece;
        }

        h3:before {
            content: "\25C0";
            position: absolute;
            left: -50px;
            -webkit-animation: leftRight 2s linear infinite;
            animation: leftRight 2s linear infinite;
        }

        h3:after {
            content: "\25b6";
            position: absolute;
            right: -50px;
            -webkit-animation: leftRight 2s linear infinite reverse;
            animation: leftRight 2s linear infinite reverse;
        }

        @-webkit-keyframes leftRight {
            0% {
                -webkit-transform: translateX(0);
            }

            25% {
                -webkit-transform: translateX(-10px);
            }

            75% {
                -webkit-transform: translateX(10px);
            }

            100% {
                -webkit-transform: translateX(0);
            }
        }

        @keyframes leftRight {
            0% {
                transform: translateX(0);
            }

            25% {
                transform: translateX(-10px);
            }

            75% {
                transform: translateX(10px);
            }

            100% {
                transform: translateX(0);
            }
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="hfScrollvalue" hidden="hidden" runat="server"></div>
    <div class="container" style="background: white;">

        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

        <asp:UpdatePanel ID="updatePanel" runat="server" EnableViewState="true" UpdateMode="Conditional">
            <ContentTemplate>
                
                <div style="margin: auto; text-align: center; padding: 50px; padding-bottom: 0px;">
                    <h2 style="letter-spacing: -1px; font-weight: bold;"><b>Built-To-Order PC Details</b></h2>
                    <p>Fill in the warranty details for Built-To-Order PC.</p>
                </div>

                <div class="col-md-12" style="padding: 50px;">

                    <div class="row">

                        <div class="col-md-12" style="margin: 0px;">
                            <div style="margin: auto; text-align: center; padding: 0px;">
                                <h5><b>Customer</b></h5>
                                <p>Search and select a customer below.</p>
                            </div>


                            <div class="row col-md-12" style="margin: 0px;">
                                <div class="row col-md-12 d-flex justify-content-center" style="margin: 0px; padding: 0px;">
                                    <div class="col-md-6 vertical-center" style="padding: 10px;">
                                        <asp:TextBox ID="tb_CustomerSearch" runat="server" class="form-control"></asp:TextBox>
                                    </div>
                                    <div class="vertical-center" style="padding: 0px;">
                                        <asp:Button ID="btn_Search" runat="server" Text="Search" class="btn btn-info" OnClick="btn_Search_Click" />
                                    </div>
                                </div>
                            </div>

                            <div id="div_gv" runat="server" class="col-md-12 d-flex justify-content-center" style="margin: 0px; padding: 10px; padding-bottom: 15px;">
                                <asp:GridView ID="gv_Customers" runat="server" AutoGenerateColumns="False" DataKeyNames="id" OnSelectedIndexChanged="gv_Customers_SelectedIndexChanged" CssClass="rwd-table col-md-4">
                                    <Columns>
                                        <asp:BoundField DataField="email" HeaderText="Customer Email" />
                                        <asp:BoundField DataField="username" HeaderText="Customer Username" />
                                        <asp:CommandField ShowSelectButton="True" />
                                    </Columns>
                                </asp:GridView>
                            </div>

                            <div id="selectedCustomer" runat="server" class="col-md-12 d-flex justify-content-center" style="text-align: center; margin: 0px; padding: 10px; padding-bottom: 20px;">

                            </div>

                            <div style="margin: auto; text-align: center; padding-bottom: 0px;">
                                <h5><b>B.T.O Receipt</b></h5>
                                <p>Enter the receipt details.</p>
                            </div>

                            <div class="row col-md-12" style="margin: 0px;">
                                <div class="row col-md-12 d-flex justify-content-center" style="margin: 0px; padding: 0px;">
                                    <div class="vertical-center col-md-2 componentHeader">
                                        Date built
                                    </div>
                                    <div class="col-md-6 vertical-center" style="padding: 10px;">
                                        <asp:TextBox ID="tb_dateBuilt" runat="server" class="form-control" TextMode="Date" onChange="checkInput()"></asp:TextBox>
                                    </div>
                                </div>
                            </div>

                            <div style="margin: auto; text-align: center; padding: 30px; padding-bottom: 0px;">
                                <h5><b>PC Components</b></h5>
                                <p>Enter the product details as well as the warranty information for each component.</p>
                            </div>

                            <div class="row col-md-12" style="margin: 0px;">

                                <div class="row col-md-12 d-flex justify-content-center" style="margin: 0px; padding: 0px;">
                                    <div class="vertical-center col-md-2 componentHeader">
                                        Component
                                    </div>
                                    <div class="col-md-6 vertical-center" style="padding: 10px;">
                                        <asp:DropDownList ID="ddl_componentType" runat="server" CssClass="form-control" AutoPostBack="True" OnSelectedIndexChanged="ddl_componentType_SelectedIndexChanged" onClick="checkInput()" onKeyUp="checkInput()" onKeyDown="checkInput()"></asp:DropDownList>
                                    </div>
                                </div>

                                <div class="row col-md-12 d-flex justify-content-center" style="margin: 0px; padding: 0px;">
                                    <div class="vertical-center col-md-2 componentHeader">
                                        Manufacturer
                                    </div>
                                    <div class="col-md-6 vertical-center" style="padding: 10px;">
                                        <asp:DropDownList ID="ddl_manufacturer" runat="server" CssClass="form-control" AutoPostBack="True" OnSelectedIndexChanged="ddl_manufacturer_SelectedIndexChanged" onClick="checkInput()" onKeyUp="checkInput()" onKeyDown="checkInput()"></asp:DropDownList>
                                    </div>
                                </div>

                                <div class="row col-md-12 d-flex justify-content-center" style="margin: 0px; padding: 0px;">
                                    <div class="vertical-center col-md-2 componentHeader">
                                        Product
                                    </div>
                                    <div class="col-md-6 vertical-center" style="padding: 10px;">
                                        <asp:DropDownList ID="ddl_productName" runat="server" CssClass="form-control" AutoPostBack="True" OnSelectedIndexChanged="ddl_productName_SelectedIndexChanged" onClick="checkInput()" onKeyUp="checkInput()" onKeyDown="checkInput()"></asp:DropDownList>
                                    </div>
                                </div>

                                <div class="row col-md-12 d-flex justify-content-center" style="margin: 0px; padding: 0px;">
                                    <div class="vertical-center col-md-2 componentHeader">
                                        Variation
                                    </div>
                                    <div class="col-md-6 vertical-center" style="padding: 10px;">
                                        <asp:DropDownList ID="ddl_variation" runat="server" CssClass="form-control" AutoPostBack="True" onClick="checkInput()" onKeyUp="checkInput()" onKeyDown="checkInput()"></asp:DropDownList>
                                    </div>
                                </div>

                                <div class="row col-md-12 d-flex justify-content-center" style="margin: 0px; padding: 0px;">
                                    <div class="vertical-center col-md-2 componentHeader">
                                        Warranty Type
                                    </div>
                                    <div class="col-md-6 vertical-center" style="padding: 10px;">
                                        <asp:DropDownList ID="ddl_warrantyType" runat="server" CssClass="form-control" onClick="checkInput()" onKeyUp="checkInput()" onKeyDown="checkInput()"></asp:DropDownList>
                                    </div>
                                </div>

                                <div class="row col-md-12 d-flex justify-content-center" style="margin: 0px; padding: 0px;">
                                    <div class="vertical-center col-md-2 componentHeader">
                                        Serial Number
                                    </div>
                                    <div class="col-md-6 vertical-center" style="padding: 10px;">
                                        <asp:TextBox ID="tb_serialNo" runat="server" class="form-control" onClick="checkInput()" onKeyUp="checkInput()" onKeyDown="checkInput()"></asp:TextBox>
                                    </div>
                                    <%--<div class="col-md-1 vertical-center">
                                        <button id="btn_generateSerialNumber" class="btn btn-info" onserverclick="btn_generateSerialNumber_Click" runat="server"><i class="fas fa-key"></i></button>
                                        <asp:Button ID="btn_generateSerialNumber" CssClass="btn btn-info" runat="server" Text="Generate" OnClick="btn_generateSerialNumber_Click" />
                                    </div>--%>
                                </div>

                                <div class="row col-md-12 d-flex justify-content-center" style="margin: 0px; padding: 0px;">
                                    <div class="vertical-center col-md-2 componentHeader">
                                        Reg. Date
                                    </div>
                                    <div class="col-md-6 vertical-center" style="padding: 10px;">
                                        <asp:TextBox ID="dp_regDate" runat="server" class="form-control" TextMode="Date" onChange="checkInput()" onKeyUp="checkInput()" onKeyDown="checkInput()"></asp:TextBox>
                                    </div>
                                </div>
                            </div>

                            <div id="gv_Added" runat="server" class="col-md-12 d-flex justify-content-center" style="margin: 0px; padding: 10px;">
                                <asp:GridView ID="gv_addedWarrantyDetails" runat="server" AutoGenerateColumns="False" CssClass="rwd-table" OnRowDeleting="gv_addedWarrantyDetails_RowDeleting" OnSelectedIndexChanged="gv_addedWarrantyDetails_SelectedIndexChanged">
                                    <Columns>
                                        <asp:BoundField DataField="Component" HeaderText="Component" />
                                        <asp:BoundField DataField="Datebuilt" HeaderText="Date Built" />
                                        <asp:BoundField DataField="Manufacturer" HeaderText="Manufacturer" />
                                        <asp:BoundField DataField="Product" HeaderText="Product" />
                                        <asp:BoundField DataField="Variation" HeaderText="Variation" />
                                        <asp:BoundField DataField="WarrantyType" HeaderText="Warranty Type" />
                                        <asp:BoundField DataField="SerialNumber" HeaderText="Serial No." />
                                        <asp:BoundField DataField="RegisterDate" HeaderText="Reg. Date" />
                                        <asp:CommandField ShowSelectButton="True" />
                                        <asp:CommandField ShowDeleteButton="True" />
                                    </Columns>
                                </asp:GridView>
                            </div>

                            <div id="result" runat="server" class="col-md-12 d-flex justify-content-center" style="text-align: center; margin: 0px; padding: 10px; padding-bottom: 40px;"></div>
                        </div>
                    </div>

                    <div class="row d-flex justify-content-center" style="margin: 0px;">
                        <div style="padding: 10px; padding-top: 30px; text-align: center">
                            <asp:Button ID="btn_Add" class="btn btn-primary" runat="server" Text="Add Info" OnClick="btn_Add_Click" CausesValidation="False" />
                        </div>
                        <div style="padding: 10px; padding-left: 5px; padding-top: 30px; text-align: center">
                            <asp:Button ID="btn_Done" class="btn btn-primary" runat="server" Text="Done" OnClick="btn_Done_Click" />
                        </div>
                        <div style="padding: 10px; padding-left: 5px; padding-top: 30px; text-align: center">
                            <button id="btn_generateSerialNumber" class="btn btn-info" onserverclick="btn_generateSerialNumber_Click" runat="server"><i class="fas fa-key"></i></button>
                        </div>

                    </div>
                </div>

            </ContentTemplate>
        </asp:UpdatePanel>
        </div>
</asp:Content>
