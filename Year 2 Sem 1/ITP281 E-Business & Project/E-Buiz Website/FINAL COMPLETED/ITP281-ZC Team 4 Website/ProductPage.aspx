<%@ Page Title="Store" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ProductPage.aspx.cs" Inherits="ProductPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script>
        function getPageNum() {
            return 2;
        }
    </script>
    <style>
        #extraDiv{
            border:1px transparent solid;
            padding-top:20px;
        }

        #TableContainer{
            height:230px;
            width:80%;
            margin:auto;
        }

        .auto-style1 {
            height:100%;
            width: 100%;
        }

        .img_Product{
            width:100%;
            height:100%;
        }

        #img_Product_Container{
            border:1px solid black;
            width:220px;
            height:220px;
            margin:auto;
        }

        .imageSpace {
            width: 200px;
        }

        #productContentContainer{
            height:100%;
            float:right;
            width:250px;
        }

        .nameContainer{
            min-height:30px;
            text-align:center;
            border-bottom:1px solid grey;
            margin-bottom:10px;
        }

        .stockContainer{
            border:1px solid transparent;
            height:30px;
            padding-top:10px;
        }
        
        .quantityContainer{
            font-family:Arial;
            font-size:18px;
            display:inline;
            margin-left:15px;
        }

        .tb_Qty{
            height:20px;
            width:28px;
            font-size:15px;
            padding-left:5px;
        }

        .validator{
            margin-top:-5px;
            padding-left:105px;
        }

        .addContainer{
            border:1px solid transparent;
            margin-top:23px;
            height:35px;
            padding-top:5px;
        }

        .descriptionContainer{
            border:1px solid transparent;
            margin-top:2px;
        }

        .btnLabels{
            font-size:16px;
            font-family:Arial;
            padding-left:7px;
            padding-right:7px;
            padding-top:5px;
            padding-bottom:5px;
            cursor:pointer;
            background:none;
            border:1px solid black;
        }

        .btnLabels1{
            margin-left:33px;
        }

        .btnLabels2{
            padding-left:15px;
            padding-right:15px;
            padding-top:7px;
            padding-bottom:7px;
        }

        .btnLabels:hover{
            background:rgb(255, 235, 238);
        }

        .labels{
            font-size:18px;
            font-family:Arial;
        }

        .tb_label{
            padding-top:5px;
            border:none;
            background:none;
            resize:none;
            width:98%;
            min-height:70px;
            text-align:center;
        }

        .tb_label:focus{
            outline:none;
        }

        @media(min-width:720px){
            #TableContainer{
                width:600px;
                height:270px;
                margin:auto;
                margin-top:40px;
            }

            #img_Product_Container{
                width:250px;
                height:250px;
            }

            .tb_label{
                min-height:100px;
            }
        }

        @media(min-width:900px){
            #TableContainer{
                width:750px;
                height:340px;
                margin:auto;
                margin-top:40px;
            }
            
            #img_Product_Container{
                width:305px;
                height:305px;
            }

            #productContentContainer{
                width:300px;
            }

            .tb_label{
                min-height:165px;
            }
        }

        @media(min-width:1200px){
            #TableContainer{
                width:950px;
                height:400px;
                margin:auto;
                margin-top:40px;
            }

            #img_Product_Container{
                width:335px;
                height:335px;
            }

            #productContentContainer{
                width:450px;
            }

            .tb_label{
                min-height:200px;
            }
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="extraDiv">
        <div id="TableContainer">
            <table class="auto-style1">
                <tr>
                    <td class="imageSpace">
                        <div id="img_Product_Container">
                            <asp:Image ID="img_Product" CssClass="img_Product" runat="server" ImageUrl="~/CSS and Images/Images and fonts/American Express.jpg" />
                        </div>
                    </td>
                    <td>
                        <div id="productContentContainer">
                            <div class="nameContainer" >
                                <asp:Label ID="lb_Name" CssClass="labels" runat="server" Text="name"></asp:Label>
                            </div>
                            <div class="stockContainer" style="text-align:center;margin-bottom:-15px;">
                                <asp:Label ID="lb_Stock" CssClass="labels" runat="server" Text="stock"></asp:Label>
                                <div class="quantityContainer">
                                    <label>Quantity:</label>
                                    <asp:TextBox ID="tb_Qty" CssClass="tb_Qty" runat="server"></asp:TextBox>
                                    <div class="validator">
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Not valid quantity" ControlToValidate="tb_Qty" ValidationExpression="[0-9]+" Font-Size="14px" Display="Dynamic" ForeColor="Red" ValidationGroup="AddCart"></asp:RegularExpressionValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Required to add" ControlToValidate="tb_Qty" Font-Size="14px" Display="Dynamic" ForeColor="Red" ValidationGroup="AddCart"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                            </div>
                            <div class="addContainer" style="text-align:center;">
                                <asp:Label ID="lb_Price" CssClass="labels" runat="server" Text="price"></asp:Label>
                                <asp:Button ID="btn_Add" CssClass="btnLabels btnLabels1" runat="server" Text="Add Cart" OnClick="btn_Add_Click" ValidationGroup="AddCart"/>
                            </div>
                            <div class="descriptionContainer">
                                <asp:TextBox ID="tb_Desc" CssClass="labels tb_label" runat="server" Text="This is a sample text for this sample item. This is a sample text for this sample item. This is a sample text for this sample item. " ReadOnly="True" TextMode="MultiLine"></asp:TextBox>
                            </div>
                        </div>
                    </td>
                </tr>
            </table>
        </div>
        <div style="width:68px;margin:auto;margin-top:20px;">
            <asp:Button ID="btn_Back" CssClass="btnLabels btnLabels2" runat="server" Text="Back" OnClick="btn_Back_Click" />
        </div>
    </div>
</asp:Content>

