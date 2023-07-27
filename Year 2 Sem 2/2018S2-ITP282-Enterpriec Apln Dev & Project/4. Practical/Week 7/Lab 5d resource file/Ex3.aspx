<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Ex3.aspx.cs" Inherits="Ex3" %>

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
        left:280px;
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
        <br /> <br />
   <asp:GridView ID="grdEmployee" runat="server" AutoGenerateColumns="False" 
            CellPadding="4" ForeColor="#333333" GridLines="None" 
            Width="336px"
         DataKeyNames="EmployeeID" OnRowCancelingEdit="grdEmployee_RowCancelingEdit" OnRowDeleting="grdEmployee_RowDeleting" OnRowEditing="grdEmployee_RowEditing" OnRowUpdating="grdEmployee_RowUpdating" EnableModelValidation="True"   >
              <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
     
              <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
              <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
              <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
              <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
              <Columns>
                  <asp:BoundField DataField="Name" HeaderText="Name" ReadOnly="True" />
                  <asp:TemplateField HeaderText="Extension">
                      <EditItemTemplate>
                          <asp:TextBox ID="txtExtension" runat="server" Text='<%# Bind("Extension") %>'></asp:TextBox>
                      </EditItemTemplate>
                      <ItemTemplate>
                          <asp:Label ID="lblExtension" runat="server" Text='<%# Bind("Extension") %>'></asp:Label>
                      </ItemTemplate>
                  </asp:TemplateField>
                  <asp:ImageField DataImageUrlField="Photo" DataImageUrlFormatString="~/EmployeePhotos/{0}" ReadOnly="True">
                  </asp:ImageField>
                  <asp:CommandField ShowEditButton="True" />
                  <asp:TemplateField ShowHeader="False">
                      <ItemTemplate>
                          <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" OnClientClick="javascript : return confirm('Confirm delete?');"></asp:LinkButton>
                      </ItemTemplate>
                  </asp:TemplateField>
              </Columns>
              <EditRowStyle BackColor="#999999" />
              <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        </asp:GridView>  
          <br /> <br />
          
     <asp:Button ID="btnAdd" runat="server" Text="Add new Record" onCommand="btnAdd_Click" />
         <br />
         <asp:Label ID="lblResult" runat="server" Width="200px"></asp:Label>
 </div>
 
 <%--insert panel pnlPopup here --%>
<asp:Panel ID="pnlPopUp"  Visible="false" CssClass="popupWindow"  runat="server">
          <!-- Dept -->
            <div class="catLabel">
                <asp:Label ID="Label1" runat="server" Text="Department"></asp:Label>
            </div>
            <div class="catText">
                <asp:DropDownList ID="ddlDeptInsert"  runat="server">
                </asp:DropDownList>
            </div>
            <div class="clear" />
            
             <!-- Name -->
             <div class="catLabel">
                <asp:Label ID="Label2" runat="server" Text="Name"></asp:Label>
            </div>
            <div class="catText">
                <asp:TextBox ID="txtName"  runat="server"></asp:TextBox>
            </div>
            <div class="clear" />
           
               <!-- User Name -->
             <div class="catLabel">
                <asp:Label ID="Label4" runat="server" Text="UserName"></asp:Label>
            </div>
            <div class="catText">
                <asp:TextBox ID="txtUserName"  Width="100px" runat="server"></asp:TextBox>
            </div>
            <div class="clear" />
             
               <!-- Ext -->
             <div class="catLabel">
                <asp:Label ID="Label5" runat="server" Text="Extension"></asp:Label>
            </div>
            <div class="catText">
                <asp:TextBox ID="txtExtension"  Width="100px" runat="server"></asp:TextBox>
            </div>
            <div class="clear" />
                   <!-- Filename -->
             <div class="catLabel">
                <asp:Label ID="Label3" runat="server" Text="Photo"></asp:Label>
            </div>
            <div class="catText">
                <asp:FileUpload ID="ImagePhotoUpload"  Width="180px" runat="server" />
            </div>
            <div class="clear" />
      <asp:Button ID="btnInsert" runat="server" Text="Insert" onclick="btnInsert_Click" style="height: 26px" />
          
   </asp:Panel>
   
    </form>
 
</body>
</html>
