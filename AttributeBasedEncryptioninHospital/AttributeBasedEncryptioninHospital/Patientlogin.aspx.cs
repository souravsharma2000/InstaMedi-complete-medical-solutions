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
using System.Net.Mail;

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
        qry = "select [PatientEMail],[password] from [PatientRegister] where [PatientEMail]='" + lidtxt.Text + "' and [password]='" + txtpwd.Text + "'";
        SqlCommand cmd = new SqlCommand(qry, cn);
        dr = cmd.ExecuteReader();
        if (dr.Read())
        {
                 Session["userid"] = lidtxt.Text;  
                Response.Redirect("Patient/Home.aspx",false);
           
        }
        else
        {
            save.ShowAlertMessage("INVALID USERID OR PASSWORD");
        }
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Random rnd = new Random();
      int h=  rnd.Next(int.MinValue, int.MaxValue);
        string qry;
        qry = "select [patientid],[password],[email] from addpatient where patientid='" + lidtxt.Text + "'";
      //  SqlCommand cmd = new SqlCommand(qry, cn);
        SqlDataAdapter da = new SqlDataAdapter(qry, cn);
        DataTable dt = new DataTable();
        da.Fill(dt);
        
            SendEmail(dt.Rows[0][2].ToString(), "Password is", Convert.ToString(h));
            cn.Open();
            SqlCommand daupdate = new SqlCommand("update addpatient set password='"+h+"' where patientid='" + lidtxt.Text + "'", cn);
            daupdate.ExecuteNonQuery();
            cn.Close();         

       
    }
    protected string SendEmail(string toAddress, string subject, string body)
    {
        string result = "Message Sent Successfully..!!";
        string senderID = "prakhargarg85@gmail.com";// use sender’s email id here..
        const string senderPassword = "shivamgarg"; // sender password here…
        try
        {
            SmtpClient smtp = new SmtpClient
            {
                Host = "smtp.gmail.com", // smtp server address here…
                Port = 587,
                EnableSsl = true,
                DeliveryMethod = SmtpDeliveryMethod.Network,
                Credentials = new System.Net.NetworkCredential(senderID, senderPassword),
                Timeout = 30000,
            };
            MailMessage message = new MailMessage(senderID, toAddress, subject, body);
            smtp.Send(message);
        }
        catch (Exception ex)
        {
            result = "Error sending email.!!!";
        }
        return result;
    }
}
