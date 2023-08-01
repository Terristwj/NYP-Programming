<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="ProductDetails.aspx.cs" Inherits="BitzBytez.ProductDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        ul > li {
            margin-right: 25px;
            font-weight: lighter;
            cursor: pointer;
        }
        
        li.active {
            border-bottom: 3px solid silver;
        }

        .item-photo {
            display: flex;
            justify-content: center;
            align-items: center;
            border-right: 1px solid #f6f6f6;
        }

        .menu-items {
            list-style-type: none;
            font-size: 11px;
            display: inline-flex;
            margin-bottom: 0;
            margin-top: 20px;
        }

        .btn-success {
            width: 100%;
            
        }

        .section {
            width: 100%;
            margin-left: -15px;
            padding: 2px;
            padding-left: 15px;
            padding-right: 15px;
            background: #f8f9f9;
        }

        .title-price {
            margin-top: 30px;
            margin-bottom: 0;
            color: black;
        }

        .title-attr {
            margin-top: 0;
            margin-bottom: 0;
            color: black;
        }

        .btn-minus {
            cursor: pointer;
            font-size: 7px;
            display: flex;
            align-items: center;
            padding: 5px;
            padding-left: 10px;
            padding-right: 10px;
            border: 1px solid gray;
            border-radius: 2px;
            border-right: 0;
        }

        .btn-plus {
            cursor: pointer;
            font-size: 7px;
            display: flex;
            align-items: center;
            padding: 5px;
            padding-left: 10px;
            padding-right: 10px;
            border: 1px solid gray;
            border-radius: 2px;
            border-left: 0;
        }

        div.section > div {
            width: 100%;
            display: inline-flex;
        }

        div.section > div > input {
            margin: 0;
            padding-left: 5px;
            font-size: 10px;
            padding-right: 5px;
            max-width: 18%;
            text-align: center;
        }

        .attr, .attr2 {
            cursor: pointer;
            margin-right: 5px;
            height: 20px;
            font-size: 10px;
            padding: 2px;
            border: 1px solid gray;
            border-radius: 2px;
        }

        .highlightOption {
            background-color: black;
            color: white;
            box-shadow: 2px 2px 2px grey;
        }

        .unhighlightOption {
            background-color: white;
            color: black;
        }

        .highlightBorder {
            border: 1px solid orange;
            box-shadow: 2px 2px 5px grey;
        }

        .img_ {
            height: auto;
            width: auto;
            max-width: 500px;
            max-height: 500px;
        }
    </style>
        
    <script>

        window.onload = function () {

            document.getElementById("<%=btn_AddToCart.ClientID%>").disabled = false;

            collectInfo();

            document.getElementById("<%=btn_getPrice.ClientID%>").click();

        }

        function changeCSS(selectedOption, defaultClass, cssOption) {

            var var1 = document.getElementsByClassName(defaultClass);
            for (i = 0; i < var1.length; i++) {
                if (var1[i].classList.contains(cssOption)) {
                    var1[i].classList.remove(cssOption);
                }

                if (var1[i].classList.contains('selected')) {
                    var1[i].classList.remove('selected');
                }
            }

            document.getElementById(selectedOption).classList.add(cssOption);
            document.getElementById(selectedOption).classList.add('selected');

            collectInfo();
            document.getElementById("<%=btn_getPrice.ClientID%>").click();

        }

        function collectInfo() {
            var stringOfIDs = "";
            //array of active elements
            var list = document.getElementsByClassName("selected");
            var noOfAttributes = list.length;
            //array of categories
            var catList = document.getElementsByClassName("configCat");
            var noRequired = catList.length * 2;

            for (var i = 0; i < list.length; i++) {
                stringOfIDs += list[i].getAttribute('id') + ".";
            }
            document.getElementById("<%=id_AllConfigs.ClientID%>").value = stringOfIDs;

            if (stringOfIDs.length == noRequired) {
                document.getElementById("<%=btn_AddToCart.ClientID%>").disabled = false;
            }
        }

        function removeInvalidSign() {
            var times = 0;
            var text = document.getElementById("<%=tb_Qty.ClientID%>").value;
            for (var i = 0; i < text.length; i++) {
                if (text.charAt(i) == '-' || text.charAt(i) == 'e') {
                    times++;
                }
            }

            if (parseInt(text) < 0 || parseInt(text) > 10 || text == "") {
                times++;
            }

            if (times == 0) {
                document.getElementById("<%=tb_Qty.ClientID%>").value = parseInt(text);
                document.getElementById("<%=btn_AddToCart.ClientID%>").disabled = false;
            } else {
                document.getElementById("<%=tb_Qty.ClientID%>").value = "";
                document.getElementById("<%=btn_AddToCart.ClientID%>").disabled = true;
            }
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container" style="background-color:white;">
        	<div class="row" style="margin:auto; padding-top:30px;">
                <div class="col-md-6" style="margin:auto; max-height: 500px;">
                    <div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
                        <div class="carousel-inner" id="id_img_div" runat="server">
                            <div class="carousel-item active">
                                <img class="d-block img_" src="img/1.png" alt="First slide" />
                            </div>
                            <div class="carousel-item">
                                <img class="d-block img_" src="img/2.jpg" alt="Second slide" />
                            </div>
                            <div class="carousel-item">
                                <img class="d-block img_" src="img/3.png" alt="Third slide" />
                            </div>
                        </div>
                        <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
                            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                            <span class="sr-only">Previous</span>
                        </a>
                        <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
                            <span class="carousel-control-next-icon" aria-hidden="true"></span>
                            <span class="sr-only">Next</span>
                        </a>
                    </div>
                </div>
                <div class="col-md-5" style="margin:auto;">
                    <div>

                        <h3 id="id_productTitle" runat="server">Samsung Galaxy S4 I337 16GB 4G LTE Unlocked GSM Android Cell Phone</h3>
                        <h5 id="id_productRating" runat="server" style="color: #337ab7">4.6  <i class="fas fa-star" style="color: orange"></i><span id="id_ProductVotes" runat="server" style="font-size: 1.5vh;"> (5054 votes)</span></h5>

                        <h6 class="title-price"><small>Price</small></h6>

                        <asp:ScriptManager ID="ScriptManager1" runat="server">    
                        </asp:ScriptManager>
                        
                        <asp:UpdatePanel runat="server">
                            <ContentTemplate>
                                <h3 id="id_productPrice" runat="server" style="margin-top: 0px;">U$S 399</h3>
                                <div hidden="hidden"><asp:Button ID="btn_getPrice" runat="server" OnClick="btn_getPrice_Click"/></div>
                            </ContentTemplate>
                        </asp:UpdatePanel>

                        <div runat="server" style="margin: auto">
                            <div id="id_configurationSection" runat="server"></div>

                            <div class="section">
                                <h6 class="title-attr"><small>Quantity</small></h6>
                                <div>
                                    <asp:TextBox ID="tb_Qty" runat="server" onkeypress="removeInvalidSign()" onkeydown="removeInvalidSign()" onkeyup="removeInvalidSign()" type="number" value="1" min="1" max="10"></asp:TextBox>
                                </div>
                            </div>

                        </div>

                        <div hidden="hidden">
                            <asp:TextBox ID="id_AllConfigs" runat="server"></asp:TextBox>
                        </div>
                    </div>

                    <div class="section" style="padding-bottom: 20px; padding-top:20px;">
                        <button id="btn_AddToCart" runat="server" onserverclick="addToCart" class="btn" style="width: 100%; background-color: black; color: white;">Add to Cart <i class="fas fa-shopping-cart"></i></button>
                    </div>
                </div>                              
        
                <div class="col-md-12">
                    <ul class="menu-items">
                        <li class="active">Details</li>
                        <li>Reviews</li>
                    </ul>
                    <div style="width:100%;border-top:1px solid silver; padding:15px;" >

                        <small>
                            <ul id="id_productDesc_unorderedList" runat="server">
                                <li>Super AMOLED capacitive touchscreen display with 16M colors</li>
                                <li>Available on GSM, AT T, T-Mobile and other carriers</li>
                                <li>Compatible with GSM 850 / 900 / 1800; HSDPA 850 / 1900 / 2100 LTE; 700 MHz Class 17 / 1700 / 2100 networks</li>
                                <li>MicroUSB and USB connectivity</li>
                                <li>Interfaces with Wi-Fi 802.11 a/b/g/n/ac, dual band and Bluetooth</li>
                                <li>Wi-Fi hotspot to keep other devices online when a connection is not available</li>
                                <li>SMS, MMS, email, Push Mail, IM and RSS messaging</li>
                                <li>Front-facing camera features autofocus, an LED flash, dual video call capability and a sharp 4128 x 3096 pixel picture</li>
                                <li>Features 16 GB memory and 2 GB RAM</li>
                                <li>Upgradeable Jelly Bean v4.2.2 to Jelly Bean v4.3 Android OS</li>
                                <li>17 hours of talk time, 350 hours standby time on one charge</li>
                                <li>Available in white or black</li>
                                <li>Model I337</li>
                                <li>Package includes phone, charger, battery and user manual</li>
                                <li>Phone is 5.38 inches high x 2.75 inches wide x 0.13 inches deep and weighs a mere 4.59 oz </li>
                            </ul>  
                        </small>
                    </div>
                </div>		
            </div>
        </div>
</asp:Content>

