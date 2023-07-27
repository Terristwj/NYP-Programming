using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Ex01 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void BtnCalculate_Click(object sender, EventArgs e)
    {
        double grossSalary;
        double employerCon;
        double employeeCon;

        grossSalary = Convert.ToDouble(TbSalary.Text);

        employerCon = Math.Round(grossSalary * 0.145, 2);
        employeeCon = Math.Round(grossSalary * 0.2, 2);

        LblEmployerCon.Text = employerCon.ToString();
        LblEmployeeCon.Text = employeeCon.ToString();
        LblTotalCon.Text = (employerCon + employeeCon).ToString();
        LblNetSalary.Text = "$" + (grossSalary - employeeCon).ToString();
        LblOrdAcct.Text = "$" + (Math.Round((employerCon + employeeCon) * 0.6667, 2)).ToString();
        LblSpecAcct.Text = "$" + (Math.Round((employerCon + employeeCon) * 0.1449, 2)).ToString();
        LblMsAcct.Text = "$" + (Math.Round((employerCon + employeeCon) * 0.1884, 2)).ToString();
    }
}