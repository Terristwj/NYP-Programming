<%@ Page Title="Donate" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Donate.aspx.cs" Inherits="Donate" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script>
        function getPageNum() {
            return 5;
        }
    </script>
    <style>
        #extraDiv{
            border:1px solid transparent;
        }

        .contentContainer{
            padding-top:30px;
            padding-bottom:30px;
        }

        .contentContainer_1{
            width:600px;
            margin:auto;
        }

        .title{
            font-family:Arial;
            font-size:24px;
            font-weight:bold;
            text-decoration:underline;
        }

        .donateStatement{
            font-family:Arial;
            font-size:21px;
            padding-top:7px;
        }

        .contentContainer2{
            width:600px;
            margin:auto;
            height:302px;
        }


        /** Spin Cube**/
        /*<!--Flipping Cube-->*/
        .wrapperDesert{
            float:left;
            border:1px solid grey;
            width:300px;
            padding-top:40px;
            padding-bottom:40px;
            perspective: 800px;
            perspective-origin: 50% 100px;
        }

        .cubeDesert{
            margin:auto;
            width: 200px;
            height:220px;
            transform-style: preserve-3d;
            transition: all 0.5s cubic-bezier(.57,-0.42,.46,1.4);
            cursor: pointer;
        }

        .cubeDesert div{
            width: 200px;
            height: 200px;
            position: absolute;
        }

        .frontDesert{
            background-color: #6cd4ff;
            transform: translateZ(100px);
        }

        .backDesert{
            background-color: #8b80f9;
            transform: rotateY(180deg) translateZ(100px);
        }
        .leftDesert{
            background-color: white;
            transform: rotateY(-90deg) translateX(-100px);
            transform-origin: left center;
        }

        .rightDesert{
            background-color: #bdc4a7;
            transform: rotateY(90deg) translateX(100px);
            transform-origin: right center;
        }

        .image{
            width:200px;
            height:200px;
        }

        .buttonContainer{
            border:1px solid grey;
            border-left:none;
            float:left;
            height:300px;
            width:296px;
        }

        .buttonContainer2{
            margin:auto;
            margin-top:35px;
            width:145px;
        }

        .btn_Donate{
            border:1px solid black;
            background:white;
            font-family:Arial;
            font-size:21px;
            padding-top:7px;
            padding-bottom:7px;
            padding-left:12px;
            padding-right:12px;
            cursor:pointer;
        }

        .btn_Donate:hover{
            background:rgb(255, 235, 238);
        }

        .noteContainer2{
            margin-top:25px;
            font-family:Arial;
            font-size:21px;
            text-align:center;
        }

        .noteContainer{
            margin-top:70px;
            padding-left:5px;
            padding-right:5px;
            font-family:Arial;
            font-style:italic;
            font-size:14px;
        }

        .lb_Donate{
            font-size:22px;
            line-break:normal;
        }

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="extraDiv">
        <div class="contentContainer">
            <div class="contentContainer_1">
                <div class="title">
                    <label>Donate To Help</label>
                </div>
                <div class="donateStatement">
                    <label>Every year, new families lack the income to provide the basic necessities for their child. Help by considering donating here!</label>
                    <br /><br />
                    <label>For every dollar donated via your E-Wallet, we at Mum's Story will generously donate to them on your behalf.</label>
                </div>
            </div>
        </div>
        <div class="contentContainer2">
            <div class="contentContainer_2">
                <div class="wrapperDesert">
                    <div class="cubeDesert">
                        <div class="frontDesert" onclick="turn(-90)">
                            <asp:Image ID="Image2" runat="server" CssClass="image" ImageUrl="~/CSS and Images/DonationPage Images/843513588-612x612.jpg" />
	                    </div>
                        <div class="backDesert"  onclick="turn(-270)">
                            <asp:Image ID="Image1" runat="server" CssClass="image" ImageUrl="~/CSS and Images/DonationPage Images/492540616-612x612.jpg" />
	                    </div>
                        <div class="leftDesert"  onclick="turn(-0)">
                            <asp:Image ID="Image3" runat="server" CssClass="image" ImageUrl="~/CSS and Images/DonationPage Images/download.png" />
	                    </div>
                        <div class="rightDesert"  onclick="turn(-180)">
                            <asp:Image ID="Image4" runat="server" CssClass="image" ImageUrl="~/CSS and Images/DonationPage Images/695218436-612x612.jpg" />
	                    </div>
                    </div>
                </div>
                <div class="buttonContainer">
                    <div class="noteContainer2">
                        <label>
                            Total Donation Raised: 
                        </label>
                        <br />
                        <asp:Label ID="lb_Donate" Cssclass="lb_Donate" runat="server" Text="$100.00"></asp:Label>
                    </div>
                    <div class="buttonContainer2">
                        <asp:Button ID="btn_Donate" CssClass="btn_Donate" runat="server" Text="Donate Here" OnClick="btn_Donate_Click" />
                    </div>
                    <div class="noteContainer">
                        <label>
                            *Note: Donation is only enabled when logged in and will only accept E-Wallet as payment.
                        </label>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>
        function turn(x) {
		    document.getElementsByClassName("cubeDesert")[0].style.transform="rotateY("+x+"deg)";
	    }
    </script>
</asp:Content>

