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

public partial class reception : System.Web.UI.Page
{
    SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["eclinic"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
       
        if(IsPostBack)
        {
            GridView1.DataBind();
        }

    }
    


    protected void pidddl_SelectedIndexChanged(object sender, EventArgs e)
    {
       
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
       
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        
    }
    protected void status_Click(object sender, EventArgs e)
    {
        LinkButton btn = sender as LinkButton;
        GridViewRow row = btn.NamingContainer as GridViewRow;
        lblpatientid.Text = row.Cells[0].Text;
    }
    protected void Button1_Click1(object sender, EventArgs e)
    {

        save s = new save();
        s.insert("update addpatient set Approved='Viewed', AppointmentDateandtime='"+ lidtxt.Text + "' where id='" + lblpatientid.Text+"'");
        GridView1.DataBind();
    }
}
