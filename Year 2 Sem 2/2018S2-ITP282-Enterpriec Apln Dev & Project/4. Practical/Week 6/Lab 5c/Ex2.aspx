<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Ex2.aspx.cs" Inherits="Ex2" %>

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
        <asp:GridView ID="grdMovie" runat="server" 
            CellPadding="4" ForeColor="#333333" GridLines="None" 
            Width="336px" style="margin-bottom: 0px" AllowPaging="True" PageSize="5" AutoGenerateColumns="False" EnableModelValidation="True" OnPageIndexChanging="grdMovie_PageIndexChanging" OnSelectedIndexChanged="grdMovie_SelectedIndexChanged">
              <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
    
              <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
              <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
              <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
              <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
              <Columns>
                  <asp:BoundField DataField="ProductID" HeaderText="ID" />
                  <asp:BoundField DataField="Title" HeaderText="Movie Title" />
                  <asp:BoundField DataField="Price" DataFormatString="{0:C}" HeaderText="Price" />
                  <asp:ImageField DataImageUrlField="Image1FileName" DataImageUrlFormatString="~/ProductImages/{0}" HeaderText="Image1FileName">
                  </asp:ImageField>
                  <asp:CommandField ShowSelectButton="True" />
              </Columns>
              <EditRowStyle BackColor="#999999" />
              <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        </asp:GridView>  
   </div>
 
 <div class="floater">
            <asp:Label ID="lblResult" runat="server" Width="298px" Height="19px"></asp:Label>
 </div>
  
   </div>
  </form>
    
</body>
</html>
