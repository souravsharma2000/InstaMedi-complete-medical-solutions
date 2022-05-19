using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Doctor_Default : System.Web.UI.Page
{
    public SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["eclinic"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        fi.SaveAs(Server.MapPath("~/Files/" + fi.PostedFile.FileName));
        save s = new save();
        s.insert("insert into Comment(Patientid,Test,Comment,DoctorName,Files) values('" + ddlpatientid.Text + "','" + ddltest.Text + "','" + txtcomment.Text + "','" + Session["doctor"] + "','"+fi.PostedFile.FileName+"')");
        save.ShowAlertMessage("Information saved Successfully");
    }

    protected void ddlpatientid_SelectedIndexChanged(object sender, EventArgs e)
    {
        SqlDataAdapter da = new SqlDataAdapter("select patientname from Addpatient where patientid='"+ddlpatientid.Text+"'", con);
        DataTable dt = new DataTable();
        da.Fill(dt);
        if(dt.Rows.Count>0)
        {
            lblname.Text = dt.Rows[0][0].ToString();
        }
    }
}