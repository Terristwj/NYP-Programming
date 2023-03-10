<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ViewProfilePage.aspx.cs" Inherits="ViewProfilePage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script>
        function getPageNum() {
                return 3;
        }
    </script>
    <style>
        .content{
            height:auto;
        }

        #extraDiv{
            border:1px transparent solid;
        }

        #TopHeaderContainer{
            width:80%;
            margin:auto;
            margin-top:10px;
            height:27px;
        }

        .backContainer{
            float:right;
        }

        .btn_Back{
            cursor:pointer;
            border:1px solid black;
            background:white;
            padding-left:8px;
            padding-right:8px;
            padding-top:3px;
            padding-bottom:3px;
            font-size:18px;
        }

        .btn_Back:hover{
            background: rgb(255, 238, 243);
        }

        #profileHeader{
            border: 1px solid black;
            background:transparent;
            display:block;
            margin:auto;
            margin-top:15px;
            margin-bottom:40px;
            width:80%;
            height:250px;
            position:relative;
        }

        #profileImage-Container{
            background:transparent;
            height:250px;
            opacity:0.5;
        }

        .imgProfileBackground{
            height:250px; 
            width:100%;
        }

        @media(min-width:900px) {
            #profileHeader, #profileImage-Container, .imgProfileBackground{height: 300px;}
        }

        @media(min-width:1575px) {
            #profileHeader, #profileImage-Container, .imgProfileBackground{height: 320px;width:1300px;}
            #TopHeaderContainer {width: 1300px;}
        }

        #profileContainer{
            position:absolute;
            top:55px;
            width:100%;
        }

        #profileContainer2{
            margin:auto;
            border:1px solid black;
            height:141px;
            width:105px;
        }

        #profileImgContainer{
            height:105px;
            width:100%;
        }

        .profileImage{
            height:100%;
            width:100%;
            cursor:-webkit-grab;
        }

        #profileNameContainer{
            border-top:1px solid black;
            height:35px;
            width:100%;
            background:white;
            text-align:center;
        }

        .lblName{
            margin-top:5px;
            font-family:"Arial";
        }

        @media(min-width:900px) {
            #profileContainer2{height:187px;width:151px;} 
            #profileImgContainer{height:151px;}
        }

        @media(min-width:1575px) {
            #profileContainer2{height:217px;width:181px;} 
            #profileImgContainer{height:181px;}
        }

        #MiddlePage{
            border:none;
            width:80%;
            margin:auto;
            display:block;
        }

        #AboutMe{
            border:1px solid black;
            flex:6;
            padding-bottom:30px;
            margin-bottom:40px;
        }

        .title{
            text-decoration:underline;
            text-align:center;
        }

        #AboutMeContainer{
            width:441px;
            margin:auto;
        }

        #AboutMeContainer2{ 
            position:relative;  /*NEVER REMOVE THIS*/
            width:341px;
            height:199px;
            margin:auto;
            overflow:hidden;
        }

        .tb_AboutMe{
            position:absolute;  /*NEVER REMOVE THIS*/
            top:0;              /*NEVER REMOVE THIS*/
            left:0;             /*NEVER REMOVE THIS*/
            height:193px;
            width:335px;
            resize:none;
            overflow:hidden;
            cursor: default;
        }

        .tb_AboutMe:focus{
            outline-color: deeppink;
        }

        #Membership{
            border:1px solid black;
            flex:6;
            padding-bottom:30px;
        }

        #Membership-Content{
            border:1px solid grey;
            width:341px;
            text-align:center;
            margin:auto;
            padding-top:30px;
            padding-bottom:40px;
        }

        #BottomPage{
            display:none;
            height:120px;
        }

        @media(min-width:1200px) {
            #MiddlePage{display:flex;border:1px solid black;}
            #AboutMe {border:none;border-right: 1px solid black;margin-bottom:0px;}
            #Membership {border: none;}
            #BottomPage{display:block;}
        }

        @media(min-width:1575px) {
            #MiddlePage{width:1300px;display:flex;}
        }

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="extraDiv">
        <div id="TopHeaderContainer">
            <div class="backContainer">
                <asp:Button ID="btn_Back" CssClass="btn_Back" runat="server" Text="Back" OnClick="btn_Back_Click" />
            </div>
        </div>
        <div id="profileHeader">
            <div id="profileImage-Container">
                <asp:Image ID="ImgProfileBackground" runat="server" ImageUrl="~/CSS and Images/Images and fonts/DefaultProfileBackground.jpg" CssClass="imgProfileBackground" />
            </div>
            
            <div id="profileContainer">
                <div id="profileContainer2">
                    <div id="profileImgContainer">
                        <asp:Image ID="Image1" runat="server" CssClass="profileImage" ImageUrl="~/CSS and Images/Images and fonts/Sample Proile Image.jpg" />
                    </div>
                    <div id="profileNameContainer">
                        <div style="height:7px;"></div>
                        <asp:Label ID="LblName" runat="server" CssClass="lblName" Text="Name"></asp:Label>
                    </div>
                </div>
            </div>
        </div>
        <div id="MiddlePage">
            <div id="AboutMe">
                <div class="title">
                    <h2>About Me</h2>
                </div>
                <div id="AboutMeContainer">
                    <div id="AboutMeContainer2">
                        <asp:TextBox ID="tb_AboutMe" CssClass="tb_AboutMe" Font-Size="13" runat="server" TextMode="MultiLine" Font-Names="Arial" ReadOnly="True" Columns="42"></asp:TextBox>
                    </div>
                </div>
            </div>
            <div id="Membership">
                <div class="title">
                    <h2>Membership</h2>
                </div>
                <div id="Membership-Content">
                    <asp:label ID="lb_Membership_Status" runat="server" text="" Font-Names="Arial" Font-Size="13"></asp:label>
                    <div style="height:8px;"></div>
                    <asp:label ID="lb_Membership_DateJoined" runat="server" text="" Font-Names="Arial" Font-Size="13"></asp:label>
                </div>
            </div>
        </div>
        <div id="BottomPage"></div>
    </div>
</asp:Content>


