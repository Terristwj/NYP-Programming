<%@ Page Title="Joining Room" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="DoctorJoiningRoom.aspx.cs" Inherits="DoctorJoiningRoom" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
     <script>
        function getPageNum() {
            return 1;
        }
    </script>
    <style>
        #extraDiv{
            border:1px solid transparent;
        }

        .cardPassword{
            border:1px solid black;
            width:500px;
            margin:auto;
            margin-top:40px;
        }

        .passwordContainer1{
            border-bottom:1px solid black;
            padding-top:10px;
            padding-bottom:10px;
            font-family:Arial;
            font-size:20px;
            text-align:center;
        }

        .passwordContainer2{
            padding-top:30px;
            padding-bottom:30px;
        }

        .passwordContainer3{
            width:270px;
            margin:auto;
            font-family:Arial;
            font-size:18px;
        }

        .tb_Password{
            height:19px;
            font-size:16px;
            padding-left:4px;
            width:150px;
        }

        .passwordContainer4{
            width:150px;
            margin:auto;
            margin-top:18px;
            font-family:Arial;
            font-size:18px;
            height:30px;
        }

        .btn_Join{
            border:1px solid black;
            background:white;
            padding-top:5px;
            padding-left:17px;
            padding-right:17px;
            padding-bottom:5px;
            font-family:Arial;
            font-size:16px;
            cursor:pointer;
            float:left;
        }

        .btn_Join:hover{
            background:rgb(255, 235, 238);
        }

        .btn_Cancel{
            border:1px solid black;
            background:white;
            padding-top:5px;
            padding-left:10px;
            padding-right:10px;
            padding-bottom:5px;
            font-family:Arial;
            font-size:16px;
            cursor:pointer;
            float:right;
        }

        .btn_Cancel:hover{
            background:rgb(255, 235, 238);
        }
        
        @media(min-width:1200px){
            .cardPassword{
                width:600px;
            }

            .passwordContainer1{
                padding-top:20px;
                padding-bottom:20px;
                font-size:22px;
            }

            .passwordContainer2{
                padding-top:40px;
                padding-bottom:40px;
            }

            .passwordContainer3{
                width:285px;
                font-size:20px;
            }

            .passwordContainer4{
                width:161px;
                margin-top:20px;
                height:32px;
            }
            
            .btn_Join{
                padding-top:6px;
                padding-left:18px;
                padding-right:18px;
                padding-bottom:6px;
            }

            .btn_Cancel{
                padding-top:6px;
                padding-left:14px;
                padding-right:14px;
                padding-bottom:6px;
            }
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="extraDiv">
        <div class="cardPassword">
            <div class="passwordContainer1">
                <label>Joining Room</label>
            </div>
            <div class="passwordContainer2">
                <div class="passwordContainer3">
                    <label>Password: </label>
                    <asp:TextBox ID="tb_Password" CssClass="tb_Password" runat="server"></asp:TextBox>
                </div>
                
                <div class="passwordContainer4">
                    <asp:Button ID="btn_Join" CssClass="btn_Join" runat="server" Text="Join" OnClick="btn_Join_Click" />
                    <asp:Button ID="btn_Cancel" CssClass="btn_Cancel" runat="server" Text="Cancel" OnClick="btn_Cancel_Click" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>

