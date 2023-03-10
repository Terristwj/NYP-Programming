<%@ Page Title="Add Chat Room" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AddChatRoom.aspx.cs" Inherits="AddChatRoom" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script>
        function getPageNum() {
                return 3;
        }
    </script>
    <style>
        #extraDiv{
            border:1px solid transparent;
        }

        .containerContent{
            border:1px solid black;
            width:500px;
            margin:auto;
            margin-top:30px;
        }

        .titleContainer{
            width:500px;
            text-align:center;
            text-decoration:underline;
            margin:auto;
        }

        .creationContainer{
            width:500px;
            margin:auto;
        }

        .validator{
            font-size:12px;
            margin-top:0px;
            float:left;
        }

        .title2Container{
            font-family:Arial;
            font-size:20px;
            padding-top:7px;
            padding-left:7px;
            height:40px;
            width:325px;
            margin:auto;
        }

        .labelTitle2{
            margin-left:20px;
        }

        .tb_Title{
            height:20px;
            font-size:16px;
            padding-left:5px;
            margin-left:4.5px;
            width:210px;
        }

        .roomSizeContainer{
            font-family:Arial;
            font-size:20px;
            padding-top:7px;
            padding-left:7px;
            height:40px;
            width:325px;
            margin:auto;
        }

        .labelRoomSize{
            margin-left:20px;
        }

        .ddl_Position{
            height:27px;
            font-size:16px;
            padding-left:7px;
            margin-left:4.5px;
            width:158px;
        }

        .buttonContainer{
            width:500px;
            margin:auto;
            padding-top:20px;
            padding-bottom:20px;
        }

        .buttonContainer2{
            width:160px;
            height:35px;
            margin:auto;
        }

        .btn_Create{
            font-size:17px;
            border:1px solid black;
            background:white;
            padding-top:5px;
            padding-left:8px;
            padding-right:8px;
            padding-bottom:5px;
            cursor:pointer;
            float:left;
        }

        .btn_Cancel{
            font-size:17px;
            border:1px solid black;
            background:white;
            padding-top:5px;
            padding-left:8px;
            padding-right:8px;
            padding-bottom:5px;
            cursor:pointer;
            float:right;
        }

        .btn_Create:hover{
            background:rgb(255, 235, 238);
        }

        .btn_Cancel:hover{
            background:rgb(255, 235, 238);
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="extraDiv">
        <div class="containerContent">
            <div class="titleContainer">
                <h1>Create Chat Room</h1>
            </div>
            <div class="creationContainer">
                <div class="title2Container">
                    <label class="labelTitle2">Title: </label>
                    <asp:TextBox ID="tb_Title" CssClass="tb_Title" runat="server"></asp:TextBox>
                    <div style="border-left:74px solid transparent;width:1px;height:1px;float:left"><h1></h1></div>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" Cssclass="validator" runat="server" ErrorMessage="Required" ForeColor="Red" ControlToValidate="tb_Title" Display="Dynamic" ValidationGroup="Create"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" Cssclass="validator" runat="server" ErrorMessage="Max 50 characters" ForeColor="Red" ControlToValidate="tb_Title" Display="Dynamic" ValidationGroup="Create" ValidationExpression="^.{1,50}$"></asp:RegularExpressionValidator >
                </div>
                <div class="roomSizeContainer">
                    <label class="labelRoomSize">Room Size: </label>
                    <asp:DropDownList ID="ddl_RoomSize" CssClass="ddl_Position" runat="server">
                        <asp:ListItem>~Please Select~</asp:ListItem>
                        <asp:ListItem>2</asp:ListItem>
                        <asp:ListItem>3</asp:ListItem>
                        <asp:ListItem>4</asp:ListItem>
                        <asp:ListItem>5</asp:ListItem>
                        <asp:ListItem>6</asp:ListItem>
                    </asp:DropDownList><br />
                    <div style="border-left:135px solid transparent;width:1px;height:1px;float:left"><h1></h1></div>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" Cssclass="validator" runat="server" ErrorMessage="Required" ForeColor="Red" InitialValue="~Please Select~" ControlToValidate="ddl_RoomSize" Display="Dynamic" ValidationGroup="Create"></asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="buttonContainer">
                <div class="buttonContainer2">
                    <asp:Button ID="btn_Create" CssClass="btn_Create" runat="server" Text="Create" ValidationGroup="Create" OnClick="btn_Create_Click" />
                    <asp:Button ID="btn_Cancel" CssClass="btn_Cancel" runat="server" Text="Cancel" OnClick="btn_Cancel_Click" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>
