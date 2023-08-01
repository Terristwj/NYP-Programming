using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BitzAndBytez
{
    public partial class AboutUs : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                {
                    string constr = ConfigurationManager.ConnectionStrings["db"].ConnectionString;
                    using (SqlConnection con = new SqlConnection(constr))
                    using (SqlCommand cmd = new SqlCommand("SELECT * FROM CompanyInfo"))
                    {
                        cmd.CommandType = CommandType.Text;
                        cmd.Connection = con;
                        con.Open();
                        using (SqlDataReader sdr = cmd.ExecuteReader())
                        {
                            sdr.Read();
                            lb_address.Text = sdr["address"].ToString();
                            lb_contact.Text = sdr["contact"].ToString();
                            lb_weekDay.Text = sdr["wkdayTime"].ToString();
                            lb_weekEnd.Text = sdr["wkendTime"].ToString();

                        }
                        con.Close();
                    }
                }
            }
        }
    }
}