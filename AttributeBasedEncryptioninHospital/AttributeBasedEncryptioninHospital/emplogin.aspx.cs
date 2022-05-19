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

public partial class userlogin : System.Web.UI.Page
{
    SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["eclinic"].ConnectionString);
    SqlDataReader dr;
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        
        cn.Open();
        string qry;
        qry = "select [loginid],[password],[department],branch from hospital_empsignup where loginid='" + lidtxt.Text + "' and password='" + pwdtxt.Text + "'";
        SqlCommand cmd = new SqlCommand(qry, cn);
        dr = cmd.ExecuteReader();
        if (dr.Read())
        {
            string department = dr[2].ToString();
            if (department == "Reception")
            {
                Session["branch"] = dr[3].ToString();
                Response.Redirect("Receptionist/ipregister.aspx");
            }
            else if (department == "Pharma")
            {
                Session["branch"] = dr[3].ToString();
                Response.Redirect("pharmacy/Medicinemaster.aspx");
            }
        }
        else
        {
            //pwdlb.Text = "Enter valid UserName/Password";
        }
    }
}
