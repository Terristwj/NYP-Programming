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
    public partial class PaymentFinal : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string cardNumber = Session["CreditCard_cardNumber"].ToString();
            string cardImageUrl = Session["CreditCard_cardImageUrl"].ToString();

            lb_cardNumber.Text = cardNumber;
            img_Card.ImageUrl = cardImageUrl;
        }
        protected void btn_Cancel_Click(object sender, EventArgs e)
        {
            // Remove session
            Session.Remove("CreditCard_cardNumber");
            Session.Remove("CreditCard_cardImageUrl");

            // Generate queryString
            string type = Request.QueryString["prev"].ToString();

            string queryString = "?prev=" + type;
            Response.Redirect("~/Payment.aspx" + queryString);
        }
        protected void btn_Checkout_Click(object sender, EventArgs e)
        {
            // Remove session
            Session.Remove("CreditCard_cardNumber");
            Session.Remove("CreditCard_cardImageUrl");


            string type = Request.QueryString["prev"].ToString();
            string link = "";
            if (type.Equals("service"))
            {
                // Terris services

                // After payment, add into database
                ServiceAppointments serviceAppointments = Session["serviceAppointments"] as ServiceAppointments;
                string serviceName = serviceAppointments.ServiceName();
                string date = serviceAppointments.Date();
                string price = serviceAppointments.Price();
                string start_time = serviceAppointments.Start_time();
                string duration = serviceAppointments.Duration();
                string additionalInfo = serviceAppointments.AdditionalInfo();
                string custEmail = serviceAppointments.CustEmail();
                string staffIncharge = serviceAppointments.StaffIncharge();
                int orderData = serviceAppointments.OrderData();

                // Add into database
                serviceAppointments.addAppointment(serviceName, date, price, start_time, duration, additionalInfo, custEmail, staffIncharge, orderData);

                // Create link
                link = "~/Services.aspx";
            }
            else if (type.Equals("cart"))
            {
                // KaiHong products

                int cartID = Convert.ToInt16(Session["cartID"]);

                // SQL INSERT
                CartDA.updateCartStatus(cartID, "paid");
                // Create link
                link = "~/ProductCatalog.aspx";
            }

            Response.Redirect(link);
        }
    }
}