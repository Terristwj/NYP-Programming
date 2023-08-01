<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="BitzAndBytez.Home" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        @import url('https://fonts.googleapis.com/css?family=Numans');

* {box-sizing: border-box;}
body {font-family: Verdana, sans-serif;}
.mySlides {
    display:none;

}.imgSlides {
     vertical-align:middle;
           width: 1000px;
           height: 400px;
}

.home_container {
            border: 20px solid transparent;
            width: 90%;
            margin: auto;
            min-height: 600px;
            background-color: rgba(0,0,0,0.7);
        }


/* Slideshow container */
.slideshow-container {
  max-width: 1000px;
  position: relative;
  margin: auto;
  height: 400px;
}

/* Caption text */
.text {
  color: #f2f2f2;
  font-size: 15px;
  padding: 8px 12px;
  position: absolute;
  bottom: 8px;
  width: 100%;
  text-align: center;
}

/* Next & previous buttons */
.prev, .next {
  cursor: pointer;
  position: absolute;
  top: 50%;
  width: auto;
  margin-top: -22px;
  padding: 16px;
  font-weight: bold;
  font-size: 18px;
  transition: 0.6s ease;
  border-radius: 0 3px 3px 0;
  user-select: none;
  color:white;
}

/* Position the "next button" to the right */
.next {
  right: 0;
  border-radius: 3px 0 0 3px;
}


/* Number text (1/3 etc) */
.numbertext {
  color: #f2f2f2;
  font-size: 12px;
  padding: 8px 12px;
  position: absolute;
  top: 0;
}

/* The dots/bullets/indicators */
.dot {
  height: 15px;
  width: 15px;
  margin: 0 2px;
  background-color: #bbb;
  border-radius: 50%;
  display: inline-block;
  transition: background-color 0.6s ease;
}

.active {
  background-color: #717171;
}

/* Fading animation */
.fade {
  -webkit-animation-name: fade;
  -webkit-animation-duration: 1.5s;
  animation-name: fade;
  animation-duration: 1.5s;
}

.home_container {
            border: 1px solid transparent;
            width: 90%;
            margin: auto;
            min-height: 750px;
            background-color: rgba(0,0,0,0.7);
            
}


.promoContainer::after{
  content: "";
  clear: both;
  display: table;
}

/*use width to change image size*/
.promo{
  float: left;
  width: 23.5%;
  padding: 10px;
}

.row{
    clear:both;
    display: block;
    margin-left:5%;
}

.PromoTitle{
    padding-left: 6%;
}

@-webkit-keyframes fade {
  from {opacity: .4} 
  to {opacity: 1}
}

@keyframes fade {
  from {opacity: .4} 
  to {opacity: 1}
}

/* On smaller screens, decrease text size */
@media only screen and (max-width: 300px) {
  .text {font-size: 11px}

}

    </style>

    <script>        
        var slideIndex = 0;

        function showSlides(n) {
            var i;
            var slides = document.getElementsByClassName("mySlides");

            if (n > 0) {
                console.log("slideIndex > slides.length -> slideIndex: " + slideIndex);

                if ((slideIndex + 1) == slides.length) {
                    slideIndex = 0;
                } else {
                    slideIndex++;
                }
                
            }

            if (n < 0) {
                console.log("slideIndex < 0 -> slideIndex: " + slideIndex);
                if ((slideIndex - 1) < 0) {
                    slideIndex = slides.length - 1;
                } else {
                    slideIndex--;
                }
            }

            for (var i = 0; i < slides.length; i++) {
                slides[i].style.display = "none";
            }

            slides[slideIndex].style.display = "block"; 
            setTimeout(showSlides, 5000);
        }

        $(document).ready(function () {
            showSlides(1);
        });


    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="home_container">
    <!-- Slideshow container -->
<div class="slideshow-container">

  <!-- Full-width images with number and caption text -->
  <div class="mySlides">
    <div class="numbertext">1 / 3</div>
      <img class="imgSlides" src="img/laptop1.jpg">
  </div>

  <div class="mySlides">
    <div class="numbertext">2 / 3</div>
      <img class="imgSlides" src="img/laptop2.jpg">
  </div>

  <div class="mySlides">
    <div class="numbertext">3 / 3</div>
      <img class="imgSlides" src="img/laptop3.jpg" >
  </div>

  <!-- Next and previous buttons -->
  <a class="prev" onclick="showSlides(-1)">&#10094;</a>
  <a class="next" onclick="showSlides(1)">&#10095;</a>  

</div>
<br>

 <h2 class="PromoTitle" style="color:white;">Promotions</h2>
<div class="row">
<br>
   <div class="promo">
       <img src="img/desktop3.jpg" style="width:100%;" />
       <p style="color:white;">Loream Ipsum</p>
   </div>
   <div class="promo">
       <img src="img/desktop2.jpg" style="width:100%;"/>
       <p style="color:white;">Loream Ipsum</p>
   </div>
   <div class="promo">
       <img src="img/desktop3.jpg" style="width:100%;"/>
       <p style="color:white;">Loream Ipsum</p>
   </div>
    <div class="promo">
        <img src="img/desktop2.jpg" style="width:100%;"/>
        <p style="color:white;">Loream Ipsum</p>
    </div>
</div>

</div>


</asp:Content>
