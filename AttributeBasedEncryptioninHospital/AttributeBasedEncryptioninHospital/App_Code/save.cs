using System;
using System.Data.SqlClient;
using System.Configuration;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
/// <summary>
/// Summary description for save
/// </summary>
public class save
{
    public SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["eclinic"].ConnectionString);
    public save()
    {

    }
    public static void ShowAlertMessage(string error)
    {

        Page page = HttpContext.Current.Handler as Page;
        if (page != null)
        {
            error = error.Replace("'", "\'");
            ScriptManager.RegisterStartupScript(page, page.GetType(), "err_msg", "alert('" + error + "');", true);
        }
    }
   
	public save(string query,string text)
	{
        con.Open();
        SqlCommand cmd = new SqlCommand(query, con);
        SqlDataReader dr = cmd.ExecuteReader();
        if (dr.Read())
        {
            if (dr[0] == null)
            {
                text = "1";
            }
            else
            {
                text=dr[0].ToString();
            }
        }
        con.Close();
		
	}
    
    public void insert(string query)
    {
        con.Open();
        SqlCommand cmd = new SqlCommand(query, con);
        cmd.ExecuteNonQuery();
        con.Close();
    }
    //adminlogin
    public void adminlogin(string username, string password, Label Label5)
    {
        con.Open();
        SqlCommand cmd = new SqlCommand("select username,password from adminlogin where username='" + username + "' and password='" + password + "'", con);
        SqlDataReader dr = cmd.ExecuteReader();
        if (dr.Read())
        {
            if (username == dr[0].ToString() || password == dr[1].ToString())
            {
                HttpContext.Current.Session["admin"] = username;
                HttpContext.Current.Response.Redirect("~/admin/Addcity.aspx");
            }
        }
        else
        {
            Label5.Visible = true;
            Label5.ForeColor = System
                .Drawing.Color.Black;
            Label5.Text = "Invalid Username or password";


        }
    }
    //user login
    public void login(string username, string password, Label Label5)
    {
        con.Open();
        SqlCommand cmd = new SqlCommand("select email,password from UserRegistration where email='" + username + "' and password='" + password + "'", con);
        SqlDataReader dr = cmd.ExecuteReader();
        if (dr.Read())
        {
            if (username == dr[0].ToString() || password == dr[1].ToString())
            {
                HttpContext.Current.Session["user"] = username;
                HttpContext.Current.Response.Redirect("~/user/Home.aspx");
            }
        }
        else
        {
            Label5.Visible = true;
            Label5.ForeColor = System.Drawing.Color.Black;
            Label5.Text = "Invalid Username or password";


        }
    }

}

