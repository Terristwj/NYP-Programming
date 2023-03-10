<%@ Page Title="Cart" Language="C#" MasterPageFile="~/MasterStore.master" AutoEventWireup="true" CodeFile="StoreCart.aspx.cs" Inherits="StoreCart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head2" Runat="Server">
    <script>
        function getPageNum2() {
            return 4;
        }


        function checkOut1() {
            var x = document.getElementById("myForm");
            var y = document.getElementById("myFormContainer")
            if (x.style.display == "block")
                y.style.animation = "animateTop-Back 1.2s";
            else
                x.style.display = "block";
        }

        function checkOut2() {
            var x = document.getElementById("myForm");
            var y = document.getElementById("myFormContainer")

            x.style.display = "none";
            y.style.animation = "animateTop 0.9s";
        }
    </script>
    <style>
        #extraDiv{
            border:1px transparent solid;
        }

        .StoreContentContainerSpace{
            flex:0;
        }

        .content{
            min-height:820px;
            height:auto;
        }

        .topHeader{
            width:652px;
            margin:auto;
            margin-top:-10px;
            margin-bottom:25px;
        }

        .resetContainer{
            font-family:Arial;
            font-size:16px;
            height:30px;
        }

        .resetContainer2{
            float:right;
        }

        .btn_Reset{
            font-size:15px;
            cursor:pointer;
            height:35px;
            padding-left:8px;
            padding-right:8px;
            border:1px solid grey;
            background:white;
        }

        .btn_Reset:hover{
            background:rgb(255, 235, 238);
        }

        .GV_container{
            width:650px;
            margin:auto;
            border:1px solid black;
            overflow-y:scroll;
            max-height:344px;
        }

        .gv_Header{
            height:43.5px;
        }

        .gv_Products{
            width:100%;
            font-family:Arial;
            font-size:16px;
        }

        .column{
            text-align:center;
            font-family:Arial;
            font-size:14px;
        }

        .linkContainer{
            height:30px;
            width:130px;
            margin:auto;
        }

        .gv_Product_Column_Container{
            height:51px;
        }

        .gv_Image_Container{
            border:1px solid black;
            height:50px;
            width:50px;
            float:left;
            margin-left:8px;
        }

        .gv_Image{
            height:100%;
            width:100%;
        }

        .gv_Name_Container{
            float:left;
            margin-top:17px;
            margin-left:8px;
        }

        .tb_Qty{
            width:40px;
            text-align:center;
            height:20px;
        }

        .link{
            font-family:Arial;
            font-size:14px;
            padding-top:5px;
            padding-bottom:5px;
            text-align:center;
            width:60px;
            float:left;
            cursor:pointer;
            border:1px solid black;
            background:white;
        }

        .link2{
            font-family:Arial;
            font-size:14px;
            padding-top:5px;
            padding-bottom:5px;
            text-align:center;
            width:60px;
            float:left;
            cursor:pointer;
            border:1px solid black;
            background:white;
            margin-left:10px;
        }

        .link:hover{
            background: rgb(255, 238, 243);
        }

        .link2:hover{
            background: rgb(255, 238, 243);
        }

        .bottomContent{
            width:652px;
            margin:auto;
            margin-top:20px;
            margin-bottom:25px;
            display:flex;
        }

        .walletContainer{
            flex:1;
        }

        .totalContainer{
            flex:1;
        }

        .title{
            border-bottom:1px solid black;
            text-align:center;
            padding-top:10px;
            padding-bottom:10px;
            background:#fd90be;
            color:white;
        }

        .titleFont{
            font-family:Arial;
            font-size:20px;
        }

        .walletContainer2{
            border:1px solid black;
            width:150px;
            height:180px;
            margin:auto;
            background:#fee7f1;
        }

        .walletContainer3{
            position:relative;
            height:135px;
        }

        .walletContainer4{
            height:102px;
            text-align:center;
            padding-top:32px;
        }

        .lb_Wallet{
            font-family:Arial;
            font-size:22px;
        }

        .cbContainer{
            border-top:1px solid grey;
            background:#fd90be;
            color:white;
            width:100%;
            position:absolute;
            bottom:0;
            text-align:center;
            padding-top:5px;
            padding-bottom:5px;
            height:20px;
            margin-bottom:-1px;
        }

        .cb_UseWallet{
            font-family:Arial;
            font-size:16px;
        }

        .totalContainer2{
            border:1px solid black;
            width:150px;
            height:180px;
            margin:auto;
            background:#fee7f1;
        }

        .totalContainer3{
            position:relative;
            height:135px;
        }

        .totalContainer4{
            height:102px;
            text-align:center;
            padding-top:32px;
        }

        .lb_Price{
            font-family:Arial;
            font-size:22px;
        }

       .bottomContainer{
            width:652px;
            margin:auto;
            margin-top:20px;
            margin-bottom:25px;
       }

       .checkOutContainer{
           width:93.5px;
           margin:auto;
       }

       .btn_CheckOut{
           font-family:Arial;
           font-size:16px;
           padding-top:8px;
           padding-bottom:8px;
           padding-left:8px;
           padding-right:8px;
           border:1px solid black;
           background:white;
           cursor:pointer;
       }

       .btn_CheckOut:hover{
           background: rgb(255, 238, 243);
       }

        @media(min-width:1200px){
            .topHeader{
                width:80.1%;
                max-width:1000px;
            }

            .GV_container{
                width:80%;
                max-width:1000px;
            }

            .bottomContent{
                width:80%;
                max-width:1000px;
            }

            .bottomContainer{
                width:80%;
                max-width:1000px;
            }
        }

        


        #myForm{
            display:none;
            position:fixed;
            width:100%;
            height:100%;
            top:0;
        }

        #myFormBackground{
            background: rgba(0,0,0,0.15);
            position:fixed;
            width:100%;
            height:100%;
            top:0;
        }

        #myFormContainer{
            position:fixed;
            width:80%;
            left:10%;
            top:25%;
            animation-name: animateTop;
			animation-duration: 0.7s;
        }

        #myFormContainer2{
            background:white;
            width:70%;
            left:15%;
            position:fixed;
			box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2),0 6px 20px 0 rgba(0,0,0,0.19);
        }

        #myForm-Content{
            padding-top:20px;
            padding-bottom:20px;
        }

        #myForm-Content2{
            border:1px solid black;
            width:350px;
            margin:auto;
            padding-top:20px;
            padding-bottom:20px;
        }

        #myForm-Table{
            font-family:'Arial';
            margin:auto;
        }

        .myForm-TableRow{
            height:50px;
        }

        @keyframes animateTop {
			from {top:-300px; opacity:0}
			to {top:25%; opacity:1}
		}

        @keyframes animateTop-Back {
			from {top:25%; opacity:1}
			to {top:-900px; opacity:0}
		}

        #myForm-Header{
            height:75px;
            background:#595959;
            padding-top:1px;
            padding-left:15px;
            text-align:center;
        }

        .checkOutTBContainer{
            height:40px;
            padding-top:20px;
        }

        #CheckOutBtnContainer{
            width:70px;
            margin:auto;
        }

        .checkOutBtn{
            font-size:16px;
            margin-left:-5px;
            padding-top:5px;
            padding-bottom:5px;
            cursor:pointer;
        }


        @media(min-width: 1250px) {
            #myFormContainer{
                position:fixed;
                width:80%;
                left:10%;
                top:15%;
                animation-name: animateTop;
			    animation-duration: 0.7s;
            }

            @keyframes animateTop {
			    from {top:-300px; opacity:0}
			    to {top:15%; opacity:1}
		    }

            @keyframes animateTop-Back {
			    from {top:15%; opacity:1}
			    to {top:-900px; opacity:0}
		    }
            

            #myForm-Content{
                padding-top:70px;
                padding-bottom:100px;
            }
        }

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <div id="extraDiv">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <div class="topHeader">
                    <div class="resetContainer">
                        <div class="resetContainer2">   
                            <asp:Button ID="btn_Reset" CssClass="btn_Reset" runat="server" Text="Reset Cart" OnClick="btn_Reset_Click" />
                        </div>
                    </div>
                </div>
                <div class="GV_container">
                    <asp:GridView ID="gv_Products" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" CssClass="gv_Products" OnRowCommand="gv_Products_RowCommand">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:TemplateField HeaderText="Product">
                                <ItemTemplate>
                                    <div class="gv_Product_Column_Container">
                                    <div class="gv_Image_Container">
                                        <asp:Image ID="Image1" runat="server" ImageUrl=<%# "~/CSS and Images/ProductsImages/" + Eval("Product_ID") + "/" + Eval("ImageUrl")%> CssClass="gv_Image" />
                                    </div>
                                    <div class="gv_Name_Container">
                                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("Name") %>'></asp:Label>
                                    </div>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField HeaderText="Unit Price" DataField="Unit_Price" DataFormatString="{0:c}" ItemStyle-CssClass="column" >
                                <ItemStyle CssClass="column"></ItemStyle>
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="Quantity">
                                <ItemTemplate>
                                    <asp:TextBox ID="tb_Qty" CssClass="tb_Qty" runat="server" Text='<%# Eval("Quantity") %>'></asp:TextBox>
                                </ItemTemplate>
                                <ItemStyle CssClass="column" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Price">
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# "$"+(Convert.ToDouble(Eval("Unit_Price")) * Convert.ToDouble(Eval("Quantity"))).ToString(".00") %>'></asp:Label>
                                </ItemTemplate>
                                <ItemStyle CssClass="column" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Controls" ItemStyle-CssClass="column" >
                                <ItemTemplate>
                                    <div class="linkContainer">
                                        <asp:Button ID="btn_Update" CssClass="link" runat="server" Text="Update" CommandName="Update" CommandArgument='<%# Eval("userID_ProductID") + ";" + ((GridViewRow) Container).RowIndex%>' />
                                        <asp:Button ID="btn_Delete" CssClass="link2" runat="server" Text="Delete" CommandName="Delete" CommandArgument='<%# Eval("userID_ProductID") %>' />
                                    </div>
                                </ItemTemplate>
                                <ItemStyle CssClass="column"></ItemStyle>
                            </asp:TemplateField>
                        </Columns>
                        <EditRowStyle BackColor="#2461BF" />
                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#ff80bf" Font-Bold="True" ForeColor="White" CssClass="gv_Header" />
                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#ffe6f2" />
                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                        <SortedAscendingCellStyle BackColor="#F5F7FB" />
                        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                        <SortedDescendingCellStyle BackColor="#E9EBEF" />
                        <SortedDescendingHeaderStyle BackColor="#4870BE" />
                    </asp:GridView>
                </div>
                <div class="bottomContent">
                    <div class="walletContainer">
                        <div class="walletContainer2">   
                            <div class="title">
                                <label class="titleFont">E-Wallet</label>
                            </div>
                            <div class="walletContainer3">
                                <div class="walletContainer4">
                                    <asp:Label ID="lb_Wallet" CssClass="lb_Wallet" runat="server" Text="$100.00"></asp:Label>
                                </div>
                                <div class="cbContainer">
                                    <asp:CheckBox ID="cb_UseWallet" CssClass="cb_UseWallet" runat="server" Text="Use E-Wallet" />
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="totalContainer">
                        <div class="totalContainer2"> 
                            <div class="title">
                                <label class="titleFont">Total Price</label>
                            </div>  
                            <div class="totalContainer3">
                                <div class="totalContainer4">
                                    <asp:Label ID="lb_Price" CssClass="lb_Price" runat="server" Text="$100.00"></asp:Label>
                                </div>
                                <div class="cbContainer">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>

        
        <div class="bottomContainer">
            <div class="checkOutContainer">
                <input class="btn_CheckOut" type="button" value="Check Out" onclick="checkOut1()"/>
            </div>
        </div>

        <div id="myForm">
            <div id="myFormBackground" onclick="checkOut1(), setTimeout(checkOut2, 600);">
            </div>
            <div id="myFormContainer">
                <div id="myFormContainer2">
                    <div id="myForm-Header">
                        <h1 style="color:white;">Check Out</h1>
                    </div>
                    <div id="myForm-Content">
                        <div id="myForm-Content2">
                            <table id="myForm-Table">
                                <tr class="myForm-TableRow">
                                    <td>Username:</td>
                                    <td>
                                        <div class="checkOutTBContainer">
                                            <asp:TextBox ID="tb_CheckOutUsername" runat="server"></asp:TextBox>
                                            <br />
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Required" ControlToValidate="tb_CheckOutUsername" ValidationGroup="CheckOut" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                                        </div>
                                    </td>
                                </tr>
                                <tr class="myForm-TableRow">
                                    <td>Password:</td>
                                    <td>
                                        <div class="checkOutTBContainer">
                                            <asp:TextBox ID="tb_CheckOutPassword" runat="server" TextMode="Password"></asp:TextBox>
                                            <br />
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Required" ControlToValidate="tb_CheckOutPassword" ValidationGroup="CheckOut" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                                        </div>
                                    </td>
                                </tr>
                                <tr class="myForm-TableRow">
                                    <td colspan="2">
                                        <div id="CheckOutBtnContainer">
                                            <asp:Button ID="btn_CheckingOut" CssClass="checkOutBtn" runat="server" Text="Check Out" ValidationGroup="CheckOut" OnClick="btn_CheckOut_Click" />
                                        </div>
                                    </td>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

