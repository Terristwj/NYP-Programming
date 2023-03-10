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

    protected void Button1_Click(object sender, EventArgs e)
    {
        double grossSalary;
        double employerCon;
        double employeeCon;
        double totalCon;
        double netSalary;
        double ordinaryAcc;
        double specialAcc;
        double medisaveAcc;

        if (Double.TryParse(TbSalary.Text, out grossSalary))
        {
            grossSalary = Convert.ToDouble(TbSalary.Text);
        }

        employerCon = Math.Round(grossSalary * 0.145, 2);
        employeeCon = Math.Round(grossSalary * 0.2, 2);
        totalCon = Math.Round(employeeCon+ employerCon, 2);
        netSalary = Math.Round(grossSalary - employeeCon, 2);
        ordinaryAcc = Math.Round(totalCon * 0.6667, 2);
        specialAcc = Math.Round(totalCon * 0.1449, 2);
        medisaveAcc = Math.Round(totalCon * 0.1884, 2);

        LblEmployerCon.Text = employerCon.ToString();
        LblEmployeeCon.Text = employeeCon.ToString();
        LblTotalCon.Text = totalCon.ToString();
        LblNetSalary.Text = netSalary.ToString();
        LblOrdinaryAcc.Text = ordinaryAcc.ToString();
        LblSpecialAcc.Text = specialAcc.ToString();
        LblMedisaveAcc.Text = medisaveAcc.ToString();
    }
}