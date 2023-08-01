using BitzAndBytez.classes;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BitzAndBytez
{
    public partial class Payment : System.Web.UI.Page
    {
        // Used to retrieve associated credit card
        string userEmail;

        // Terris services
        ServiceAppointments serviceAppointment = null;

        // KaiHong products
        // products products = null;

        protected void Page_Load(object sender, EventArgs e)
        {
            Account user = Session["user"] as Account;
            userEmail = user.Email;

            string type = Request.QueryString["prev"].ToString();

            if (type.Equals("service"))
            {
                // Terris services
                serviceAppointment = Session["serviceAppointments"] as ServiceAppointments;
            }
            else if (type.Equals("product"))
            {
                // KaiHong products
                // products = Session["shoppingCart"] as ShoppingCart;
            }


            if (!IsPostBack)   //MUST USE !IsPostBack IF NOT ERROR IN ADDing
            {
                loadCreditCard();
            }
        }

        protected void dl_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName == "delete")
            {
                string cardNumber = ((Label)dl_CreditCard.Items[e.Item.ItemIndex].FindControl("lb_cardNumberDL")).Text;

                CreditCard creditCard = new CreditCard();
                creditCard.deleteCreditCard(cardNumber, userEmail);

                // Reload datalist
                loadCreditCard();
            }

            if (e.CommandName == "select")
            {
                // For passing selected credit card to next page
                Session["CreditCard_cardNumber"] = ((Label)dl_CreditCard.Items[e.Item.ItemIndex].FindControl("lb_cardNumberDL")).Text;
                Session["CreditCard_cardImageUrl"] = ((Image)dl_CreditCard.Items[e.Item.ItemIndex].FindControl("img_CardDL")).ImageUrl.ToString();

                // Generate queryString
                string type = Request.QueryString["prev"].ToString();

                string queryString = "?prev=" + type;
                Response.Redirect("~/PaymentFinal.aspx" + queryString);
            }
        }

        private void loadCreditCard()
        {
            // Set datalist settings
            CreditCard creditCard = new CreditCard();
            SqlDataAdapter da = creditCard.getDataSet(userEmail);
            DataSet ds = new DataSet();
            da.Fill(ds);
            dl_CreditCard.DataSource = ds;
            dl_CreditCard.DataBind();
        }

        protected void btn_Back_Click(object sender, EventArgs e)
        {
            string type = Request.QueryString["prev"].ToString();
            string link = "";

            if (type.Equals("service"))
            {
                // Terris services
                Session.Remove("serviceAppointments");
                link = "ServicesRegister.aspx";
            }
            else if (type.Equals("product"))
            {
                // KaiHong products
                // Session.Remove("shoppingCart");
                // link = "ShoppingCard.aspx";
            }
            
            // Redirects
            Response.Redirect(link);
        }

        protected void btn_AddCard_Click(object sender, EventArgs e)
        {
            string cardNumber = tb_CardNumber.Text;
            string cardType = ddl_CardType.SelectedValue;
            string expires = tb_Expires.Text;
            string country = ddl_Country.SelectedValue;
            string firstName = tb_FName.Text;
            string lastName = tb_LName.Text;
            string cardImageUrl = getCardImageUrl();

            // Add credit card
            CreditCard creditCard = new CreditCard();
            creditCard.addCreditCard(cardNumber, cardType, expires, country, firstName, lastName, cardImageUrl, userEmail);

            // Reload datalist
            loadCreditCard();
        }

        private string getCardImageUrl()
        {
            string cardImageUrl = "";

            if (ddl_CardType.SelectedValue.Equals("MasterCard"))
                cardImageUrl = "~/img/MasterCard.jpg";

            else if (ddl_CardType.SelectedValue.Equals("Visa"))
                cardImageUrl = "~/img/VisaCard.png";

            else if (ddl_CardType.SelectedValue.Equals("American Express"))
                cardImageUrl = "~/img/American Express.jpg";

            else if (ddl_CardType.SelectedValue.Equals("Discover"))
                cardImageUrl = "~/img/Discover.jpg";


            return cardImageUrl;
        }





        protected void btn_Preset1_Click(object sender, EventArgs e)
        {
            ddl_CardType.SelectedIndex = 0;
            tb_CardNumber.Text = "5145-8542-5364-2654";
            tb_Expires.Text = "07/26";
            tb_FName.Text = "Tester";
            tb_LName.Text = "Beta";
        }
        protected void btn_Preset2_Click(object sender, EventArgs e)
        {
            ddl_CardType.SelectedIndex = 1;
            tb_CardNumber.Text = "4751-5364-8542-5145";
            tb_Expires.Text = "03/32";
            tb_FName.Text = "Tester";
            tb_LName.Text = "Beta";
        }
        protected void btn_Preset3_Click(object sender, EventArgs e)
        {
            ddl_CardType.SelectedIndex = 2;
            tb_CardNumber.Text = "3652-7732-1211-8855";
            tb_Expires.Text = "10/28";
            tb_FName.Text = "Tester";
            tb_LName.Text = "Beta";
        }
        protected void btn_Preset4_Click(object sender, EventArgs e)
        {
            ddl_CardType.SelectedIndex = 3;
            tb_CardNumber.Text = "6011-9152-7611-4280";
            tb_Expires.Text = "05/36";
            tb_FName.Text = "Tester";
            tb_LName.Text = "Beta";
        }
    }
}