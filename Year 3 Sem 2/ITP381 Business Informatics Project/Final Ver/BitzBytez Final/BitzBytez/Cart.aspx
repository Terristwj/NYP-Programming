<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="BitzBytez.Cart" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        @import "compass/css3";
        /*@import url(https://fonts.googleapis.com/css?family=Droid+Serif:400,400italic|Montserrat:400,700);*/
        @import "compass/reset";

        * {
            box-sizing: border-box;
        }

        body {
            color: #333;
            -webkit-font-smoothing: antialiased;
            /*font-family: 'Droid Serif', serif;*/
        }

        img {
            max-width: 100%;
        }

        .cf:before, .cf:after {
            content: " ";
            display: table;
        }

        .cf:after {
            clear: both;
        }

        .cf {
            *zoom: 1;
        }

        .wrap {
            width: 85%;
            max-width: 960px;
            margin: 0 auto;
            padding: 5% 0;
            /*margin-bottom: 5em;*/
        }

        .projTitle {
            /*font-family: 'Montserrat', sans-serif;*/
            font-weight: bold;
            text-align: center;
            font-size: 2em;
            padding: 1em 0;
            border-bottom: 1px solid #dadada;
            letter-spacing: 3px;
            text-transform: uppercase;
        }

        .projTitle span {
            /*font-family: 'Droid Serif', serif;*/
            font-weight: normal;
            font-style: italic;
            text-transform: lowercase;
            color: #777;
        }

        .heading {
            padding: 1em 0;
            border-bottom: 1px solid #d0d0d0;
        }

        .heading h1 {
            /*font-family: 'Droid Serif', serif;*/
            font-size: 2em;
            float: left;
        }

        .heading a.continue:link, .heading a.continue:visited {
            text-decoration: none;
            /*font-family: 'Montserrat', sans-serif;*/
            /*letter-spacing: -0.015em;*/
            /*font-size: 0.75em;*/
            /*padding: 1em;*/
            padding:.375rem .75rem;
            color: #fff;
            background: #82ca9c;
            /*font-weight: bold;*/
            border-radius: 50px;
            float: right;
            text-align: right;
            -webkit-transition: all 0.25s linear;
            -moz-transition: all 0.25s linear;
            -ms-transition: all 0.25s linear;
            -o-transition: all 0.25s linear;
            transition: all 0.25s linear;
        }

        .heading a.continue:after {
            content: "\276f";
            padding: 0.5em;
            position: relative;
            right: 0;
            -webkit-transition: all 0.15s linear;
            -moz-transition: all 0.15s linear;
            -ms-transition: all 0.15s linear;
            -o-transition: all 0.15s linear;
            transition: all 0.15s linear;
        }

        .heading a.continue:hover, .heading a.continue:focus, .heading a.continue:active {
            background: #f69679;
        }

        .heading a.continue:hover:after, .heading a.continue:focus:after, .heading a.continue:active:after {
            right: -10px;
        }

        .tableHead {
            display: table;
            width: 100%;
            /*font-family: 'Montserrat', sans-serif;*/
            font-size: 0.75em;
        }

        .tableHead li {
            display: table-cell;
            padding: 1em 0;
            text-align: center;
        }

        .tableHead li.prodHeader {
            text-align: left;
        }

        .cart {
            padding: 1em 0;
        }

        .cart .items {
            display: block;
            width: 100%;
            vertical-align: middle;
            padding: 1.5em;
            border-bottom: 1px solid #fafafa;
        }

        .cart .items.even {
            background: #fafafa;
        }

        .cart .items .infoWrap {
            display: table;
            width: 100%;
        }

        .cart .items .cartSection {
            display: table-cell;
            vertical-align: middle;
        }

        .cart .items .cartSection .itemNumber {
            font-size: 0.75em;
            color: #777;
            margin-bottom: 0.5em;
        }

        .cart .items .cartSection h3 {
            font-size: 1em;
            font-family: 'Montserrat', sans-serif;
            font-weight: bold;
            text-transform: uppercase;
            letter-spacing: 0.025em;
        }

        .cart .items .cartSection p {
            display: inline-block;
            font-size: 0.85em;
            color: #777;
            font-family: 'Montserrat', sans-serif;
        }

        .cart .items .cartSection p .quantity {
            font-weight: bold;
            color: #333;
        }

        .cart .items .cartSection p.stockStatus {
            color: #82ca9c;
            font-weight: bold;
            padding: 0.5em 0 0 1em;
            text-transform: uppercase;
        }

        .cart .items .cartSection p.stockStatus.out {
            color: #f69679;
        }

        .cart .items .cartSection .itemImg {
            width: 4em;
            float: left;
        }

        .cart .items .cartSection.qtyWrap, .cart .items .cartSection.prodTotal {
            text-align: center;
        }

        .cart .items .cartSection.qtyWrap p, .cart .items .cartSection.prodTotal p {
            font-weight: bold;
            font-size: 1.25em;
        }

        .cart .items .cartSection input.qty {
            width: 2em;
            text-align: center;
            font-size: 1em;
            padding: 0.25em;
            margin: 1em 0.5em 0 0;
        }

        .cart .items .cartSection .itemImg {
            width: 8em;
            display: inline;
            padding-right: 1em;
        }

        .special {
            display: block;
            font-family: 'Montserrat', sans-serif;
        }

        .special .specialContent {
            padding: 1em 1em 0;
            display: block;
            margin-top: 0.5em;
            border-top: 1px solid #dadada;
        }

        .special .specialContent:before {
            content: "\21b3";
            font-size: 1.5em;
            margin-right: 1em;
            color: #6f6f6f;
            font-family: helvetica, arial, sans-serif;
        }

        a.remove {
            text-decoration: none;
            font-family: 'Montserrat', sans-serif;
            color: #fff;
            font-weight: bold;
            background: #e0e0e0;
            padding: 0.5em;
            font-size: 0.75em;
            display: inline-block;
            border-radius: 100%;
            line-height: 0.85;
            -webkit-transition: all 0.25s linear;
            -moz-transition: all 0.25s linear;
            -ms-transition: all 0.25s linear;
            -o-transition: all 0.25s linear;
            transition: all 0.25s linear;
        }

        a.remove:hover {
            background: #f30;
        }

        .promoCode {
            border: 2px solid #efefef;
            float: left;
            width: 35%;
            padding: 2%;
        }

        .promoCode label {
            display: block;
            width: 100%;
            font-style: italic;
            font-size: 1.15em;
            margin-bottom: 0.5em;
            letter-spacing: -0.025em;
        }

        .promoCode input {
            width: 85%;
            font-size: 1em;
            padding: 0.5em;
            float: left;
            border: 1px solid #dadada;
        }

        .promoCode input:active, .promoCode input:focus {
            outline: 0;
        }

        .promoCode a.btn {
            float: left;
            width: 15%;
            padding: 0.75em 0;
            border-radius: 0 1em 1em 0;
            text-align: center;
            border: 1px solid #82ca9c;
        }

        .promoCode a.btn:hover {
            border: 1px solid #f69679;
            background: #f69679;
        }

        .btn:link, .btn:visited {
            text-decoration: none;
            /*font-family: 'Montserrat', sans-serif;*/
            letter-spacing: -0.015em;
            font-size: 1em;
            padding: 1em 3em;
            color: #fff;
            background: #82ca9c;
            font-weight: bold;
            border-radius: 50px;
            float: right;
            text-align: right;
            -webkit-transition: all 0.25s linear;
            -moz-transition: all 0.25s linear;
            -ms-transition: all 0.25s linear;
            -o-transition: all 0.25s linear;
            transition: all 0.25s linear;
        }

        .btn:after {
            content: "\276f";
            padding: 0.5em;
            position: relative;
            right: 0;
            -webkit-transition: all 0.15s linear;
            -moz-transition: all 0.15s linear;
            -ms-transition: all 0.15s linear;
            -o-transition: all 0.15s linear;
            transition: all 0.15s linear;
        }

        .btn:hover, .btn:focus, .btn:active {
            /*background: #f69679;*/
        }

        .btn:hover:after, .btn:focus:after, .btn:active:after {
            right: -10px;
        }

        .promoCode .btn {
            font-size: 0.85em;
            padding: 0.5em 2em;
        }
        /* TOTAL AND CHECKOUT */
        .subtotal {
            float: right;
            width: 35%;
        }

        .subtotal .totalRow {
            padding: 0.5em;
            text-align: right;
        }

        .subtotal .totalRow.final {
            font-size: 1.25em;
            font-weight: bold;
        }

        .subtotal .totalRow span {
            display: inline-block;
            padding: 0 0 0 1em;
            text-align: right;
        }

        .subtotal .totalRow .label {
            /*font-family: 'Montserrat', sans-serif;*/
            font-size: 0.85em;
            text-transform: uppercase;
            color: #777;
        }

        .subtotal .totalRow .value {
            letter-spacing: -0.025em;
            width: 35%;
        }

        @media only screen and (max-width: 39.375em) {
            .wrap {
                width: 98%;
                padding: 2% 0;
            }

            .projTitle {
                font-size: 1.5em;
                padding: 10% 5%;
            }

            .heading {
                padding: 1em;
                font-size: 90%;
            }

            .cart .items .cartSection {
                width: 90%;
                display: block;
                float: left;
            }

            .cart .items .cartSection.qtyWrap {
                width: 10%;
                text-align: center;
                padding: 0.5em 0;
                float: right;
            }

            .cart .items .cartSection.qtyWrap:before {
                content: "QTY";
                display: block;
                /*font-family: 'Montserrat', sans-serif;*/
                padding: 0.25em;
                font-size: 0.75em;
            }

            .cart .items .cartSection.prodTotal, .cart .items .cartSection.removeWrap {
                display: none;
            }

            .cart .items .cartSection .itemImg {
                width: 25%;
            }

            .promoCode, .subtotal {
                width: 100%;
            }

            a.btn.continue {
                width: 100%;
                text-align: center;
            }
        }
 
 
    </style>

    <script type="text/javascript">
        // Remove Items From Cart
        $('a.remove').click(function () {
            event.preventDefault();
            $(this).parent().parent().parent().hide(400);

        })

        // Just for testing, show all items
        $('a.btn.continue').click(function () {
            $('li.items').show(400);
        })

        function removeInvalidInput(tb_Id, id) {
            var times = 1;
            var text = document.getElementById(tb_Id).value;
            //for (var i = 0; i < text.length; i++) {
            //    if (text.charAt(i) == '-' || text.charAt(i) == 'e') {
            //        times++;
            //    }
            //}

            if (10 >= parseInt(text) && parseInt(text) >= 0) {
                console.log("parseInt(text): " + parseInt(text));
                times = 0;
            } else if (text == "") {
                times++;
            } else {
                document.getElementById(tb_Id).value = 1;
                times++;
            }

            console.log("input: " + text);
            console.log("times: " + times);

            if (times == 0) {
                console.log(times == 0);
                document.getElementById("<%=id_affectedCartItemID_TB.ClientID%>").value = id + "." + text + ".";
                //document.getElementById('id_checkOutBtn').disabled = false;
                //document.getElementById('id_checkOutBtn').disabled = false;
                document.getElementById("<%=btn_update.ClientID%>").click();
                console.log("called");
            } else {
                document.getElementById('id_checkOutBtn').style.visibility = "visible";
            }
        }

        function removeItem(id) {
            document.getElementById("<%=id_affectedCartItemID_TB.ClientID%>").value = id + ".0.";
            document.getElementById("<%=btn_update.ClientID%>").click();
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container" style="background: white;">
        <div class="row">
            <%--<div class="" style="padding: 10px;">--%>
                <div class="wrap cf">
                    <%--<h1 class="projTitle">Responsive Table<span>-Less</span> Shopping Cart</h1>--%>
                    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                            <div class="heading cf">
                                <h1>My Cart</h1>
                                <div id="div_shipping" runat="server">
                                    <a href="#" class="continue" style="background-color: black; color: white; border-radius: 5px 5px;" data-toggle="modal" data-target="#exampleModal">Change Shipping 
                                    </a>
                                </div>
                            </div>


                            <div class="cart">
                                <div id="div_cartEmpty" runat="server" style="height: 500px;">
                                    <div style="position: relative; top: 50%; transform: perspective(1px) translateY(-50%); width: 50%; margin: 0 auto;">
                                        <img src="img/cart-empty.png" />
                                    </div>
                                </div>

                                <ul id="id_cartItemDiv" runat="server">
                                    <%--<li class="items odd">

                                        <div class="infoWrap">
                                            <div class="cartSection">
                                                <img src="http://lorempixel.com/output/technics-q-c-300-300-4.jpg" alt="" class="itemImg" />
                                                <p class="itemNumber">#QUE-007544-002</p>
                                                <h3>Item Name 1</h3>

                                                <p>
                                                    <input id="tb_Qty_id1" onkeypress="removeInvalidInput('tb_Qty_id1', 1)" onkeyup="removeInvalidInput('tb_Qty_id1', 1)" onkeydown="removeInvalidInput('tb_Qty_id1', 1)" type="text" class="qty" />
                                                    x $5.00
                                                </p>
                                                <p class="stockStatus">In Stock</p>
                                            </div>

                                            <div class="prodTotal cartSection">
                                                <p>$15.00</p>
                                            </div>
                                            <div class="cartSection removeWrap">
                                                <a href="#" class="remove">x</a>
                                            </div>
                                        </div>
                                    </li>--%>
                                </ul>
                            </div>

                            <%--                    <div class="promoCode">
                        <label for="promo">Have A Promo Code?</label><input type="text" name="promo" placholder="Enter Code" />
                        <a href="#" class="btn"></a>
                    </div>--%>
                            <div id="div_subtotalNcheckOut" runat="server">
                                <div class="subtotal cf">
                                    <ul style="list-style-type: none;">
                                        <li class="totalRow"><span class="label">Subtotal</span><span class="value" id="id_subtotal" runat="server">35.00</></span></li>

                                        <li class="totalRow"><span class="label">Shipping</span><span class="value" id="id_shippingCost" runat="server">$5.00</span></li>

                                        <li class="totalRow"><span class="label">GST (7%)</span><span class="value" id="id_GST" runat="server">$4.00</span></li>
                                        <li class="totalRow final"><span class="label">Total</span><span class="value" id="id_total" runat="server">$44.00</span></li>
                                        <li class="totalRow">
                                            <%--<a href="ProductCatalog.aspx" class="btn continue" id="id_checkOutBtn">Checkout</a></li>--%>
                                            <%--<button id="id_checkOutBtn" class="btn" style="background-color: black; color: white;">Checkout</button>--%>
                                            <asp:Button ID="id_checkOutBtn" runat="server" class="btn" style="background-color: black; color: white;" Text="Checkout" OnClick="id_checkOutBtn_Click" />
                                    </ul>
                                </div>
                                <div hidden="hidden">
                                    <asp:Button ID="btn_update" runat="server" Text="Update" OnClick="btn_update_Click" />
                                    <asp:TextBox ID="id_affectedCartItemID_TB" runat="server" />
                                </div>
                            </div>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>

        </div>
        <%--<div id="test" runat="server">

        </div>--%>


        <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                    <ContentTemplate>
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLabel" style="font-weight: bold; letter-spacing: -1px;">Change Shipping Address</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body" style="margin: 0 auto;">
                                <div class="col-md-12" style="margin: 0px;">
                                    <div class="vertical-center col-md-10" style="padding: 10px; margin: auto; text-align: center;">
                                        <label style="margin: 0;">Select your desired address from the drop down list below.</label>
                                    </div>
                                    <div class="col-md-9" style="padding: 10px; margin: auto; text-align: center;">
                                        <asp:DropDownList ID="ddl_shippingAddresses" runat="server" CssClass="form-control" OnSelectedIndexChanged="ddl_shippingAddresses_SelectedIndexChanged" AutoPostBack="True"></asp:DropDownList>
                                    </div>

                                    <div id="div_selectedAddress" runat="server" class="col-md-9" style="padding: 10px; margin: auto; text-align: center;">
                                    </div>


                                </div>
                            </div>
                            <div class="modal-footer">
                                <asp:Button ID="btn_Cancel" runat="server" CssClass="btn btn-dark" data-dismiss="modal" Text="Cancel"/>
                                <asp:Button ID="btn_Save" runat="server" CssClass="btn btn-primary" data-dismiss="modal" Text="Save" />
                            </div>
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>
            


    </div>
</asp:Content>
