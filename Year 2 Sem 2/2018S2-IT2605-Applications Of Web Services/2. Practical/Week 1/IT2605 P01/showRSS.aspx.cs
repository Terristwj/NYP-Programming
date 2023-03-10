using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;

public partial class showRSS : System.Web.UI.Page
{
    static XmlDocument RSSDoc = new XmlDocument();
    protected void Page_Load(object sender, EventArgs e)
    {
        RSSDoc.PreserveWhitespace = false;
        string RSSURL = "https://www.channelnewsasia.com/rssfeeds/8395986";

        //Loading page first time only
        if (Page.IsPostBack == false)
        {
            RSSDoc.Load(RSSURL);

            //Get a list of item node
            XmlNodeList itemsList = RSSDoc.GetElementsByTagName("item");

            if (itemsList.Count > 0)
            {
                //Loop through each item node
                foreach (XmlNode eachItem in itemsList)
                {
                    XmlNodeList itemNode = eachItem.ChildNodes;

                    //Access title node
                    foreach (XmlNode itemchild in itemNode)
                    {
                        if (itemchild.Name == "title")
                        {
                            //Formulate dropdown list with title
                            ddlTitle.Items.Add(itemchild.InnerText);
                        }
                    }
                }
            }
            else
            {
                lblErr.Text = "CNN News not available today!";
            }
        }
    }

    protected void btnGet_Click(object sender, EventArgs e)
    {
        //Get a list of item node
        XmlNodeList itemsList = RSSDoc.GetElementsByTagName("item");
       
        foreach (XmlNode eachitem in itemsList){
            if (eachitem.ChildNodes[1].InnerText == ddlTitle.SelectedItem.Text)
            {
                lblDesc.Text = eachitem.ChildNodes[3].InnerText;
            }
        }
    }
}