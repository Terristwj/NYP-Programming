<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="PurchaseHistory.aspx.cs" Inherits="BitzBytez.PurchaseHistory" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>

        body {
          background-color: #3e94ec;
          font-size: 14px;
          font-weight: 400;
          text-rendering: optimizeLegibility;
        }

        /*div.table-title {
           display: block;
          margin: auto;
          max-width: 600px;
          padding:5px;
          width: 100%;
        }

        .table-title h3 {
           color: #fafafa;
           font-size: 18px;
           font-weight: 400;
           font-style:normal;
           font-family: "Roboto", helvetica, arial, sans-serif;
           text-shadow: -1px -1px 1px rgba(0, 0, 0, 0.1);
           text-transform:uppercase;
        }*/

        /*** Table Styles **/

        .table-fill {
          background: white;
          border-radius:3px;
          border-collapse: collapse;
          /*height: 320px;*/
          margin: auto;
          /*max-width: 600px;*/
          padding:5px;
          width: 100%;
          box-shadow: 0 5px 10px rgba(0, 0, 0, 0.1);
          animation: float 5s infinite;
        }
 
        th {
          color:#D5DDE5;
          background:#1b1e24;
          border-bottom:4px solid #9ea7af;
          border-right: 1px solid #343a45;
          font-size:18px;
          font-weight: bold;
          letter-spacing:-1px;
          padding:15px;
          text-align:left;
          text-shadow: 0 1px 1px rgba(0, 0, 0, 0.1);
          vertical-align:middle;
        }

        th:first-child {
          border-top-left-radius:3px;
        }
 
        th:last-child {
          border-top-right-radius:3px;
          border-right:none;
        }
  
        tr {
          border-top: 1px solid #C1C3D1;
          border-bottom: 1px solid #C1C3D1;
          color:#666B85;
          font-size:16px;
          font-weight:bold;
          text-shadow: 0 1px 1px rgba(256, 256, 256, 0.1);
        }
 
        tr:hover td {
          background:#4E5066;
          color:#FFFFFF;
          border-top: 1px solid #22262e;
        }
 
        tr:first-child {
          border-top:none;
        }

        tr:last-child {
          border-bottom:none;
        }
 
        tr:nth-child(odd) td {
          background:#EBEBEB;
        }
 
        tr:nth-child(odd):hover td {
          background:#4E5066;
        }

        tr:last-child td:first-child {
          border-bottom-left-radius:3px;
        }
 
        tr:last-child td:last-child {
          border-bottom-right-radius:3px;
        }
 
        td {
          background:#FFFFFF;
          padding:20px;
          text-align:center;
          vertical-align:middle;
          font-weight:300;
          font-size:16px;
          text-shadow: -1px -1px 1px rgba(0, 0, 0, 0.1);
          border-right: 1px solid #C1C3D1;
        }

        td:last-child {
          border-right: 0px;
        }

        th.text-left {
          text-align: left;
        }

        th.text-center {
          text-align: center;
        }

        th.text-right {
          text-align: right;
        }

        td.text-left {
          text-align: left;
        }

        td.text-center {
          text-align: center;
        }

        td.text-right {
          text-align: right;
        }

        .pricing {
            font-size:18px; padding:10px; font-weight:bold;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<%--    <html lang="en">
    <head>
        <meta charset="utf-8" />
        <title>Table Style</title>
        <meta name="viewport" content="initial-scale=1.0; maximum-scale=1.0; width=device-width;">
    </head>

    <body>--%>
    <div class="container" style="background: white; padding:20px; padding-top:0px; padding-bottom:50px;">
        <div style="margin: auto; text-align: center; padding: 50px; padding-bottom: 0px;">
            <h2><strong><span style="letter-spacing: -1px;">Purchase History</span></strong></h2>
            <p>Your previous purchase orders are listed below.</p>
        </div>
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <div class="row col-md-12 d-flex justify-content-center" style="margin: 0px; padding: 20px; padding-top: 0px;">
                    <div class="row">
                        <div style="margin: auto 0; padding: 5px; font-weight: bold;">Date built: </div>
                        <div style="padding: 5px; padding-right: 10px;">
                            <asp:DropDownList ID="ddl_date" runat="server" CssClass="form-control" AutoPostBack="True" OnSelectedIndexChanged="ddl_date_SelectedIndexChanged"></asp:DropDownList>
                        </div>
                        <div style="margin: auto 0; padding: 5px; font-weight: bold;">
                            Order ID: 
                        </div>
                        <div style="padding: 5px;">
                            <asp:DropDownList ID="ddl_orderID" runat="server" CssClass="form-control" AutoPostBack="True" OnSelectedIndexChanged="ddl_orderID_SelectedIndexChanged"></asp:DropDownList>
                        </div>
                    </div>

                    <div class="row">
                    </div>
                </div>

                <div id="test" runat="server"></div>

                <table class="table-fill">
                    <thead>
                        <tr>
                            <th class="text-center">Product</th>
                            <th class="text-center">Quantity</th>
                            <th class="text-center">Amount in Total</th>
                        </tr>
                    </thead>
                    <tbody class="table-hover" id="tbody_orderItems" runat="server">
<%--                        <tr>
                            <td class="text-center">ABC</td>
                            <td class="text-center">1</td>
                            <td class="text-center">$100</td>
                        </tr>
                        <tr>
                            <td class="text-center">ABC</td>
                            <td class="text-center">1</td>
                            <td class="text-center">$100</td>
                        </tr>
                        <tr>
                            <td class="text-center">ABC</td>
                            <td class="text-center">1</td>
                            <td class="text-center">$100</td>
                        </tr>--%>
                    </tbody>
                </table>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
<%--    </body>--%>
</asp:Content>
