<%@ Page Title="Contacts" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Contacts.aspx.cs" Inherits="Contacts" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script>
        function getPageNum() {
            return 6;
        }
    </script>
    <style>
        #extraDiv{
            border:1px solid transparent;
        }

        .mapContainer{
            max-width:700px;
            margin:auto;
            margin-top:20px;
            margin-bottom:50px;
            border:1px solid black;
            padding-top:30px;
            padding-bottom:30px;
            background:white;
        }

        .mapContainer1{
            border:1px solid black;
            width:600px;
            margin:auto;
            height:250px;
        }

        .mapContainer2{
            border:1px solid black;
            border-top:none;
            width:585px;
            margin:auto;
            height:32px;
            padding-top:7px;
            font-family:Arial;
            font-size:16px;
            padding-left:15px;
        }

        .map{
            width:100%;
            height:100%;
        }

        .contentContainer2{
            border:1px solid none;
            max-width:700px;
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
            background: white;
            transform: translateZ(100px);
        }

        .backDesert{
            background-color: white;
            transform: rotateY(180deg) translateZ(100px);
        }
        .leftDesert{
            background-color: white;
            transform: rotateY(-90deg) translateX(-100px);
            transform-origin: left center;
        }

        .rightDesert{
            background-color: white;
            transform: rotateY(90deg) translateX(100px);
            transform-origin: right center;
        }

        .image{
            width:200px;
            height:200px;
        }

        .buttonContainer{
            border:1px solid grey;
            border-right:none;
            float:left;
            height:300px;
            width:360px;
        }

        .contentContainer_2{
            width:665px;
            margin:auto;
        }

        .contactContainer{
            margin-top:30px;
            margin-left:15px;
            margin-right:15px;
            font-size:18px;
            font-family:Arial;
        }

        .firstCube{
            border:0.1px solid black;
            text-align:center;
        }


    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="extraDiv">
        <div class="mapContainer">
            <div class="mapContainer1">
                <iframe class="map" frameborder="0" src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2820.4095576543855!2d103.84763822702031!3d1.3797941717718378!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31da16eb64b0249d%3A0xe5f10ff680eed942!2sNanyang+Polytechnic!5e0!3m2!1sen!2ssg!4v1525278416777" ></iframe>
            </div>
            <div class="mapContainer2">
                <label>180 Ang Mo Kio Avenue 8, 569830</label>
            </div>
        </div>
        <div class="contentContainer2">
            <div class="contentContainer_2">
                <div class="buttonContainer">
                    <div class="contactContainer">
                        <label>Got an issue regarding our website?</label><br />
                        <label>Was your transaction not properly recorded?</label><br />
                        <label>Have yet to receive your delivery?</label><br /><br />
                        <label>Contact us for help regarding your issue.</label><br /><br />
                        <label>Click on the cube to view all contacts for the corresponding department</label><br /><br />
                        <label style="font-size:14px;">For any additional enquires, email us at MumStory@mstory.com</label>
                    </div>
                </div>
                <div class="wrapperDesert">
                    <div class="cubeDesert">
                        <div class="frontDesert" onclick="turn(-90)">
                            <div class="firstCube">
                                <br />
                                <label>Department:</label>
                                <br />
                                <label>Marketing</label>
                                <br /><br />
                                <label>Contacts:</label>
                                <br />
                                <label>1800-231-2421</label>
                                <br />
                                <label>1800-231-2127</label>
                                <br />
                                <label>1800-231-6232</label>
                            </div>
	                    </div>
                        <div class="backDesert"  onclick="turn(-270)">
                            <div class="firstCube">
                                <br />
                                <label>Department:</label>
                                <br />
                                <label>Doctor Service</label>
                                <br /><br />
                                <label>Contacts:</label>
                                <br />
                                <label>1800-234-2511</label>
                                <br />
                                <label>1800-234-6127</label>
                                <br />
                                <label>1800-234-5412</label>
                            </div>
	                    </div>
                        <div class="leftDesert"  onclick="turn(-0)">
                            <div class="firstCube">
                                <br />
                                <label>Department:</label>
                                <br />
                                <label>Transactions</label>
                                <br /><br />
                                <label>Contacts:</label>
                                <br />
                                <label>1800-237-8456</label>
                                <br />
                                <label>1800-237-3217</label>
                                <br />
                                <label>1800-237-2522</label>
                            </div>
	                    </div>
                        <div class="rightDesert"  onclick="turn(-180)">
                            <div class="firstCube">
                                <br />
                                <label>Department:</label>
                                <br />
                                <label>Customer Support</label>
                                <br /><br />
                                <label>Contacts:</label>
                                <br />
                                <label>1800-232-8416</label>
                                <br />
                                <label>1800-232-1217</label>
                                <br />
                                <label>1800-232-3872</label>
                            </div>
	                    </div>
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

