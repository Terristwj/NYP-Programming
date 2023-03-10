<%@ Page Title="Credit Card" Language="C#" MasterPageFile="~/MasterStore.master" AutoEventWireup="true" CodeFile="StoreCreditCard.aspx.cs" Inherits="StoreCreditCard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head2" Runat="Server">
    <script>
        function getPageNum2() {
            return 4;
        }
    </script>
    <style>
    <style>
        .content{
            height:auto;
        }

        #extraDiv{
            border:1px transparent solid;
        }

        .containers{
            width:620px;
        }

        .containersLeft, .containersRight{
            margin:auto;
        }

        @media(min-width: 1250px) {
            #TopContainer{display:flex;justify-content:flex-end;}
            #ProfileContainer{flex:5;border-right:0.5px solid rgba(0, 0, 0, 0.5);}
            #AddCreditCardContainer{flex:5;border-left:0.5px solid rgba(0, 0, 0, 0.5);}
            .containersLeft{margin-right:0px;}
            .containersRight{margin-left:0px;}
        }

        .dl_CreditCard{
            width:441px;
            margin:auto;
        }

        .btn_SelectCard:hover{
            border:1px solid grey;
        }

        .btn_SelectCard{
            position:absolute;
            width:100%;
            height:100%;
            cursor:pointer;
            background:none;
            border:none;
            border-bottom:1px solid grey;
        }

        .img_CardDL{
            height:70px;
        }
        
        .btn_Delete{
            font-size:15px;
            padding-left:15px;
            padding-right:15px;
            background:none;
            cursor:pointer;
            border:1px solid grey;
            height:40px;
            margin-top:16px;
        }

        .btn_Delete:hover{
            background:rgb(255, 235, 238);
        }

        .title{
            width:443px;
            margin:auto;
            text-decoration:underline;
            margin-bottom:-5px;
        }

        .defaultLabel{
            float:left;
            font-family: Arial;
        }

        #CountryContainer{
            width:441px;
            margin:auto;
        }

        .ddl_Country{
            width:371px;
            margin-top:-2px;
            padding-left:3px;
        }

        #CardTypeContainer{
            width:441px;
            margin:auto;
        }

        .ddl_CardType{
            width:353px;
            margin-top:-2px;
            padding-left:3px;
        }

        .cardImage{
            height:20px;
            margin-top:3px;
            margin-bottom:3px;
        }

        #CardNumberContainer{
            width:441px;
            margin:auto;
        }

        .tb_CardNumber{
            width:324px;
            margin-top:-2px;
            padding-left:3px;
        }

        #ExpiresContainer{
            width:441px;
            margin:auto;
        }

        .tb_Expires{
            width:365px;
            margin-top:-2px;
            padding-left:3px;
        }

        #FNameContainer{
            width:441px;
            margin:auto;
        }

        .tb_FName{
            width:340px;
            margin-top:-2px;
            padding-left:3px;
        }

        #LNameContainer{
            width:441px;
            margin:auto;
        }

        .tb_LName{
            width:341px;
            margin-top:-2px;
            padding-left:3px;
        }

        #AddCardBtnContainer{
            display:block;
        }

        #AddCardBtnContainer2{
            width:270px;
            margin:auto;
        }

        .btn_AddCard{
            font-size:16px;
            padding:10px;
            display:inline;
            width:110px;
            border:1px solid black;
            background:white;
            cursor:pointer;
        }

        #btnSpace{
            display:inline;
        }

        .btn_Back{
            font-size:16px;
            padding:10px;
            display:inline;
            float:right;
            width:110px;
            border:1px solid black;
            background:white;
            cursor:pointer;
        }

        .btn_AddCard:hover, .btn_Back:hover{
            background:rgb(255, 235, 238);
        }

        .auto-style2 {
            width: 100%;
        }

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <div>
        <div id="TopContainer">
            <div id="ProfileContainer">
                <div class="containers containersLeft">
                    <div style="height:10px;">
                    </div>

                    <div class="title">
                        <h2>Select Credit Card</h2>
                    </div>

                    <asp:DataList ID="dl_CreditCard" CssClass="dl_CreditCard" runat="server" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical" OnItemCommand="dl_ItemCommand">
                        <AlternatingItemStyle  />
                        <FooterStyle BackColor="#CCCCCC" />
                        <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                        <ItemTemplate>
                            <table class="auto-style2">
                                <tr>
                                    <td>
                                        <div style="position:relative;">
                                            <asp:Button ID="btn_SelectCard" CssClass="btn_SelectCard" runat="server" Text="" CommandName="select"/>
                                            <table class="auto-style2">
                                                <tr>
                                                    <td>
                                                        <asp:Image ID="img_CardDL" runat="server" CssClass="img_CardDL" ImageUrl='<%# Eval("cardImageUrl") %>' />
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="lb_cardNumberDL" runat="server" Font-Size="24px" Text='<%# Eval("cardNumber") %>'></asp:Label>
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                    </td>
                                    <td>
                                        <div style="border-bottom:1px solid black;height:79px;">
                                            <asp:Button ID="btn_Delete" CssClass="btn_Delete" runat="server" Text="Delete" CommandName="delete" />
                                        </div>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                        <SelectedItemStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                    </asp:DataList>

                    
                    <div style="height:50px;">
                    </div>
                </div>

            </div>

            <div id="SpaceContainer1"></div>

            <div id="AddCreditCardContainer">
                <div class="containers containersRight">
                    <div style="height:10px;">
                    </div>

                    <div class="title">
                        <h2>Add Credit Card</h2>
                    </div>

                    <div id="CountryContainer">
                        <div class="defaultLabel">
                            <label>Country: &nbsp;</label>
                        </div>
                        <asp:DropDownList ID="ddl_Country" CssClass="ddl_Country" font-size="11" runat="server">
                            <asp:ListItem>Albania</asp:ListItem>
                            <asp:ListItem>Algeria</asp:ListItem>
                            <asp:ListItem>Andorra</asp:ListItem>
                            <asp:ListItem>Angola</asp:ListItem>
                            <asp:ListItem>Anguilla</asp:ListItem>
                            <asp:ListItem>Antigua &amp; Barbuda</asp:ListItem>
                            <asp:ListItem>Argenina</asp:ListItem>
                            <asp:ListItem>Armenia</asp:ListItem>
                            <asp:ListItem>Aruba</asp:ListItem>
                            <asp:ListItem>Australia</asp:ListItem>
                            <asp:ListItem>Austria</asp:ListItem>
                            <asp:ListItem>Azerbaijan</asp:ListItem>
                            <asp:ListItem>Bahamas</asp:ListItem>
                            <asp:ListItem>Bahrain</asp:ListItem>
                            <asp:ListItem>Bardado</asp:ListItem>
                            <asp:ListItem>Belarus</asp:ListItem>
                            <asp:ListItem>Belgium</asp:ListItem>
                            <asp:ListItem>Belize</asp:ListItem>
                            <asp:ListItem>Benin</asp:ListItem>
                            <asp:ListItem>Bermuda</asp:ListItem>
                            <asp:ListItem>Bhutan</asp:ListItem>
                            <asp:ListItem>Bolivia</asp:ListItem>
                            <asp:ListItem>Bosnia &amp; Herzegovina</asp:ListItem>
                            <asp:ListItem>Botswana</asp:ListItem>
                            <asp:ListItem>Brazil</asp:ListItem>
                            <asp:ListItem>British Virgin Islands</asp:ListItem>
                            <asp:ListItem>Brunei</asp:ListItem>
                            <asp:ListItem>Bulgaria</asp:ListItem>
                            <asp:ListItem>Burkina Faso</asp:ListItem>
                            <asp:ListItem>Burundi</asp:ListItem>
                            <asp:ListItem>Cambodia</asp:ListItem>
                            <asp:ListItem>Cameroon</asp:ListItem>
                            <asp:ListItem>Canada</asp:ListItem>
                            <asp:ListItem>Cape Verde</asp:ListItem>
                            <asp:ListItem>Cayman Islands</asp:ListItem>
                            <asp:ListItem>Chad</asp:ListItem>
                            <asp:ListItem>Chile</asp:ListItem>
                            <asp:ListItem>China</asp:ListItem>
                            <asp:ListItem>Colombia</asp:ListItem>
                            <asp:ListItem>Comoros</asp:ListItem>
                            <asp:ListItem>Congo - Brazzaville</asp:ListItem>
                            <asp:ListItem>Congo - Kinshasa</asp:ListItem>
                            <asp:ListItem>Cook Islands</asp:ListItem>
                            <asp:ListItem>Costa Rica</asp:ListItem>
                            <asp:ListItem>Côte d&#39;Ivoire</asp:ListItem>
                            <asp:ListItem>Croatia</asp:ListItem>
                            <asp:ListItem>Cuba</asp:ListItem>
                            <asp:ListItem>Cyprus</asp:ListItem>
                            <asp:ListItem>Czech Republic</asp:ListItem>
                            <asp:ListItem>Denmark</asp:ListItem>
                            <asp:ListItem>Djibouti</asp:ListItem>
                            <asp:ListItem>Dominica</asp:ListItem>
                            <asp:ListItem>Dominican Republic</asp:ListItem>
                            <asp:ListItem>East Timor</asp:ListItem>
                            <asp:ListItem>Ecuador</asp:ListItem>
                            <asp:ListItem>Egypt</asp:ListItem>
                            <asp:ListItem>El Salvador</asp:ListItem> 
                            <asp:ListItem>Equatorial Guinea</asp:ListItem>
                            <asp:ListItem>Eritrea</asp:ListItem>
                            <asp:ListItem>Estonia</asp:ListItem>
                            <asp:ListItem>Ethiopia</asp:ListItem>
                            <asp:ListItem>Falkland Islands (Malvinas)</asp:ListItem>
                            <asp:ListItem>Faroe Islands</asp:ListItem>
                            <asp:ListItem>Fiji</asp:ListItem>
                            <asp:ListItem>Finland</asp:ListItem>
                            <asp:ListItem>France</asp:ListItem>
                            <asp:ListItem>French Guiana</asp:ListItem>
                            <asp:ListItem>French Polynesia</asp:ListItem>
                            <asp:ListItem>French Southern Territories</asp:ListItem>
                            <asp:ListItem>Gabon</asp:ListItem>
                            <asp:ListItem>Gambia</asp:ListItem>
                            <asp:ListItem>Georgia</asp:ListItem>
                            <asp:ListItem>Germany</asp:ListItem>
                            <asp:ListItem>Ghana</asp:ListItem>
                            <asp:ListItem>Gibraltar</asp:ListItem>
                            <asp:ListItem>Greece</asp:ListItem>
                            <asp:ListItem>Greenland</asp:ListItem>
                            <asp:ListItem>Grenada</asp:ListItem>
                            <asp:ListItem>Guadeloupe</asp:ListItem>
                            <asp:ListItem>Guam</asp:ListItem>
                            <asp:ListItem>Guatemala</asp:ListItem>
                            <asp:ListItem>Guinea</asp:ListItem>
                            <asp:ListItem>Guinea-Bissau</asp:ListItem>
                            <asp:ListItem>Guyana</asp:ListItem>
                            <asp:ListItem>Haiti</asp:ListItem>
                            <asp:ListItem>Heard And Mc Donald Islands</asp:ListItem>
                            <asp:ListItem>Holy See (Vatican City State)</asp:ListItem>
                            <asp:ListItem>Honduras</asp:ListItem>
                            <asp:ListItem>Hong Kong</asp:ListItem>
                            <asp:ListItem>Hungary</asp:ListItem>
                            <asp:ListItem>Icel And</asp:ListItem>
                            <asp:ListItem>India</asp:ListItem>
                            <asp:ListItem>Indonesia</asp:ListItem>
                            <asp:ListItem>Iran (Islamic Republic Of)</asp:ListItem>
                            <asp:ListItem>Iraq</asp:ListItem>
                            <asp:ListItem>Ireland</asp:ListItem>
                            <asp:ListItem>Israel</asp:ListItem>
                            <asp:ListItem>Italy</asp:ListItem>
                            <asp:ListItem>Jamaica</asp:ListItem>
                            <asp:ListItem>Japan</asp:ListItem>
                            <asp:ListItem>Jordan</asp:ListItem>
                            <asp:ListItem>Kazakhstan</asp:ListItem>
                            <asp:ListItem>Kenya</asp:ListItem>
                            <asp:ListItem>Kiribati</asp:ListItem>
                            <asp:ListItem>Korea, Dem People'S Republic</asp:ListItem>
                            <asp:ListItem>Kuwait</asp:ListItem>
                            <asp:ListItem>Kyrgyzstan</asp:ListItem>
                            <asp:ListItem>Lao People'S Dem Republic</asp:ListItem>
                            <asp:ListItem>Latvia</asp:ListItem>
                            <asp:ListItem>Lebanon</asp:ListItem>
                            <asp:ListItem>Lesotho</asp:ListItem>
                            <asp:ListItem>Liberia</asp:ListItem>
                            <asp:ListItem>Libyan Arab Jamahiriya</asp:ListItem>
                            <asp:ListItem>Liechtenstein</asp:ListItem>
                            <asp:ListItem>Lithuania</asp:ListItem>
                            <asp:ListItem>Luxembourg</asp:ListItem>
                            <asp:ListItem>Macau</asp:ListItem>
                            <asp:ListItem>Macedonia</asp:ListItem>
                            <asp:ListItem>Madagascar</asp:ListItem>
                            <asp:ListItem>Malawi</asp:ListItem>
                            <asp:ListItem>Malaysia</asp:ListItem>
                            <asp:ListItem>Maldives</asp:ListItem>
                            <asp:ListItem>Mali</asp:ListItem>
                            <asp:ListItem>Malta</asp:ListItem>
                            <asp:ListItem>Marshall Islands</asp:ListItem>
                            <asp:ListItem>Martinique</asp:ListItem>
                            <asp:ListItem>Mauritania</asp:ListItem>
                            <asp:ListItem>Mauritius</asp:ListItem>
                            <asp:ListItem>Mayotte</asp:ListItem>
                            <asp:ListItem>Mexico</asp:ListItem>
                            <asp:ListItem>Micronesia, Federated States</asp:ListItem>
                            <asp:ListItem>Moldova, Republic Of</asp:ListItem>
                            <asp:ListItem>Monaco</asp:ListItem>
                            <asp:ListItem>Mongolia</asp:ListItem>
                            <asp:ListItem>Montserrat</asp:ListItem>
                            <asp:ListItem>Morocco</asp:ListItem>
                            <asp:ListItem>Mozambique</asp:ListItem>
                            <asp:ListItem>Myanmar</asp:ListItem>
                            <asp:ListItem>Namibia</asp:ListItem>
                            <asp:ListItem>Nauru</asp:ListItem>
                            <asp:ListItem>Nepal</asp:ListItem>
                            <asp:ListItem>Netherlands</asp:ListItem>
                            <asp:ListItem>Netherlands Ant Illes</asp:ListItem>
                            <asp:ListItem>New Caledonia</asp:ListItem>
                            <asp:ListItem>New Zealand</asp:ListItem>
                            <asp:ListItem>Nicaragua</asp:ListItem>
                            <asp:ListItem>Niger</asp:ListItem>
                            <asp:ListItem>Nigeria</asp:ListItem>
                            <asp:ListItem>Niue</asp:ListItem>
                            <asp:ListItem>Norfolk Island</asp:ListItem>
                            <asp:ListItem>Northern Mariana Islands</asp:ListItem>
                            <asp:ListItem>Norway</asp:ListItem>
                            <asp:ListItem>Oman</asp:ListItem>
                            <asp:ListItem>Pakistan</asp:ListItem>
                            <asp:ListItem>Palau</asp:ListItem>
                            <asp:ListItem>Panama</asp:ListItem>
                            <asp:ListItem>Papua New Guinea</asp:ListItem>
                            <asp:ListItem>Paraguay</asp:ListItem>
                            <asp:ListItem>Peru</asp:ListItem>
                            <asp:ListItem>Philippines</asp:ListItem>
                            <asp:ListItem>Pitcairn</asp:ListItem>
                            <asp:ListItem>Poland</asp:ListItem>
                            <asp:ListItem>Portugal</asp:ListItem>
                            <asp:ListItem>Puerto Rico</asp:ListItem>
                            <asp:ListItem>Qatar</asp:ListItem>
                            <asp:ListItem>Reunion</asp:ListItem>
                            <asp:ListItem>Romania</asp:ListItem>
                            <asp:ListItem>Russian Federation</asp:ListItem>
                            <asp:ListItem>Rwanda</asp:ListItem>
                            <asp:ListItem>Saint K Itts And Nevis</asp:ListItem>
                            <asp:ListItem>Saint Lucia</asp:ListItem>
                            <asp:ListItem>Saint Vincent, The Grenadines</asp:ListItem>
                            <asp:ListItem>Samoa</asp:ListItem>
                            <asp:ListItem>San Marino</asp:ListItem>
                            <asp:ListItem>Sao Tome And Principe</asp:ListItem>
                            <asp:ListItem>Saudi Arabia</asp:ListItem>
                            <asp:ListItem>Senegal</asp:ListItem>
                            <asp:ListItem>Seychelles</asp:ListItem>
                            <asp:ListItem>Sierra Leone</asp:ListItem>
                            <asp:ListItem Selected="True">Singapore</asp:ListItem>
                            <asp:ListItem>Slovakia (Slovak Republic)</asp:ListItem>
                            <asp:ListItem>Slovenia</asp:ListItem>
                            <asp:ListItem>Solomon Islands</asp:ListItem>
                            <asp:ListItem>Somalia</asp:ListItem>
                            <asp:ListItem>South Africa</asp:ListItem>
                            <asp:ListItem>South Georgia , S Sandwich Is.</asp:ListItem>
                            <asp:ListItem>Spain</asp:ListItem>
                            <asp:ListItem>Sri Lanka</asp:ListItem>
                            <asp:ListItem>St. Helena</asp:ListItem>
                            <asp:ListItem>St. Pierre And Miquelon</asp:ListItem>
                            <asp:ListItem>Sudan</asp:ListItem>
                            <asp:ListItem>Suriname</asp:ListItem>
                            <asp:ListItem>Svalbard, Jan Mayen Islands</asp:ListItem>
                            <asp:ListItem>Sw Aziland</asp:ListItem>
                            <asp:ListItem>Sweden</asp:ListItem>
                            <asp:ListItem>Switzerland</asp:ListItem>
                            <asp:ListItem>Syrian Arab Republic</asp:ListItem>
                            <asp:ListItem>Taiwan</asp:ListItem>
                            <asp:ListItem>Tajikistan</asp:ListItem>
                            <asp:ListItem>Tanzania, United Republic Of</asp:ListItem>
                            <asp:ListItem>Thailand</asp:ListItem>
                            <asp:ListItem>Togo</asp:ListItem>
                            <asp:ListItem>Tokelau</asp:ListItem>
                            <asp:ListItem>Tonga</asp:ListItem>
                            <asp:ListItem>Trinidad And Tobago</asp:ListItem>
                            <asp:ListItem>Tunisia</asp:ListItem>
                            <asp:ListItem>Turkey</asp:ListItem>
                            <asp:ListItem>Turkmenistan</asp:ListItem>
                            <asp:ListItem>Turks And Caicos Islands</asp:ListItem>
                            <asp:ListItem>Tuvalu</asp:ListItem>
                            <asp:ListItem>Uganda</asp:ListItem>
                            <asp:ListItem>Ukraine</asp:ListItem>
                            <asp:ListItem>United Arab Emirates</asp:ListItem>
                            <asp:ListItem>United Kingdom</asp:ListItem>
                            <asp:ListItem>United States</asp:ListItem>
                            <asp:ListItem>United States Minor Is.</asp:ListItem>
                            <asp:ListItem>Uruguay</asp:ListItem>
                            <asp:ListItem>Uzbekistan</asp:ListItem>
                            <asp:ListItem>Vanuatu</asp:ListItem>
                            <asp:ListItem>Venezuela</asp:ListItem>
                            <asp:ListItem>Viet Nam</asp:ListItem>
                            <asp:ListItem>Virgin Islands (British)</asp:ListItem>
                            <asp:ListItem>Virgin Islands (U.S.)</asp:ListItem>
                            <asp:ListItem>Wallis And Futuna Islands</asp:ListItem>
                            <asp:ListItem>Western Sahara</asp:ListItem>
                            <asp:ListItem>Yemen</asp:ListItem>
                            <asp:ListItem>Yugoslavia</asp:ListItem>
                            <asp:ListItem>Zaire</asp:ListItem>
                            <asp:ListItem>Zambia</asp:ListItem>
                            <asp:ListItem>Zimbabwe</asp:ListItem>
                        </asp:DropDownList>
                        <div style="border-left:72px solid transparent;display:inline"></div>
                        <div style="display:inline">
                        </div>
                    </div>

                    <div style="height:7px;"></div>

                    <div id="CardTypeContainer">
                        <div class="defaultLabel">
                            <label>Card Type: &nbsp;</label>
                        </div>
                        <asp:DropDownList ID="ddl_CardType" CssClass="ddl_CardType" font-size="11" runat="server">
                            <asp:ListItem>MasterCard</asp:ListItem>
                            <asp:ListItem>Visa</asp:ListItem>
                            <asp:ListItem>American Express</asp:ListItem>
                            <asp:ListItem>Discover</asp:ListItem>
                        </asp:DropDownList>
                        <div style="border-left:88px solid transparent;display:inline"></div>
                        <div style="display:inline">
                            <asp:Image ID="img_MasterCard" CssClass="cardImage" runat="server" ImageUrl="~/CSS and Images/Images and fonts/MasterCard.jpg" />
                            <asp:Image ID="img_Visa" CssClass="cardImage" runat="server" ImageUrl="~/CSS and Images/Images and fonts/VisaCard.png" />
                            <asp:Image ID="img_AmericanExpress" CssClass="cardImage" runat="server" ImageUrl="~/CSS and Images/Images and fonts/American Express.jpg" />
                            <asp:Image ID="img_Discover" CssClass="cardImage" runat="server" ImageUrl="~/CSS and Images/Images and fonts/Discover.jpg" />
                        </div>
                    </div>

                    <div style="height:7px;"></div>

                    <div id="CardNumberContainer">
                        <div class="defaultLabel">
                            <label>Card Number: &nbsp;</label>
                        </div>
                        <asp:TextBox ID="tb_CardNumber" runat="server" CssClass="tb_CardNumber" Font-Size="11" Placeholder="XXXX-XXXX-XXXX-XXXX"></asp:TextBox>
                        <div style="border-left:111px solid transparent;display:inline"></div>
                        <div style="display:inline">
                            <asp:RegularExpressionValidator ID="rev_CardNumber" runat="server" ErrorMessage="Invalid Card Number" ControlToValidate="tb_CardNumber" ForeColor="Red" ValidationExpression="^[3456]\d{3}\-\d{4}\-\d{4}\-\d{3,4}$" Display="Dynamic" Font-Names="Arial" ValidationGroup="AddCard"></asp:RegularExpressionValidator>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Required" ControlToValidate="tb_CardNumber" ForeColor="Red" Display="Dynamic" Font-Names="Arial" ValidationGroup="AddCard"></asp:RequiredFieldValidator>
                        </div>
                    </div>

                    <div style="height:7px;"></div>

                    <div id="ExpiresContainer">
                        <div class="defaultLabel">
                            <label>Expires: &nbsp;</label>
                        </div>
                        <asp:TextBox ID="tb_Expires" runat="server" CssClass="tb_Expires" Font-Size="11" PlaceHolder="MM/YY"></asp:TextBox>
                        <div style="border-left:70px solid transparent;display:inline"></div>
                        <div style="display:inline">
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="Invalid Format" ControlToValidate="tb_Expires" ForeColor="Red" ValidationExpression="^[0-9][0-9]\/[0-9][0-9]$" Display="Dynamic" Font-Names="Arial" ValidationGroup="AddCard"></asp:RegularExpressionValidator>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Required" ControlToValidate="tb_Expires" ForeColor="Red" Display="Dynamic" Font-Names="Arial" ValidationGroup="AddCard"></asp:RequiredFieldValidator>
                        </div>
                    </div>

                    <div style="height:7px;"></div>

                    <div id="FNameContainer">
                        <div class="defaultLabel">
                            <label>First Name: &nbsp;</label>
                        </div>
                        <asp:TextBox ID="tb_FName" runat="server" CssClass="tb_FName" Font-Size="11"></asp:TextBox>
                        <div style="border-left:94px solid transparent;display:inline"></div>
                        <div style="display:inline">
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Too Long" ControlToValidate="tb_FName" ForeColor="Red" ValidationExpression="^.{1,20}$" Display="Dynamic" Font-Names="Arial" ValidationGroup="AddCard"></asp:RegularExpressionValidator>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Required" ControlToValidate="tb_FName" ForeColor="Red" Display="Dynamic" Font-Names="Arial" ValidationGroup="AddCard"></asp:RequiredFieldValidator>
                        </div>
                    </div>

                    <div style="height:7px;"></div>

                    <div id="LNameContainer">
                        <div class="defaultLabel">
                            <label>Last Name: &nbsp;</label>
                        </div>
                        <asp:TextBox ID="tb_LName" runat="server" CssClass="tb_LName" Font-Size="11"></asp:TextBox>
                        <div style="border-left:93px solid transparent;display:inline"></div>
                        <div style="display:inline">
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ErrorMessage="Too Long" ControlToValidate="tb_LName" ForeColor="Red" ValidationExpression="^.{1,20}$" Display="Dynamic" Font-Names="Arial" ValidationGroup="AddCard"></asp:RegularExpressionValidator>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Required" ControlToValidate="tb_LName" ForeColor="Red" Display="Dynamic" Font-Names="Arial" ValidationGroup="AddCard"></asp:RequiredFieldValidator>
                        </div>
                    </div>

                    <div style="height:15px;"></div>

                    <div id="AddCardBtnContainer">
                        <div id="AddCardBtnContainer2">
                            <asp:Button ID="btn_AddCard" CssClass="btn_AddCard" runat="server" Text="Add Card" OnClick="btn_AddCard_Click" ValidationGroup="AddCard"/>
                            <div id="btnSpace"></div>
                            <asp:Button ID="btn_Back" CssClass="btn_Back" runat="server" Text="Back" OnClick="btn_Back_Click" />
                        </div>
                    </div>

                    <div style="height:323px;">
                    </div>
                </div>

            </div>

        </div>
        <div style="height:50px;">
        </div>

    </div>
</asp:Content>

