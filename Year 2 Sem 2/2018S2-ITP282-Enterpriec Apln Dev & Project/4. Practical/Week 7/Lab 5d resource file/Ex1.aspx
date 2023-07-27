<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Ex1.aspx.cs" Inherits="Ex2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    
    <style type="text/css">
    html
    {
        background-color:silver;
        font-family:Georgia,Serif;
    }
    .content
    {
        position:relative;
        width:500px;
        height:auto;
        margin:0px auto;
        border:solid 1px black;
        background-color:white;
        padding:10px;
    }
     .popupWindow
    {
        position:absolute;
        left:300px;
        top:50px;
        width:350px;
        border:solid 1px black;
        padding:10px;
        background-color:white;
     
    }
     .catLabel
      {
            float:left;
            width:100px;
            padding:5px;
            text-align:right;
        }
        .catText
        {
            float:left;
            padding: 5px;
        }
        .catButton
        {
            float:left;
            padding-left:20px;
            text-align:right;
        }
        .clear
        {
            clear:both;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
  
 <div class="content" >
     
   <asp:GridView ID="grdMovie" runat="server" AutoGenerateColumns="False" 
            CellPadding="4" ForeColor="#333333" GridLines="None" 
            Width="336px" DataKeyNames="ProductID" EnableModelValidation="True" OnRowCancelingEdit="grdMovie_RowCancelingEdit" OnRowDeleting="grdMovie_RowDeleting" OnRowEditing="grdMovie_RowEditing" OnRowUpdating="grdMovie_RowUpdating"   >
              <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <Columns>
                <asp:BoundField DataField="ProductID" HeaderText="ID" 
                    SortExpression="ProductID" ReadOnly="True" />
                <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" 
                    ReadOnly="True"  />
                <asp:TemplateField HeaderText="Price" SortExpression="Price">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtPrice" runat="server" Text='<%# Bind("Price") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblPrice" runat="server" Text='<%# Bind("Price") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:ImageField DataImageUrlField="Image1FileName" 
                    DataImageUrlFormatString="~/ProductImages/{0}" ReadOnly="True"></asp:ImageField>  
                <asp:CommandField ShowEditButton="True" />
                <asp:TemplateField ShowHeader="False">
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" OnClientClick="javascript : return confirm('Confirm delete?');"></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
           </Columns>
              <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
              <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
              <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
              <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
              <EditRowStyle BackColor="#999999" />
              <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        </asp:GridView>  
          <br /> <br />

        <asp:Button ID="btnAdd" runat="server" Text="Add new Record" OnCommand="btnAdd_Command" />
        <br />
         <asp:Label ID="lblResult" runat="server" Width="200px"></asp:Label>
 </div>
 	<asp:Panel ID="pnlPopUp"  Visible="false" CssClass="popupWindow"  runat="server">
          <!-- category -->
            <div class="catLabel">
                <asp:Label ID="Label1" runat="server" Text="Category"></asp:Label>
            </div>
            <div class="catText">
                <asp:DropDownList ID="ddlCatInsert" runat="server">
                </asp:DropDownList>
            </div>
            <div class="clear" />
            
             <!-- Title -->
             <div class="catLabel">
                <asp:Label ID="Label2" runat="server" Text="Title"></asp:Label>
            </div>
            <div class="catText">
                <asp:TextBox ID="txtTitle"  runat="server"></asp:TextBox>
            </div>
            <div class="clear" />
           
               <!-- price -->
             <div class="catLabel">
                <asp:Label ID="Label4" runat="server" Text="Price"></asp:Label>
            </div>
            <div class="catText">
                <asp:TextBox ID="txtPrice"  Width="50px" runat="server"></asp:TextBox>
            </div>
            <div class="clear" />
            
                   <!-- Filename -->
             <div class="catLabel">
                <asp:Label ID="Label3" runat="server" Text="File Name"></asp:Label>
            </div>
            <div class="catText">
                <asp:FileUpload ID="ImageFileUpload"  Width="180px" runat="server" />
            </div>
            <div class="clear" />
      <asp:Button ID="btnInsert" runat="server" Text="Insert" onclick="btnInsert_Click" />
          
   </asp:Panel>
   
    </form>
 
</body>
</html>
