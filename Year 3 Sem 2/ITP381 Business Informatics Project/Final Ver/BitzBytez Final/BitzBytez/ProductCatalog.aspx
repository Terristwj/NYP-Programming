<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="ProductCatalog.aspx.cs" Inherits="BitzBytez.ProductCatalog" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .showList {
            display:block;
        }

        .hideList {
            display: none;
        }

        .smallFont {
            font-size: 13px;
        }

        a:link {
            color: black;
            text-decoration:none;
        }

        /* visited link */
        a:visited {
            color: black;
            text-decoration: none;
        }

        /* mouse over link */
        a:hover {
            color: black;
            text-decoration: none;
        }

        /* selected link */
        a:active {
            color: black;
            text-decoration: none;
        }

        .pill-color {
            background-color:grey;
            color:white;
        }

        .list-group-item {
            border: hidden;
            padding:3px;
        }
        .padding1 {
            padding-left:20px;
        }
        .bgHighlight {
            font-weight:normal;
        }
        .productListing:hover {
            cursor:pointer;
        }

        .minimalistTextbox {
            outline: 0px !important;
            -webkit-appearance: none;
            box-shadow: none !important;
        }

        @media (min-width: 968px) {
            .productTitle {
                font-size: 15px;
                font-weight: bold; 
            }

            .productRating {
                font-size: 10px;
            }

            .productReviews {
                font-size: 5px;
            }

            .productPrice {
                font-size:10px;
            }
        }

        @media (min-width: 1100px) {
            .productTitle {
                font-size: 22px;
                font-weight: bold; 
            }

            .productRating {
                font-size:15px;
            }

            .productReviews {
                font-size: 11px;
            }

            .productPrice {
                font-size:15px;
            }
        }

    </style>

    
    <script type="text/javascript">
        function expandComponent() {
            if (document.getElementById('id1-1').classList.contains('hideList')) {
                document.getElementById('id1-1').classList.remove('hideList');
                document.getElementById('id1').classList.add('bgHighlight');
            } else {
                document.getElementById('id1-1').classList.add('hideList');
                document.getElementById('id1').classList.remove('bgHighlight');
            }
        }

        function expandBTO() {
            if (document.getElementById('id2-1').classList.contains('hideList')) {
                document.getElementById('id2-1').classList.remove('hideList');
                document.getElementById('id2').classList.add('bgHighlight');
            } else {
                document.getElementById('id2-1').classList.add('hideList');
                document.getElementById('id2').classList.remove('bgHighlight');
            }
        }

        function removeInvalidSpace() {
            var text = document.getElementById("<%=tb_Search.ClientID%>").value;
            
            if (text.charAt(0) == " ") {
                document.getElementById("<%=tb_Search.ClientID%>").value = "";
            }
        }
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container" style="background: white; min-height: 100vh">
        <div class="row">
            <div class="col-md-3 smallFont" style="border-right: 0px solid grey; height: 100vh">
                <div id="test" runat="server" style="font-size:25px; padding:25px; padding-bottom:5px; font-weight:bold;">
                    Categories
                </div>
                <div style="padding: 20px; padding-top: 10px;">
                    <ul style="padding:5px;">
                        <li class="list-group-item"><a href="#" onclick="expandBTO()"><span id="id2" style="font-weight:bold">Build-To-Order PCs</span>
                            <%--<span class="badge badge-pill pill-color">42</span>--%>
                                                    </a>
                            <ul class="padding1" id="id2-1">
                                <li class="list-group-item">
                                    <a href="ProductCatalog.aspx?category=GE">Gaming/Entertainment</a>
                                </li>
                                <li class="list-group-item">
                                    <a href="ProductCatalog.aspx?category=Workstations">Workstations</a>
                                </li>
                                <li class="list-group-item">
                                    <a href="ProductCatalog.aspx?category=Business">Business</a>
                                </li>
                                <li class="list-group-item">
                                    <a href="ProductCatalog.aspx?category=Home">Home</a>
                                </li>
                                
                            </ul>
                        </li>

                        <li class="list-group-item"><a href="#" onclick="expandComponent()"><span id="id1" style="font-weight:bold">PC Components </span>
                            <%--<span class="badge badge-pill pill-color">42</span>--%>

                                                    </a>
                            <ul class="padding1" id="id1-1">

                                <li class="list-group-item"><a href="ProductCatalog.aspx?category=Processor">Processor</a></li>

                                <li class="list-group-item">
                                    <a href="ProductCatalog.aspx?category=GraphicsCard">Graphics Card
                                            <%--<span class="badge badge-pill pill-color">42</span>--%>
                                    </a>
                                </li>
                                <li class="list-group-item">
                                    <a href="ProductCatalog.aspx?category=RAM">RAM</a>
                                </li>
                                <li class="list-group-item">
                                    <a href="ProductCatalog.aspx?category=Storage">Storage</a>
                                </li>
                                <li class="list-group-item">
                                    <a href="ProductCatalog.aspx?category=Motherboard">Motherboard</a>
                                </li>
                                <li class="list-group-item">
                                    <a href="ProductCatalog.aspx?category=PowerSupply">Power Supply</a>
                                </li>
                                <li class="list-group-item">
                                    <a href="ProductCatalog.aspx?category=CPUCooler">CPU Cooler</a>
                                </li>
                                <li class="list-group-item">
                                    <a href="ProductCatalog.aspx?category=PCCase">PC Case</a>
                                </li>
                            </ul>
                        </li>

                    </ul>

                </div>

            </div>


            <div class="col-md-8">
                
                <asp:ScriptManager ID="scriptManager" runat="server"></asp:ScriptManager>
                <asp:UpdatePanel ID="updatePanel" runat="server">
                    <ContentTemplate>
                        <div style="padding: 10px; padding-top: 25px; margin-bottom: 10px;">
                            <%--<asp:TextBox ID="tb" runat="server" style="border-radius:50px; border: 2px solid grey; padding: 6px; padding-left: 14px; padding-right: 14px;"></asp:TextBox>--%>
                            <div class="col-md-5 input-group border rounded-pill" style="padding: .25rem; padding-top: 0; padding-bottom: 0">
                                <div class="input-group-prepend border-0">
                                    <button id="btn_search" runat="server" onserverclick="searchForProducts" type="button" class="btn"><i class="fa fa-search"></i></button>
                                </div>
                                <asp:TextBox ID="tb_Search" runat="server" type="search" placeholder="Search here" onkeypress="removeInvalidSpace()" onkeydown="removeInvalidSpace()" onkeyup="removeInvalidSpace()" aria-describedby="button-addon4" class="form-control bg-none border-0 minimalistTextbox" Style="font-size: 15px;"></asp:TextBox>
                            </div>
                        </div>
                        <div id="id_productDiv" runat="server">
                            <div style="padding: 10px; border-bottom: 1px black solid;">
                                <div class="row productListing" style="margin-left: 0px;" onclick="location.href='ProductDetails.aspx';">
                                    <div class="col-md-3" style="border: 0px black solid">
                                        <img src="img/sample.jpg" style="max-height: 100%; max-width: 100%" />
                                    </div>
                                    <div class="col-md-9" style="padding: 10px; padding-bottom: 0px; padding-top: 0px; border: 0px black solid; position: relative;">
                                        <div class="productTitle">
                                            ZOTAC GeForce GTX 1060 Mini
                                        </div>
                                        <div class="productRating">
                                            4.6 <i class="fas fa-star" style="color: orange"></i><a href="#"><span class="productReviews" style="font-size: 11px;">(5054 votes)</span></a>
                                        </div>
                                        <div style="position: absolute; bottom: 0px;" class="productPrice">
                                            $299.99
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
                
                
            </div>
        </div>
    </div>
</asp:Content>
