<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="WarrantyTracker.aspx.cs" Inherits="BitzBytez.WarrantyTracker" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .card-dark {
            color: white;
            background-color: #5c5c5c;
        }
        .vertical-center {
            margin: auto 0;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container" style="background: white; min-height: 795px;">
        <div style="padding:50px; padding-bottom: 10px; text-align:center"><h1 style="font-weight:bold;">Warranty Tracker</h1></div>
        <div class="row d-flex justify-content-center" style="padding:20px;">

            <div class="row col-md-12 d-flex justify-content-center" style="margin:0px; padding:20px; padding-top:0px;">
                <div class="row">
                    <div style="margin:auto 0; padding:5px; font-weight:bold;">Date built: </div>
                    <div style="padding: 5px; padding-right:10px;">
                        <asp:DropDownList ID="ddl_dateBuilt" runat="server" OnSelectedIndexChanged="ddl_dateBuilt_SelectedIndexChanged" CssClass="form-control" AutoPostBack="True"></asp:DropDownList>
                    </div>
                    <div style="margin: auto 0; padding: 5px; font-weight: bold;">
                        Build ID: 
                    </div>
                    <div style="padding: 5px;">
                        <asp:DropDownList ID="ddl_buildID" runat="server" OnSelectedIndexChanged="ddl_buildID_SelectedIndexChanged" CssClass="form-control" AutoPostBack="True"></asp:DropDownList>
                    </div>
                </div>

                <div class="row">
                    
                </div>
                
            </div>
    
            <div class="row d-flex justify-content-center" id="warrantyDiv" runat="server">
                <div style="padding: 10px;">
                    <div class="card card-dark" style="width: 18rem; border: 1px solid grey; box-shadow: 2px 2px 10px grey;">
                        <div style="float:right">
                            <img src="img/thumbtack.png" style="height:50px; width:auto;"/>
                        </div>
                        <div style="text-align: center; padding: 20px; padding-bottom: 0px;">
                            <h1 style="font-size: 60px; font-weight: bold;">5</h1>
                            <h4>DAYS</h4>
                        </div>
                        <div></div>
                        <div class="card-body" style="text-align: center;">
                            <h5 class="card-title" style="font-weight: bold;">Graphics Card</h5>
                            <p style="font-size: 12px;" class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                            <a href="#" class="btn-sm btn-dark" style="text-decoration: none;">View Details</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div id="div_modalWarrantyInfo" runat="server">
            <%--<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document" style="max-width: 750px;">
                    <div class="modal-content">
                        <div class="modal-header" style="text-align: center">
                            <h5 class="modal-title" id="exampleModalLabel" style="font-weight: bold; letter-spacing: -1px;">Warranty Details</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>

                        <div class="modal-body">
                            <table class="table table-bordered" style="margin-bottom: 0px;">

                                <tbody style="font-size: 15px;">
                                    <tr>
                                        <th scope="row">Product Name</th>
                                        <td>Larry the Bird</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">Registration Date</th>
                                        <td>Larry the Bird</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">Serial Number</th>
                                        <td>Larry the Bird</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">Manufacturer</th>
                                        <td colspan="5">Larry the Bird</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">Component Type</th>
                                        <td colspan="5">Larry the Bird</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">Warranty Period</th>
                                        <td colspan="5">FG8743812Y4FG8743812Y4FG8743812Y4FG8743812Y4FG8743812Y4</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">Warranty Registration URL</th>
                                        <td colspan="5">Larry the Bird</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">Contact Information</th>
                                        <td colspan="5">Larry the Bird</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>

                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        </div>
                    </div>
                </div>
            </div>--%>
        </div>

    </div>
</asp:Content>
