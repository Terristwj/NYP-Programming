<%@ Page Title="Edit Product" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="EditProduct.aspx.cs" Inherits="EditProduct" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script>
        function getPageNum() {
            return 3;
        }
    </script>
    <style>
        #extraDiv{
            border:1px transparent solid;
            padding-top:20px;
        }

        #ContentHeaderTop1{
            font-family:Arial;
            font-size:18px;
            height:30px;
            min-width:470px;
            width: 78%;
            margin:auto;
        }

        .tb_StaffName{
            width:120px;
            text-align:center;
            font-size:16px;
            font-family:Arial;
            cursor:default;
        }

        .tb_CreatedDate{
            width:120px;
            text-align:center;
            font-size:16px;
            font-family:Arial;
            cursor:default;
        }

        #ContentHeaderTop2{
            font-family:Arial;
            font-size:18px;
            height:30px;
            min-width:470px;
            width: 78%;
            margin:auto;
        }

        .tb_ProductID{
            width:50px;
            text-align:center;
            font-size:18px;
            font-family:Arial;
            text-align:center;
            cursor:default;
        }

        .ddl_Category{
            font-size:17px;
            font-family:Arial;
            cursor:pointer;
        }

        .ddl_Category:focus{
            outline-color: deeppink;
        }

        #TableContainer{
            width:80%;
            margin:auto;
            margin-top:10px;
        }

        .auto-style1 {
            height: 10px;
            width: 100%;
        }

        .img_Product{
            border:1px solid black;
            width:100%;
            height:100%;
        }

        #img_Product_Container{
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
            margin-top:0px;
        }

        .validator2{
            font-family:Arial;
            margin-top:-30px;
            height:20px;
        }

        .tb_name{
            font-size:18px;
            font-family:Arial;
            text-align:center;
            resize:none;
            width:240px;
        }

        .tb_name:focus{
            outline-color:deeppink;
        }

        .stockContainer{
            border:1px solid transparent;
            width:250px;
            margin:auto;
            height:30px;
            padding-top:10px;
        }

        .stockContainer1{
            padding-top:2px;
            font-family:Arial;
            font-size:18px;
            float:left;
        }
        
        .quantityContainer{
            font-family:Arial;
            font-size:18px;
            float:right;
        }

        .tb_Stock{
            height:22px;
            width:50px;
            font-size:15px;
        }

        .tb_Qty{
            height:20px;
            width:28px;
            font-size:15px;
            padding-left:5px;
            cursor:not-allowed;
        }

        .addContainer{
            width:250px;
            margin:auto;
            margin-top:23px;
            height:35px;
            padding-top:5px;
        }

        .addContainer1{
            font-family:Arial;
            font-size:18px;
            float:left;
        }

        .tb_Price{
            height:22px;
            width:70px;
            font-size:15px;
        }

        .validator3{
            font-family:Arial;
            margin-top:-6px;
            height:20px;
        }

        .descriptionContainer{
            position:relative;  /*NEVER REMOVE THIS*/
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
            background:none;
            border:1px solid black;
        }

        .btnLabels1{
            cursor:not-allowed;
            float:right;
            margin-top:-4px;
        }

        .btnLabels2{
            cursor:pointer;
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

        .textbox{
            text-align:center;
            border:1px solid grey;
            font-size:18px;
            margin-top:-6px;
            font-family:Arial;
        }

        .textbox:focus{
            outline-color: deeppink;
        }

        .tb_label{
            position:absolute;  /*NEVER REMOVE THIS*/
            top:0;              /*NEVER REMOVE THIS*/
            left:0;             /*NEVER REMOVE THIS*/
            padding-top:5px;
            resize:none;
            width:98%;
            min-height:65px;
            text-align:center;
        }

        .tb_label:focus{
            outline-color: deeppink;
        }

        .contentFooter{
             width:78.9%;
             margin:auto;
             margin-top:20px;
             height:40px;
        }

        .fu_ProductImg{
            cursor:pointer;
        }

        .fu_ProductImg:focus{
            outline-color: deeppink;
        }

        @media(min-width:720px){
            #ContentHeaderTop1{
                margin-top:5px;
                width:590px;
            }

            #ContentHeaderTop2{
                margin-top:5px;
                width:590px;
            }

            #TableContainer{
                width:600px;
                margin:auto;
                margin-top:20px;
            }

            #img_Product_Container{
                width:250px;
                height:250px;
            }

            .tb_label{
                min-height:95px;
            }

            .contentFooter{
                width:594px;
            }
        }

        @media(min-width:900px){
            #ContentHeaderTop1{
                width:690px;
                margin-top:10px;
            }

            #ContentHeaderTop2{
                width:690px;
                margin-top:10px;
            }

            #TableContainer{
                width:750px;
                margin:auto;
                margin-top:20px;
            }
            
            #img_Product_Container{
                width:305px;
                height:305px;
            }

            #productContentContainer{
                width:300px;
            }

            .tb_label{
                min-height:152px;
            }

            .contentFooter{
                width:743px;
            }
        }

        @media(min-width:1200px){
            #ContentHeaderTop1{
                width:740px;
                margin-top:15px;
            }

            .staffContainer{
                margin-left:-25px;
            }

            #ContentHeaderTop2{
                width:740px;
                margin-top:15px;
            }

            #TableContainer{
                width:950px;
                margin:auto;
                margin-top:20px;
            }

            #img_Product_Container{
                width:335px;
                height:335px;
            }

            #productContentContainer{
                width:450px;
            }

            .tb_label{
                min-height:180px;
            }

            .contentFooter{
                width:937px;
            }
        }

        .validator{
            margin-top:-5px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="extraDiv">
        <div id="ContentHeaderTop1">
            <div class="staffContainer" style="float:left">
                <label>Created By: </label>
                <asp:TextBox ID="tb_StaffName" CssClass="tb_StaffName" runat="server" ReadOnly="True"></asp:TextBox>
            </div>
            <div style="float:right">
                <label>Date Created: </label>
                <asp:TextBox ID="tb_DateCreated" CssClass="tb_CreatedDate" runat="server" ReadOnly="True"></asp:TextBox>
            </div>
        </div>
        </div>
        <div id="ContentHeaderTop2">
            <div style="float:left">
                <label>Product ID: </label>
                <asp:TextBox ID="tb_ProductID" CssClass="tb_ProductID" runat="server" ReadOnly="True"></asp:TextBox>
            </div>
            <div style="float:right">
                <label>Category: </label>
                <asp:DropDownList ID="ddl_Category" CssClass="ddl_Category" runat="server">
                    <asp:ListItem >Products</asp:ListItem>
                    <asp:ListItem>Food</asp:ListItem>
                    <asp:ListItem>Medicine</asp:ListItem>
                    <asp:ListItem>Sponsor Products</asp:ListItem>
                </asp:DropDownList>
            </div>
        </div>
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
                                <div class="validator2">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Required" ControlToValidate="tb_Name" Font-Size="14px" Display="Dynamic" ForeColor="Red" ValidationGroup="Update"></asp:RequiredFieldValidator>
                                </div>
                                <asp:TextBox ID="tb_Name" CssClass="tb_name" runat="server" Text="name" TextMode="MultiLine"></asp:TextBox>
                            </div>
                            <div class="stockContainer" style="text-align:center;margin-bottom:-15px;">
                                <div class="stockContainer1">
                                    <label>Stock: </label>
                                    <asp:TextBox ID="tb_Stock" CssClass="textbox tb_Stock" runat="server" Text="50"></asp:TextBox>
                                    <div class="validator">
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Invalid Stock" ControlToValidate="tb_Stock" ValidationExpression="[0-9]+" Font-Size="14px" Display="Dynamic" ForeColor="Red" ValidationGroup="Update"></asp:RegularExpressionValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Required" ControlToValidate="tb_Stock" Font-Size="14px" Display="Dynamic" ForeColor="Red" ValidationGroup="Update"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                                <div class="quantityContainer">
                                    <label>Quantity:</label>
                                    <asp:TextBox ID="tb_Qty" CssClass="tb_Qty" runat="server" Enabled="False"></asp:TextBox>
                                </div>
                            </div>
                            <div class="addContainer" style="text-align:center;">
                                <div class="addContainer1">
                                    <label>Price: $</label>
                                    <asp:TextBox ID="tb_Price" CssClass="textbox tb_Price" runat="server" Text="6.00" PlaceHolder="2 d.p."></asp:TextBox>
                                    <div class="validator3">
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Invalid Price (2 d.p.)" ControlToValidate="tb_Price" ValidationExpression="[0-9]+\.\d{2}" Font-Size="14px" Display="Dynamic" ForeColor="Red" ValidationGroup="Update"></asp:RegularExpressionValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Required" ControlToValidate="tb_Price" Font-Size="14px" Display="Dynamic" ForeColor="Red" ValidationGroup="Update"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                                <asp:Button ID="btn_Add" CssClass="btnLabels btnLabels1" runat="server" Text="Add Cart" ValidationGroup="AddCart" Enabled="False"/>
                            </div>
                            <div class="descriptionContainer">
                                <asp:TextBox ID="tb_Desc" CssClass="labels tb_label" runat="server" Text="Description:  This is a sample text for this sample item. This is a sample text for this sample item. This is a sample text for this sample item. " TextMode="MultiLine"></asp:TextBox>
                            </div>
                        </div>
                    </td>
                </tr>
            </table>
        </div>
        <div class="contentFooter">
            <div style="float:left">
                <asp:FileUpload ID="fu_ProductImg" CssClass="fu_ProductImg" runat="server" />
            </div>
            <div  style="float:right">
                <asp:Button ID="btn_Update" CssClass="btnLabels btnLabels2" runat="server" Text="Update" OnClick="btn_Update_Click" ValidationGroup="Update" />
                <asp:Button ID="btn_Cancel" CssClass="btnLabels btnLabels2" runat="server" Text="Cancel" OnClick="btn_Cancel_Click" />
            </div>
        </div>
    </div>
</asp:Content>

