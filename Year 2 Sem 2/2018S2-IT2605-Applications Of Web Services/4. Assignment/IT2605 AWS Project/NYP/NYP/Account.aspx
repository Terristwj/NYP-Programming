<%@ Page Title="NYP - Account" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Account.aspx.cs" Inherits="NYP.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        #Content{
            background:linear-gradient(180deg, rgba(224, 255, 255, 0.25) 0%, rgba(255, 255, 255, 1) 25%, rgba(255, 255, 255, 1) 75%, rgba(225, 255, 255, 0.25) 100%);
            min-height:700px;
            width:100%;
            padding-top:30px;
        }

        #container1{
            width:850px;
            margin:auto;
        }

        .gvRow{
            text-align:center;
        }

        .Col{
            width:80px;
        }

        #container2{
            width:850px;
            margin:auto;
            margin-top:40px;
        }

        #containerButton{
            width:75px;
            margin:auto;
            margin-top:10px;
            margin-bottom:10px;
        }

        .btnRegister{
            font-size:16px;
            padding-top:2px;
            padding-bottom:2px;
        }

        #container3{
            width:850px;
            margin:auto;
            margin-bottom:20px;
        }

        #container3-2{
            font-family:Arial;
            font-size:16px;
        }

        .registrationP{
            display:inline;
            font-weight:bold;
        }
        
        .ddl{
            font-family:Arial;
            font-size:16px;
            margin-top:5px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="Content">
        <div id="container3">
            <div id="container3-2">
                <p class="registrationP">Name:</p>
                <asp:Label ID="lb_Name" runat="server" Text="Label"></asp:Label>
                <br />
                <p class="registrationP">Registered OSEP ID:</p>
                <asp:Label ID="lb_OSEPID" runat="server" Text="Label"></asp:Label>
                <br />
                <p class="registrationP">Display Setting:</p>
                <asp:DropDownList ID="ddl_Display" runat="server" CssClass="ddl" AutoPostBack="True" OnSelectedIndexChanged="ddl_Display_SelectedIndexChanged">
                    <asp:ListItem>All</asp:ListItem>
                    <asp:ListItem>Available</asp:ListItem>
                </asp:DropDownList>
            </div>
        </div>
        <div id="container1">
            <asp:GridView ID="gv_OSEP_List" runat="server" AutoGenerateColumns="False" RowStyle-CssClass="gvRow" OnSelectedIndexChanged="gv_OSEP_List_SelectedIndexChanged" DataKeyNames="Id">
                <Columns>
                    <asp:BoundField DataField="Id" HeaderText="OSEP ID" ReadOnly="True" SortExpression="Id" />
                    <asp:BoundField DataField="Title" HeaderText="Title" ReadOnly="True" SortExpression="Title" />
                    <asp:BoundField DataField="Duration" HeaderText="Duration" ReadOnly="True" SortExpression="Duration" />
                    <asp:BoundField DataField="Accommodation_Type" HeaderText="Accommodation Type" ReadOnly="True" SortExpression="Accommodation_Type" />
                    <asp:BoundField DataField="SeatsLeft" HeaderText="Seats Left" ReadOnly="True" SortExpression="SeatsLeft" ItemStyle-CssClass="Col">
                    <ItemStyle CssClass="Col"></ItemStyle>
                    </asp:BoundField>
                    <asp:BoundField DataField="Fees" HeaderText="Fee" ReadOnly="True" SortExpression="Fees" ItemStyle-CssClass="Col" >
                    <ItemStyle CssClass="Col"></ItemStyle>
                    </asp:BoundField>
                    <asp:CommandField ShowSelectButton="True" ItemStyle-CssClass="Col"/>
                </Columns>
                <RowStyle CssClass="gvRow"></RowStyle>
            </asp:GridView>
        </div>

        <div id="container2">
            <asp:DetailsView ID="dv_OSEP" runat="server"  Width="100%" AutoGenerateRows="False">
                <Fields>
                    <asp:BoundField DataField="Id" HeaderText="OSEP ID" ReadOnly="True" SortExpression="Id" />
                    <asp:BoundField DataField="Title" HeaderText="Title" ReadOnly="True" SortExpression="Title" />
                    <asp:BoundField DataField="Description" HeaderText="Decription" ReadOnly="True" SortExpression="Description" />
                    <asp:BoundField DataField="Duration" HeaderText="Duration" ReadOnly="True" SortExpression="Duration" />
                    <asp:BoundField DataField="Accommodation_Type" HeaderText="Accommodation Type" ReadOnly="True" SortExpression="Accommodation_Type" />
                    <asp:BoundField DataField="Quota" HeaderText="Quota" ReadOnly="True" SortExpression="Quota" />
                    <asp:BoundField DataField="No_Of_Registered" HeaderText="Number Registered" ReadOnly="True" SortExpression="No_Of_Registered" />
                    <asp:BoundField DataField="SeatsLeft" HeaderText="Seats Left" ReadOnly="True" SortExpression="SeatsLeft" />
                    <asp:BoundField DataField="Fees" HeaderText="Fee" ReadOnly="True" SortExpression="Fees" />
                    <asp:TemplateField ShowHeader="False" ItemStyle-BorderStyle="NotSet" HeaderStyle-BorderStyle="NotSet" FooterStyle-BorderStyle="NotSet" ControlStyle-BorderStyle="NotSet">

                        <ItemTemplate>
                            <div id="containerButton">
                                <asp:Button ID="btn_Register" runat="server" CssClass="btnRegister" OnClick="btn_Register_Click" Text="Register/Cancel" />
                            </div>
                        </ItemTemplate>

                    </asp:TemplateField>
                </Fields>
            </asp:DetailsView>
        </div>
    </div>
</asp:Content>
