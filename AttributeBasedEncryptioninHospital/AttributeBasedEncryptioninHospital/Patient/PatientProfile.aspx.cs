using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Patient_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
       
    }

    protected void Files_Click(object sender, EventArgs e)
    {
        LinkButton linkButton = sender as LinkButton;
        string filename = linkButton.CommandArgument;
        Response.Clear();
        Response.ContentType = "application/octet-stream";
        Response.AppendHeader("Content-Disposition", "filename=" + filename);
        Response.TransmitFile(Server.MapPath("~/Files/") + filename);
        Response.End();
    }
}