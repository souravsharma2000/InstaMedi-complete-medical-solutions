using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;

public partial class doctorlogin : System.Web.UI.Page
{
    //SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["eclinic"].ConnectionString);
    //SqlDataReader dr;
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (lidtxt.Text == "admin" && pwdtxt.Text == "admin")
        {
            Response.Redirect("Admin/DoctorList.aspx");

        }
        else
        {
            save.ShowAlertMessage("Invalid User ID and Password");
        }
    }
}
