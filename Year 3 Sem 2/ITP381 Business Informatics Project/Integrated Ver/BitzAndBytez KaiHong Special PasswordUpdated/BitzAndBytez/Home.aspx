<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="BitzAndBytez.Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
     <script>
        function getPageNum() {
            return 0;
        }
    </script>
    <style>
        #extraDiv{
            border:1px solid transparent;
            border:1px solid red;
        }

        .content1{
            padding-top:25px;
            padding-bottom:25px;
        }

        .imageSlideShow{
             width:100%; 
             height:320px;
        }

        .slideShowCard{
            border:1px solid black;
            height:365px;
            width:600px;
            margin:auto;
        }

        .slideContainer{
            border-bottom:1px solid black;
            height:320px;
            width:600px;
            margin:auto;
            position: relative;
        }
        
        /* Hide the images by default */
        .mySlides {
            display: none;
        }

        /* Next & previous buttons */
        .prev, .next {
            cursor: pointer;
            position: absolute;
            top: 50%;
            width: auto;
            margin-top: -22px;
            padding: 16px;
            color: white;
            font-weight: bold;
            font-size: 18px;
            transition: 0.6s ease;
            border-radius: 0 3px 3px 0;
        }

        /* Position the "next button" to the right */
        .next {
            right: 0;
            border-radius: 3px 0 0 3px;
        }

        /* On hover, add a black background color with a little bit see-through */
        .prev:hover, .next:hover {
            background-color: rgba(0,0,0,0.8);
        }

        /* Caption text */
        .text {
            font-style: italic;
            border:1px solid black;
            border-left:none;
            background: rgba(255,255,255,.95);
            color: black;
            font-size: 17px;
            width:200px;
            padding: 8px 12px;
            position: absolute;
            bottom: 8px;
            text-align: center;
        }

        .text2 {
            font-style: italic;
            border:1px solid black;
            border-left:none;
            background: rgba(255,255,255,.95);
            color: black;
            font-size: 17px;
            width:200px;
            padding: 8px 12px;
            position: absolute;
            top: 8px;
            text-align: center;
        }

        .text3 {
            font-style: italic;
            border:1px solid black;
            border-right:none;
            background: rgba(255,255,255,.95);
            color: black;
            font-size: 17px;
            width:200px;
            padding: 8px 12px;
            position: absolute;
            top: 8px;
            right:0;
            text-align: center;
        }

        .text4 {
            font-style: italic;
            border:1px solid black;
            border-right:none;
            background: rgba(255,255,255,.95);
            color: black;
            font-size: 17px;
            width:200px;
            padding: 8px 12px;
            position: absolute;
            bottom: 8px;
            right:0;
            text-align: center;
        }

        /* The dots/bullets/indicators */
        .dot {
            cursor: pointer;
            height: 15px;
            width: 15px;
            margin: 0 2px;
            background-color: #bbb;
            border-radius: 50%;
            display: inline-block;
            transition: background-color 0.6s ease;
        }

        .active, .dot:hover {
            background-color: #717171;
        }

        /* Fading animation */
        .fade {
            animation-name: fade;
            animation-duration: 9s;
        }

        @keyframes fade {
            0% {opacity: 0.2} 
            20% {opacity: 1}
            95% {opacity: 1}
            100% {opacity: 0.4}
        }

        .content2{
            padding-top:20px;
            padding-bottom:20px;
        }

        .content2BigContainer{
            width:600px;
            margin:auto;
        }

        .content2BigContainer1_1 {
            display:block;
            width:600px;
        }

        .content2BigContainer2_1 {
            display:block;
            width:600px;
        }
        
        .content2BigContainer1{
            display:flex;
            width:100%;
        }

        .content2BigContainer2{
            display:flex;
            width:100%;
        }


        .content2Container1{
            border:1px solid grey;
            flex:1;
        }

        .content2Container2{
            border:1px solid grey;
            flex:1;
        }

	    #TheBook{
		    position:relative;
		    margin:30px auto;
		    position:relative;
		    width: 200px;
		    height: 250px;
		    perspective: 1000px;
	    }
	
	    .bookPageFront{
		    color:#666;
            font-size:23px;
		    position:absolute;
		    width: 200px; 
		    height: 250px;
		    text-align: center;
		    box-shadow: 2px 2px 1px #8c8c8c;
	    }	

        .bookPageInside{
		    color:#666;
		    position:absolute;
		    width: 200px; 
		    height: 250px;
		    text-align: center;
		    box-shadow: 2px 2px 1px #8c8c8c;
	    }	
	
	    #BookFrontPage{
		    background: #d0f1f2;
		    transform-origin: left center;
		    transition: all 2s, background-color 2s;
		    z-index:1;
	    }
	
	    #BookFirstPage{
		    background: #ebf9fa;
	    }

        #TheBook2{
		    position:relative;
		    margin:30px auto;
		    position:relative;
		    width: 200px;
		    height: 250px;
		    perspective: 1000px;
	    }

        #BookFrontPage2{
		    background: #d0f1f2;
		    transform-origin: left center;
		    transition: all 2s, background-color 2s;
		    z-index:1;
	    }
	
	    #BookFirstPage2{
		    background: #ebf9fa;
	    }

        #TheBook3{
		    position:relative;
		    margin:30px auto;
		    position:relative;
		    width: 200px;
		    height: 250px;
		    perspective: 1000px;
	    }

        #BookFrontPage3{
		    background: #d0f1f2;
		    transform-origin: left center;
		    transition: all 2s, background-color 2s;
		    z-index:1;
	    }
	
	    #BookFirstPage3{
		    background: #ebf9fa;
	    }

        #TheBook4{
		    position:relative;
		    margin:30px auto;
		    position:relative;
		    width: 200px;
		    height: 250px;
		    perspective: 1000px;
	    }

        #BookFrontPage4{
		    background: #d0f1f2;
		    transform-origin: left center;
		    transition: all 2s, background-color 2s;
		    z-index:1;
	    }
	
	    #BookFirstPage4{
		    background: #ebf9fa;
	    }
        
        .content3_1{
            height:435px;
            flex:1;
        }
        
        .content3_2{
            height:435px;
            flex:1;
        }

        .statementCard{
            height:300px;
            width:600px;
            margin:auto;
            margin-top:13px;
        }

        .statementCardTitle{
            font-family:Arial;
            font-size:21px;
            padding-top:10px;
            padding-bottom:10px;
            padding-left:15px;
            border:1px solid black;
            border-bottom:none;
            width:150px;
            border-top-right-radius:25px;
            background:#fd90be;
            color:white;
        }

        .statementCardTitle2{
            font-family:Arial;
            font-size:21px;
            padding-top:10px;
            padding-bottom:10px;
            padding-left:15px;
            border:1px solid black;
            border-bottom:none;
            width:150px;
            border-top-right-radius:25px;
            background:#fd90be;
            color:white;
        }

        .statementCardContent{
            border:1px solid black;
            height:305px;
            background:#fee9f1;
            font-family:Arial;
            font-size:19px;
            padding-top:20px;
            padding-bottom:10px;
            padding-left:55px;
            padding-right:55px;
            border-bottom:1px solid black;
        }

        @media(min-width: 1200px){
            .imageSlideShow{
                 height:300px;
                 width:600px;
            }

            .slideShowCard{
                height:345px;
                width:900px;
            }

            .slideContainer{
                height:300px;
                width:900px;
            }

            .text, .text2, .text3, .text4 {
                border:1px solid transparent;
                border-left:1px solid black;
                font-size: 23px;
                width:274px;
                height:189.5px;
                right:0;
                top:0px;
                padding-left:12px;
                padding-top:100px;
                text-align: center;
            }

            .content2BigContainer{
                display:flex;
                width:1200px;
            }

            .content3{
                display:flex;
            }

            .content3_1{
                padding-left:0;
            }

            .content3_2{
                padding-right:0;
            }   

            .statementCardTitle2{
                padding-left:35px;
                width:130px;
                margin-left:433px;
                border-top-right-radius:0px;
                border-top-left-radius:25px;
            }
        }

        @media(min-width:1400px){
            .content3_1{
                padding-left:5%;
            }

            .content3_2{
                padding-right:5%;
            }
        }

        @media(min-width:1600px){
            .content3_1{
                padding-left:12%;
            }

            .content3_2{
                padding-right:12%;
            }
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="extraDiv">
        <div class="content1">
            <div class="slideShowCard">
                <div class="slideContainer">
                    <div class="mySlides fade">
                        <asp:Image ID="Image1" Cssclass="imageSlideShow" runat="server" ImageUrl="~/CSS and Images/HomePage Images/495803382-612x612.jpg" />
                        <div class="text">"Eat Right, Grow Right"</div>
                    </div>

                    <div class="mySlides fade">
                        <asp:Image ID="Image2" Cssclass="imageSlideShow" runat="server" ImageUrl="~/CSS and Images/HomePage Images/611999288-612x612.jpg" />
                        <div class="text2">"Expert Consults"</div>
                    </div>

                    <div class="mySlides fade">
                        <asp:Image ID="Image3" Cssclass="imageSlideShow" runat="server" ImageUrl="~/CSS and Images/HomePage Images/664046882-612x612.jpg" />
                        <div class="text2">"Whats Best For Your Child"</div>
                    </div>

                    <div class="mySlides fade">
                        <asp:Image ID="Image4" Cssclass="imageSlideShow" runat="server" ImageUrl="~/CSS and Images/HomePage Images/835833976-612x612.jpg" />
                        <div class="text3">"We Take It To Heart"</div>
                    </div>

                    <div class="mySlides fade">
                        <asp:Image ID="Image5" Cssclass="imageSlideShow" runat="server" ImageUrl="~/CSS and Images/HomePage Images/917079152-612x612.jpg" />
                        <div class="text4">"One Building Block Ahead"</div>
                    </div>

                        <!-- Next and previous buttons -->
                    <a class="prev" onclick="plusSlides(-1)">&#10094;</a>
                    <a class="next" onclick="plusSlides(1)">&#10095;</a>
                </div>
                <div style="text-align:center;margin-top:15px;">
                    <span class="dot" onclick="currentSlide(1)"></span> 
                    <span class="dot" onclick="currentSlide(2)"></span> 
                    <span class="dot" onclick="currentSlide(3)"></span> 
                    <span class="dot" onclick="currentSlide(4)"></span> 
                    <span class="dot" onclick="currentSlide(5)"></span> 
                </div>

            </div>
        </div>
        <div class="content2">
            <div class="content2BigContainer">
                
                <div class="content2BigContainer1_1">
                    <div class="content2BigContainer1">
                        <div class="content2Container1">
                            <div id="TheBook">
	                            <div id="BookFrontPage" class="bookPageFront" onmouseover="openBook()" onmouseout="closeBook()">
		                            <p>&nbsp;</p>
                                    <label>
                                        Compassion
		                            </label>
	                            </div>
                                <div id="BookFirstPage" class="bookPageInside" onmouseover="openBook()" onmouseout="closeBook()">
		                            <p>&nbsp;</p>
		                            <p>We at Mum's Story</p>
		                            <h3>Take the job</h3>
		                            <p>No matter the cause</p>
                                </div>  
                            </div>
                        </div>
                        <div class="content2Container1">
                            <div id="TheBook2">
	                            <div id="BookFrontPage2" class="bookPageFront" onmouseover="openBook2()" onmouseout="closeBook2()">
		                            <p>&nbsp;</p>
                                    <label>
                                        Excellence
		                            </label>
	                            </div>
                                <div id="BookFirstPage2" class="bookPageInside" onmouseover="openBook2()" onmouseout="closeBook2()">
		                            <p>&nbsp;</p>
		                            <p>We take the job</p>
		                            <h3>And deliver it</h3>
		                            <p>Without Fail nor Disappointment</p>
                                </div>  
                            </div>
                        </div>
                    </div>
                </div>

                
                <div class="content2BigContainer2_1">
                    <div class="content2BigContainer2">
                        <div class="content2Container1">
                            <div id="TheBook3">
	                            <div id="BookFrontPage3" class="bookPageFront" onmouseover="openBook3()" onmouseout="closeBook3()">
		                            <p>&nbsp;</p>
                                    <label>
                                        Professionalism
		                            </label>
	                            </div>
                                <div id="BookFirstPage3" class="bookPageInside" onmouseover="openBook3()" onmouseout="closeBook3()">
		                            <p>&nbsp;</p>
		                            <p>Delievery of the job</p>
		                            <h3>Is a top priority</h3>
		                            <p>For our customers alike</p>
                                </div>  
                            </div>
                        </div>
                        <div class="content2Container2">
                            <div id="TheBook4">
	                            <div id="BookFrontPage4" class="bookPageFront" onmouseover="openBook4()" onmouseout="closeBook4()">
		                            <p>&nbsp;</p>
                                    <label>
                                        Integrity
		                            </label>
	                            </div>
                                <div id="BookFirstPage4" class="bookPageInside" onmouseover="openBook4()" onmouseout="closeBook4()">
		                            <p>&nbsp;</p>
		                            <p>We stick to our promises</p>
		                            <h3>And never break a trust</h3>
		                            <p>Building a bond with customers</p>
                                </div>  
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="content3">
            <div class="content3_1">
                <div class="statementCard">
                    <div class="statementCardTitle">
                        <label>Features</label>
                    </div>
                    <div class="statementCardContent">
                        <label>Talk to our Online Doctors 24/7 via reservations.</label>
                        <br /><br />
                        <label>Shop for your child's needs with our Store and delivery services.</label>
                        <br /><br />
                        <label>Chat with our wide range of specialised doctors.</label>
                        <br /><br />
                        <label>Customise your profile and stay relevant to the community.</label>
                        <br /><br />
                        <label>View your transactions, safely tracking your orders.</label>
                        <br /><br />
                        <label>Come join us!</label>
                    </div>
                </div>
            </div>
            <div class="content3_2">
                <div class="statementCard">
                    <div class="statementCardTitle2">
                        <label>About Us</label>
                    </div>
                    <div class="statementCardContent">
                        <label>Mum's Story is a small orgnaization that wants to offer back to the community.</label>
                        <br /><br />
                        <label>We would like to help by giving new and young parents a platform where they can ask enquires about their child online.</label>
                        <br /><br />
                        <label>Of course, we aim to make the consultations as professional and real as possible.</label>
                        <br /><br />
                        <label>So please, join us and help make the community grow for the better of our future!</label>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>
        showSlides(0);

        // Next/previous controls
        function plusSlides(n) {
            showSlides(slideIndexA += n);
        }

        // Thumbnail image controls
        function currentSlide(n) {
            showSlides(slideIndexA = n);
        }

        function showSlides(n) {
            var i;
            var slides = document.getElementsByClassName("mySlides");
            var dots = document.getElementsByClassName("dot");
            if (n > slides.length) { slideIndexA = 1 }
            if (n < 1) { slideIndexA = slides.length }
            for (i = 0; i < slides.length; i++) {
                slides[i].style.display = "none";
            }
            for (i = 0; i < dots.length; i++) {
                dots[i].className = dots[i].className.replace(" active", "");
            }
            slides[slideIndexA - 1].style.display = "block";
            dots[slideIndexA - 1].className += " active";
        }

        var slideIndexA = 0;
        showSlidesA();

        function showSlidesA() {
            var i;
            var slides = document.getElementsByClassName("mySlides");
            var dots = document.getElementsByClassName("dot");
            for (i = 0; i < slides.length; i++) {
                slides[i].style.display = "none";
            }
            slideIndexA++;
            if (slideIndexA > slides.length) { slideIndexA = 1 }
            for (i = 0; i < dots.length; i++) {
                dots[i].className = dots[i].className.replace(" active", "");
            }
            slides[slideIndexA - 1].style.display = "block";
            dots[slideIndexA - 1].className += " active";
            setTimeout(showSlidesA, 9000); // Change image every 2 seconds
        }


        
	    function openBook()
	    {
		    var x =document.getElementById("BookFrontPage");
		    x.style.transform="rotateY(-90deg)";
		    x.style.background="#666";
	    }
	
	    function closeBook()
	    {
		    var x =document.getElementById("BookFrontPage");
		    x.style.transform="rotateY(0deg)";
		    x.style.backgroundColor="#d0f1f2";
	    }

	    function openBook2() {
	        var x = document.getElementById("BookFrontPage2");
	        x.style.transform = "rotateY(-90deg)";
	        x.style.background = "#666";
	    }

	    function closeBook2() {
	        var x = document.getElementById("BookFrontPage2");
	        x.style.transform = "rotateY(0deg)";
	        x.style.backgroundColor = "#d0f1f2";
	    }

	    function openBook3() {
	        var x = document.getElementById("BookFrontPage3");
	        x.style.transform = "rotateY(-90deg)";
	        x.style.background = "#666";
	    }

	    function closeBook3() {
	        var x = document.getElementById("BookFrontPage3");
	        x.style.transform = "rotateY(0deg)";
	        x.style.backgroundColor = "#d0f1f2";
	    }

	    function openBook4() {
	        var x = document.getElementById("BookFrontPage4");
	        x.style.transform = "rotateY(-90deg)";
	        x.style.background = "#666";
	    }

	    function closeBook4() {
	        var x = document.getElementById("BookFrontPage4");
	        x.style.transform = "rotateY(0deg)";
	        x.style.backgroundColor = "#d0f1f2";
	    }
    </script>
</asp:Content>


