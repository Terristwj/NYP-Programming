<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Services.aspx.cs" Inherits="BitzAndBytez.Services" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        /** Debugging
        .service_container{
            border:1px solid green;
        }
        .serviceList{
            border:1px solid red;
        }
        .serviceList > div {
            border:1px solid green;
        }
        */
        .service_container{
            border:1px solid transparent;
            width:90%;
            margin:auto;
            min-height:600px;
            background-color: rgba(0,0,0,0.7);
        }
        .serviceList{
            display: flex;
            flex-wrap: wrap;
            margin-top:10px;
            padding:0;
            justify-content: space-around;
            align-items:center;
            font-family: sans-serif;
        }
        .serviceList > div {
            border-bottom:1px solid #fff;
            width: 40%;
            margin: 20px;
            color: white;
        }
        .serviceList_content{
            position:relative;
            padding:20px;
        }
        .serviceList_box .serviceList_content h2{
            position: absolute;
            top:0px;
            right: 20px;
            margin:0px;
            padding:0px;
            font-size:10em;
            transition:0.5s;
        }
        .serviceList_box:hover .serviceList_content h2{
            top: -20px;
        }
        .serviceList_box .serviceList_content h3{
            margin: 0 0 10px;
            padding: 0;
            font-size: 24px;
            font-weight: 500;
            color: #fff;
        }
        .serviceList_box .serviceList_content p{
            margin: 0;
            padding: 0;
            font-size: 16px;
            color: #fff;
        }
        .serviceList_box .serviceList_content a{
            position: relative;
            margin: 20px 0 0;
            padding: 10px 20px;
            text-decoration: none;
            border:1px solid #fff;
            color: #fff;
            display: inline-block;
            transition: 0.5s;
            transform: translateY(-40px);
            opacity:0;
            visibility:hidden;
        }
        .serviceList_box:hover .serviceList_content a{
            transform: translateY(0);
            opacity: 1;
            visibility:visible;
        }
        .serviceList_box .serviceList_content a:hover{
            color: #000;
            background: #fff;
        }

        @media (max-width: 1560px) {
            .serviceList {
                margin-top: 30px;
            }

                .serviceList > div {
                    width: 80%;
                }
        }
        @media (max-width: 1100px) {
        }

        @media (max-width: 991px) {  
            .serviceList_box .serviceList_content a{
                transform: translateY(0);
                opacity:1;
                visibility:visible;
            }
        }

        @media (max-width: 950px) {
        }
        @media (max-width: 740px) {
            .serviceList_box .serviceList_content h2{
                font-size:5em;
            }
        }
        @media (max-width: 640px) {
            .serviceList_box .serviceList_content h2{
                font-size:2em;
            }
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="service_container">
        <div class="serviceList">
            <div  class="serviceList_box">
              <div class="serviceList_content">
                <h2>01</h2>
                <h3>PC Building Service</h3>
                <p>
                    - Certified professionals will build you PC
                </p>
                <p>
                    - Option to deliver your PC
                </p>
                <a href="ServicesRegister.aspx?service=PCBuilding">Register</a>
              </div>
            </div>
            <div  class="serviceList_box">
              <div class="serviceList_content">
                <h2>02</h2>
                <h3>PC Repair Service</h3>
                <p>
                    - Repair your PC in our store
                </p>
                <p>
                    - Option to deliver your PC
                </p>
                <a href="ServicesRegister.aspx?service=PCRepair">Register</a>
              </div>
            </div>
            <div  class="serviceList_box">
            <div class="serviceList_content">
                <h2>03</h2>
                <h3>PC Building Lesson</h3>
                <p>
                    - One-to-one lessons
                </p>
                <p>
                    - Learn how to build a PC
                </p>
                <p>
                    - Teaching materials provided
                </p>
                <a href="ServicesRegister.aspx?service=PCLesson">Register</a>
                </div>
            </div>
            <div  class="serviceList_box">
              <div class="serviceList_content">
                <h2>04</h2>
                <h3>Onsite Diagnosis</h3>
                <p>
                    - Make an appointment
                </p>
                <p>
                    - Professionals sent to the site
                </p>
                <p>
                    - Perform a diagnosis to check your PC
                </p>
                <a href="ServicesRegister.aspx?service=OnsiteDiag">Register</a>
              </div>
            </div>
        </div>
    </div>
</asp:Content>
