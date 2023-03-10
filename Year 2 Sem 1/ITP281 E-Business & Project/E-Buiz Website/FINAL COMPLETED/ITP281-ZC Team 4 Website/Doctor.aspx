<%@ Page Title="Doctor" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Doctor.aspx.cs" Inherits="Doctor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script>
        function getPageNum() {
            return 1;
        }
    </script>
    <style>
        .content{
            height:auto;
            min-height:820px;
        }

        #extraDiv{
            border:1px solid transparent;
        }

        .bigContainer{
            display:block;
        }

        .content1{
            height:420px;
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
            margin-top:25px;
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
            height:435px;
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

        .statementCardContent{
            border:1px solid black;
            height:325px;
            background:#fee9f1;
            font-family:Arial;
            font-size:19px;
            padding-top:10px;
            padding-bottom:10px;
            padding-left:55px;
            padding-right:55px;
            border-bottom:1px solid black;
        }

        .btnContainer{
            padding-top:20px;
            padding-bottom:50px;
        }
        .btnContainer2{
            width:340.9px;
            height:45px;
            margin:auto;
        }

        .btn_Rooms{
            border:1px solid black;
            float:left;
            background:white;
            padding-top:9px;
            padding-bottom:9px;
            padding-left:9px;
            padding-right:9px;
            font-size:19px;
            cursor:pointer;
            width:150px;
        }
        .btn_Book{
            border:1px solid black;
            float:right;
            background:white;
            padding-top:9px;
            padding-bottom:9px;
            padding-left:9px;
            padding-right:9px;
            font-size:19px;
            cursor:pointer;
            width:150px;
        }

        .btn_Rooms:hover, .btn_Book:hover{
            background:rgb(255, 235, 238);
        }

        @media(min-width: 1600px){
            .bigContainer{
                display:flex;
            }

            .content1{
                height:460px;
                flex:1;
            }

            .content2{
                height:460px;
                flex:1;
            }
            
            .slideShowCard{
                height:405px;
                width:700px;
                float:right;
                margin-right:40px;
            }

            .slideContainer{
                height:360px;
                width:700px;
            }
            .imageSlideShow{
                 height:360px;
            }

            .statementCard{
                margin-top:25px;
                height:303px;
                width:700px;
                float:left;
                margin-left:40px;
            }

            .statementCardContent{
                padding-top:20px;
                font-size:21px;
            }
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="extraDiv">
        <div class="bigContainer">
            <div class="content1">
                <div class="slideShowCard">
                    <div class="slideContainer">
                        <div class="mySlides fade">
                            <asp:Image ID="Image1" Cssclass="imageSlideShow" runat="server" ImageUrl="~/CSS and Images/DoctorSlide Images/494639164-612x612.jpg" />
                            <div class="text">"Online Doctor At Your Service"</div>
                        </div>

                        <div class="mySlides fade">
                            <asp:Image ID="Image2" Cssclass="imageSlideShow" runat="server" ImageUrl="~/CSS and Images/DoctorSlide Images/519214490-612x612.jpg" />
                            <div class="text2">"We Give Quality Consults"</div>
                        </div>

                        <div class="mySlides fade">
                            <asp:Image ID="Image3" Cssclass="imageSlideShow" runat="server" ImageUrl="~/CSS and Images/DoctorSlide Images/587952472.jpg" />
                            <div class="text2">"Customer Convenience Is Our Satisfaction"</div>
                        </div>

                        <div class="mySlides fade">
                            <asp:Image ID="Image4" Cssclass="imageSlideShow" runat="server" ImageUrl="~/CSS and Images/DoctorSlide Images/628328284-612x612.jpg" />
                            <div class="text3">"We Do It Because We Care"</div>
                        </div>

                        <div class="mySlides fade">
                            <asp:Image ID="Image5" Cssclass="imageSlideShow" runat="server" ImageUrl="~/CSS and Images/DoctorSlide Images/846388970-612x612.jpg" />
                            <div class="text4">"Your Child's Health Is Important"</div>
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
                <div class="statementCard">
                    <div class="statementCardTitle">
                        <label>Information</label>
                    </div>
                    <div class="statementCardContent">
                        <label>Visit the Online Doctor with your own confort at home!</label>
                        <br /><br />
                        <label>In this site, you can consult a doctor online than visiting a clinic.</label>
                        <br />
                        <label>Chat with our wide range of specialised doctors.</label>
                        <br /><br />
                        <label>Currently, all our doctors specialize in baby related problems.</label>
                        <br />
                        <label>However, we hope to expand more to that of a general clinic.</label>
                        <br /><br />
                        <label>Just click on a button below to start consulting!</label>
                        <br /><br />
                        <label>To start booking, you must be logged in and have an E-wallet of minimum $30. Each session is 30min and $30.</label>
                    </div>
                </div>
            </div>
        </div>
        <div class="btnContainer">
            <div class="btnContainer2">
                <asp:Button ID="btn_Rooms" CssClass="btn_Rooms" runat="server" Text="Enter Room" OnClick="btn_Rooms_Click" />
                <asp:Button ID="btn_Book" CssClass="btn_Book" runat="server" Text="Make Booking" OnClick="btn_Book_Click" />
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
    </script>
</asp:Content>

