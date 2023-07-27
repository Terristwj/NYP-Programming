<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Ex1.aspx.cs" Inherits="Ex2" %>

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
        <br />
 
        <div class="floater">
            <h3> Drop Down List</h3>
                <asp:DropDownList ID="ddlCategory" runat="server" AutoPostBack="True" 
            Height="25px" onselectedindexchanged="ddlCategory_SelectedIndexChanged" 
            Width="206px">
             </asp:DropDownList>
        </div>       
        
        <div class="floater">
                <h3> Radio button List</h3>
            <asp:RadioButtonList ID="rdoCategory" AutoPostBack="true" runat="server" 
                    onselectedindexchanged="rdoCategory_SelectedIndexChanged">
            </asp:RadioButtonList>
        </div>
        
        <div class="floater"> 
                <h3> Check box list</h3>

            <asp:CheckBoxList ID="chkCategory" runat="server"  AutoPostBack="true"
                    oncheckedchanged="chkCategory_CheckedChanged" 
                    onselectedindexchanged="chkCategory_SelectedIndexChanged" />
        </div>
        
   
        <p>
           <asp:Label ID="lblResult" runat="server" Width="682px"></asp:Label>
        </p>
        <br />
        <br />
      
    
    </div>
    </form>
    <p>
        &nbsp;</p>
</body>
</html>
