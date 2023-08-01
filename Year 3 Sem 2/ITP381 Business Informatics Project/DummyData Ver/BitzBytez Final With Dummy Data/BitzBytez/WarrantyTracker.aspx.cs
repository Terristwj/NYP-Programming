using BitzBytez.codes.DAL;
using BitzBytez.codes.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BitzBytez
{
    public partial class WarrantyTracker : System.Web.UI.Page
    {
        int userID = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            userID = Convert.ToInt32(Session["userID"]);

            if (!IsPostBack)
            {
                if (userID > 0)
                {
                    populateDDL_BuiltDate();
                }
            }
        }

        private void populateDDL_BuiltDate()
        {
            List<string> dates = ProductDA.getBtoPcBuiltDates(userID);
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('" + dates.Count + "')", true);
            ddl_dateBuilt.Items.Clear();
            ddl_dateBuilt.Items.Insert(0, "");

            for (int i = 0; i < dates.Count; i++)
            {
                ddl_dateBuilt.Items.Insert(i+1, dates[i]);
            }
        }

        private void populateDDL_BuildIDs()
        {
            ddl_buildID.Items.Clear();
            List<int> ids = ProductDA.getBtoPcIDs(userID, ddl_dateBuilt.SelectedValue);
            //ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('" + userID + " " + ddl_dateBuilt.SelectedValue + " " + ids.Count + "')", true);
            if (ids.Count > 0)
            {
                ddl_buildID.Items.Insert(0, "");
                for (int i = 0; i < ids.Count; i++)
                {
                    ddl_buildID.Items.Insert(i + 1, ids[i].ToString());
                }
            }
            
        }

        private void populateWarrantyDiv(int id)
        {
            List<FullComponentWarrantyDetails> list = ProductDA.getAllWarrantyInfoForAllComponents(id);

            warrantyDiv.InnerHtml = "";
            div_modalWarrantyInfo.InnerHtml = "";
            foreach (FullComponentWarrantyDetails details in list)
            {
                warrantyDiv.InnerHtml += "<div style=\"padding: 10px;\">" +
                     "<div class=\"card card-dark\" style=\"width: 18rem; border: 1px solid grey; box-shadow: 2px 2px 10px grey;\">" +
                     "<div style=\"float:right; padding-top:10px;\">" +
                            "<img src=\"img/thumbtack.png\" style=\"height:50px; width:auto;\"/>" +
                           "</div>" +
                         "<div style=\"text-align: center; padding: 20px; padding-bottom: 0px;\">" +
                             "<h1 style=\"font-size: 60px; font-weight: bold\">" + (DateTime.Today.AddMonths(Convert.ToInt32(details.WarrantyPeriod * 12)) - details.RegistrationDate).TotalDays + "</h1>" +
                             "<h4>DAYS</h4>" +
                        "</div>" +
                        "<div></div>" +
                        "<div class=\"card-body\" style=\"text-align: center;\">" +
                             "<h5 class=\"card-title\" style=\"font-weight: bold;\">" + details.ProductType + "</h5>" +
                             "<p style=\"font-size: 12px;\" class=\"card-text\">" + details.ProductName + "</p>" +
                            //"<a href=\"#\" class=\"btn-sm btn-dark\" style=\"text-decoration: none;\">View Details</a>" +
                            "<button type=\"button\" class=\"btn-sm btn-dark\" data-toggle=\"modal\" data-target=\"#exampleModal" + details.ProductWarrantyID + "\">View Details</button>" +
                        "</div>" +
                    "</div>" +
                "</div>";

                div_modalWarrantyInfo.InnerHtml += "<div class=\"modal fade\" id=\"exampleModal" + details.ProductWarrantyID + "\" tabindex=\"-1\" role=\"dialog\" aria-labelledby=\"exampleModalLabel\" aria-hidden=\"true\">" +
                  "<div class=\"modal-dialog\" role=\"document\" style=\"max-width: 750px;\">" +
                     "<div class=\"modal-content\">" +
                        "<div class=\"modal-header\" style=\"text-align: center\">" +
                            "<h5 class=\"modal-title\" id=\"exampleModalLabel\" style=\"font-weight: bold; letter-spacing: -1px;\">Warranty Details</h5>" +
                             "<button type=\"button\" class=\"close\" data-dismiss=\"modal\" aria-label=\"Close\">" +
                                "<span aria-hidden=\"true\">&times;</span>" +
                            "</button>" +
                        "</div>" +

                        "<div class=\"modal-body\">" +
                            "<table class=\"table table-bordered\" style=\"margin-bottom: 0px;\">" +

                                 "<tbody style=\"font-size: 15px;\">" +
                                     "<tr>" +
                                        "<th scope=\"row\">Product Name</th>" +
                                        "<td>" + details.ProductName + "</td>" +
                                     "</tr>" +
                                    "<tr>" +
                                        "<th scope=\"row\">Registration Date</th>" +
                                         "<td>" + details.RegistrationDate + "</td>" +
                                     "</tr>" +
                                    "<tr>" +
                                        "<th scope=\"row\">Serial Number</th>" +
                                         "<td>" + details.SerialNo + "</td>" +
                                     "</tr>" +
                                    "<tr>" +
                                        "<th scope=\"row\">Manufacturer</th>" +
                                         "<td>" + details.Manufacturer + "</td>" +
                                    "</tr>" +
                                    "<tr>" +
                                        "<th scope=\"row\">Component Type</th>" +
                                        "<td>" + details.ProductType + "</td>" +
                                    "</tr>" +
                                    "<tr>" +
                                        "<th scope=\"row\">Warranty Period</th>" +
                                        "<td>" + details.WarrantyPeriod + "</td>" +
                                    "</tr>" +

                                    "<tr>" +
                                        "<th scope=\"row\">Warranty Registration URL</th>" +
                                        "<td colspan=\"5\">" + details.WarrantyRegistrationURL + "</td>" +
                                    "</tr>" +
                                    "<tr>" +
                                        "<th scope=\"row\">Contact Information</th>" +
                                        "<td colspan=\"5\">" + details.ContactInformation + "</td>" +
                                    "</tr>" +
                                "</tbody>" +
                            "</table>" +
                        "</div>" +

                        "<div class=\"modal-footer\">" +
                            "<button type = \"button\" class=\"btn btn-secondary\" data-dismiss=\"modal\">Close</button>" +
                        "</div>" +
                    "</div>" +
                "</div>" +
            "</div>";
            }
        }

        protected void ddl_buildID_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddl_buildID.SelectedValue != "")
            {
                populateWarrantyDiv(int.Parse(ddl_buildID.SelectedValue));
            }
        }

        protected void ddl_dateBuilt_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddl_dateBuilt.SelectedValue != "")
            {
                populateDDL_BuildIDs();
            }
        }

    }
}