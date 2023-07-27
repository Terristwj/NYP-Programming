<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Ex4.aspx.cs" Inherits="Ex4" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
  
  <style type="text/css">
        .floater
        {
            float:left;
            border:solid 1px black;
            padding: 5px;
            margin: 5px;
        }
    </style>
  
   
  
</head>
<body>
    <form id="form1" runat="server">
   
    <div>
    <div class="floater">
           <asp:GridView ID="grdEmployee" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" 
            Width="336px" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="EmployeeID" EnableModelValidation="True" OnPageIndexChanging="grdEmployee_PageIndexChanging" OnSelectedIndexChanged="grdEmployee_SelectedIndexChanged" PageSize="3" >
              <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
              <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
              <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
              <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
              <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
               <Columns>
                   <asp:BoundField DataField="EmployeeID" HeaderText="ID" />
                   <asp:BoundField DataField="Name" HeaderText="Name" />
                   <asp:CommandField ShowSelectButton="True" />
               </Columns>
              <EditRowStyle BackColor="#999999" />
              <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        </asp:GridView>
      
          
    
    </div>
    <div class="floater">
       <asp:DetailsView ID="ViewEmployeeDetails" runat="server" Height="50px" Width="300px" 
                    CellPadding="4" ForeColor="#333333" GridLines="None" AutoGenerateRows="False" EnableModelValidation="True" >
                <Fields>
                    <asp:ImageField DataAlternateTextField="Photo" DataImageUrlField="Photo" DataImageUrlFormatString="~/EmployeePhotos/{0}">
                    </asp:ImageField>
                    <asp:BoundField DataField="EmployeeID" HeaderText="Employee ID" />
                    <asp:BoundField DataField="Name" HeaderText="Full Name" />
                    <asp:BoundField DataField="username" HeaderText="User name" />
                    <asp:BoundField DataField="Extension" HeaderText="Telephone" />
                </Fields>
                <FooterStyle BackColor="#1C5E55" ForeColor="White" Font-Bold="True" />
                <CommandRowStyle BackColor="#C5BBAF" Font-Bold="True" />
                <RowStyle BackColor="#E3EAEB" />
                <FieldHeaderStyle BackColor="#D0D0D0" Font-Bold="True" />
                <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                <EditRowStyle BackColor="#7C6F57" />
                <AlternatingRowStyle BackColor="White" />
            </asp:DetailsView>
    </div>
         
      
    </div>
            
    <asp:Label ID="lblResult" runat="server" Width="682px"></asp:Label>
     
     
    </form>
 
  
 
</body>
</html>
