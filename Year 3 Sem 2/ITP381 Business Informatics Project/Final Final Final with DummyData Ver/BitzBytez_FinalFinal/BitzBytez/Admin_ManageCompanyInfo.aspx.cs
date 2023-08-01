using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;

namespace BitzBytez
{
    public partial class Admin_ManageCompanyInfo : System.Web.UI.Page
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
                            tb_address.Text = sdr["address"].ToString();
                            tb_contact.Text = sdr["contact"].ToString();
                            tb_weekdays.Text = sdr["wkdayTime"].ToString();
                            tb_weekends.Text = sdr["wkendTime"].ToString();

                        }
                        con.Close();
                    }
                }
            }

        }

        protected void tb_update_Click(object sender, EventArgs e)
        {
            string constr = ConfigurationManager.ConnectionStrings["db"].ConnectionString;
            string queryStr = "UPDATE CompanyInfo SET address=@Address, contact=@Contact, wkdayTime=@WkdayTime, wkendTime=@WkendTime";
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand(queryStr, con))
                {
                    cmd.Parameters.AddWithValue("@Address", tb_address.Text);
                    cmd.Parameters.AddWithValue("@Contact", tb_contact.Text);
                    cmd.Parameters.AddWithValue("@WkdayTime", tb_weekdays.Text);
                    cmd.Parameters.AddWithValue("@WkendTime", tb_weekends.Text);
                    cmd.Connection = con;
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
            }

            lb_success.Text = "Updated details";
        }
    }
}