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

public partial class ipregister : System.Web.UI.Page
{
    SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["eclinic"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            cn.Open();
            SqlCommand cmd = new SqlCommand("SELECT ABS(CAST(CAST(NEWID() AS VARbinary) AS INT)) AS [password] ", cn);
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
               
                int emplid = int.Parse(dr[0].ToString());
               
                TextBox2.Text = emplid.ToString();

            }
            dr.Close();
            cn.Close();

        }
    }
  
    protected void Button1_Click(object sender, EventArgs e)
    {
        int age = Convert.ToInt32(TextBox3.Text);
        if (age > 100)
        {
            save.ShowAlertMessage("Age should not be more than 100");
        }
        else if(TextBox6.Text.Length>10 || TextBox6.Text.Length < 10)
        {
            save.ShowAlertMessage("Invalid Contact Number");
        }

        else
        {
            cn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "insert into Addpatient([patientname],[patientid],[gender],[age],[symtoms],[address],[department],[phonemob],[doctor],[Branch],[AppliedDate],[Time],RefEmail) values(@patientname,@patientid,@gender,@age,@symtoms,@address,@department,@phonemob,@doctor,@branchname,@AppliedDate,@Time,@RefEmail)";
            cmd.Connection = cn;
            SqlParameter p = new SqlParameter("@patientname", SqlDbType.VarChar, 20);
            p.Value = TextBox1.Text;
            cmd.Parameters.Add(p);

            SqlParameter pid = new SqlParameter("@patientid", SqlDbType.VarChar, 20);
            pid.Value = TextBox2.Text;
            cmd.Parameters.Add(pid);

            SqlParameter p1 = new SqlParameter("@gender", SqlDbType.VarChar, 20);
            p1.Value = DropDownList1.Text;
            cmd.Parameters.Add(p1);
            SqlParameter p2 = new SqlParameter("@age", SqlDbType.VarChar);
            p2.Value = TextBox3.Text;
            cmd.Parameters.Add(p2);

            SqlParameter p3 = new SqlParameter("@address", SqlDbType.VarChar, 20);
            p3.Value = TextBox4.Text;
            cmd.Parameters.Add(p3);

            SqlParameter p5 = new SqlParameter("@phonemob", SqlDbType.VarChar);
            p5.Value = TextBox6.Text;
            cmd.Parameters.Add(p5);

            SqlParameter p12 = new SqlParameter("@symtoms", SqlDbType.VarChar, 20);
            p12.Value = TextBox12.Text;
            cmd.Parameters.Add(p12);
            SqlParameter p13 = new SqlParameter("@department", SqlDbType.VarChar, 20);
            p13.Value = DropDownList3.Text;
            cmd.Parameters.Add(p13);

            SqlParameter p16 = new SqlParameter("@doctor", SqlDbType.VarChar, 20);
            p16.Value = DropDownList5.Text;
            cmd.Parameters.Add(p16);

            SqlParameter p17 = new SqlParameter("@branchname", SqlDbType.VarChar, 20);
            p17.Value = txtdob.Text;
            cmd.Parameters.Add(p17);

            SqlParameter p18 = new SqlParameter("@AppliedDate", SqlDbType.VarChar, 20);
            p18.Value = DateTime.Now.ToString("dd/MM/yyyy");
            cmd.Parameters.Add(p18);

            SqlParameter Time = new SqlParameter("@Time", SqlDbType.VarChar, 20);
            Time.Value = DateTime.Now.ToString("HH:mm");
            cmd.Parameters.Add(Time);

            SqlParameter RefEmail = new SqlParameter("@RefEmail", SqlDbType.VarChar, 20);
            RefEmail.Value = Session["userid"].ToString();
            cmd.Parameters.Add(RefEmail);

            cmd.ExecuteNonQuery();
            cn.Close();
            save.ShowAlertMessage("Information saved successfully");
            TextBox1.Text = string.Empty;
            TextBox2.Text = string.Empty;
            TextBox3.Text = string.Empty;
            TextBox4.Text = string.Empty;
            TextBox12.Text = string.Empty;
            TextBox6.Text = string.Empty;
          
        }

    }
    protected void DropDownList3_TextChanged(object sender, EventArgs e)
    {
       // filldrop();
    }
}
