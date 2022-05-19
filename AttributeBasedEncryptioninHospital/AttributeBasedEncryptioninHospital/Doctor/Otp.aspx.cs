using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.IO;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.Net.Mail;
using System.Device.Location;

public partial class Doctor_Default : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["eclinic"].ConnectionString);
    save s = new save();
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Sendotp_Click(object sender, EventArgs e)
    {
        SqlDataAdapter da = new SqlDataAdapter("select RefEmail,Branch,patientname from Addpatient where patientid='" + ddlpatientid.Text + "' and Branch='"+txtdob.Text+ "' and patientname='"+txtuname.Text+"'", con);
        DataTable dt = new DataTable();
        da.Fill(dt);
        if (dt.Rows.Count > 0)
        {
            lblemail.Text = dt.Rows[0][0].ToString();
            string number = "";
            Random random = new Random();
            int n = random.Next(1000, 9999);
            number = n.ToString("D4");
            s.insert("insert into Otp(Emailid,Otp) values('" + lblemail.Text + "','" + number + "')");
            SendEmail(lblemail.Text, "OTP", Convert.ToString(number));
            Button1.Visible = true;
        }
        else
        {
            save.ShowAlertMessage("Invalid Dob or Patient Name");
        }
     

    }

    protected void Button1_Click(object sender, EventArgs e)
    {

        con.Open();

        SqlCommand cmd = new SqlCommand("select otp from otp where Emailid='" + lblemail.Text + "'", con);
        SqlDataReader dr = cmd.ExecuteReader();
        if (dr.Read())
        {
            s.insert("delete from otp where [Emailid]='" + ddlpatientid.Text+"'");
            Session["userid"] = ddlpatientid.Text;
            Response.Redirect("PatientProfile.aspx",true);           
        }
        con.Close();
    }

    protected string SendEmail(string toAddress, string subject, string body)
    {
        string result = "Message Sent Successfully..!!";
        string senderID = "trynew101102@gmail.com";// use sender’s email id here..
        const string senderPassword = "trynew123"; // sender password here…
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