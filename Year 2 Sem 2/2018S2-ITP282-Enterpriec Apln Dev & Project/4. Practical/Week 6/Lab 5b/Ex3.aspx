<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Ex3.aspx.cs" Inherits="Ex3" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
    <style type="text/css">
        html
        {
            background-color:silver;
            font:14px Georgia,Serif;
        }
        .content
        {
            background-color:white;
            width:400px;
            margin:auto;
            padding:20px;
            height:90px;
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
    <div class="content">
  
    <div class="catLabel">
     <asp:Label ID="lblName"  Text="Name" runat="server"   />  
    </div>
    <div class="catText">
      <asp:TextBox ID="txtName"  Width="150px"  runat="server"  />
    </div>
   <br class="clear" />
     
     <div class="catLabel">
     <asp:Label ID="lblExt"  Text="Phone Ext" runat="server"   />  
    </div>
    <div class="catText">
      <asp:TextBox ID="txtExt"  Width="50px"  runat="server"  />
    </div>
    <div class="catText">
      <asp:Label ID="lblErr" runat="server" /> 
    </div>
   <br class="clear" />
   
     <div class="catLabel">
     <asp:Button ID="btnRetrieve"  runat="server" OnClick="btnRetrieve_Click" Text="Retrieve" />
     </div>
     <div class="catText" >
      <asp:Button ID="btnUpdate" runat="server" Text="Update"   
             onclick="btnUpdate_Click" />
     </div>
 
    </div>
   
    </form>
</body>
</html>
