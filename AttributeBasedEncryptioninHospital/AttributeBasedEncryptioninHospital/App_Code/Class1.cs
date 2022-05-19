//INSTANT C# NOTE: Formerly VB web.config imports:
using System;
using System.Collections;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Configuration;
using System.Text;
using System.Text.RegularExpressions;
using System.Linq;
using System.Xml.Linq;
using System.Web;
using System.Web.Caching;
using System.Web.SessionState;
using System.Web.Security;
using System.Web.Profile;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

using System.Data;
using System.Data.SqlClient;
//INSTANT C# NOTE: The following line has been commented since C# non-aliased 'using' statements only operate on namespaces:
//using System.Data.SqlClient.SqlDataReader;



public class ats_advertise
{
	private string cnstr;
	private SqlConnection cn = new SqlConnection();
	private SqlCommand cmd = new SqlCommand();
	private SqlDataAdapter da = new SqlDataAdapter();
	private DataTable dt = new DataTable();
	private DataSet ds = new DataSet();
	public void init()
	{
		cnstr = "Data Source=.\\SQLEXPRESS;AttachDbFilename=|DataDirectory|\\Database.mdf;Integrated Security=True;User Instance=True";
		cn = new SqlConnection(cnstr);
	}
	public void conopen()
	{
		if (cn.State == ConnectionState.Open)
		{
			cn.Close();
		}
		cn.Open();
	}
	public void executequery(string query)
	{
		init();
		conopen();
		cmd = new SqlCommand(query, cn);
		cmd.ExecuteNonQuery();
	}
	public DataTable fillgrid(string query)
	{
		init();
		conopen();
		cmd = new SqlCommand(query, cn);
		da = new SqlDataAdapter(cmd);
		da.Fill(dt);
		return dt;
	}
	public int executestored(string sp_name, ArrayList paraname, ArrayList paraval)
	{
		int tempexecutestored = 0;
		int i = 0;
		init();
		conopen();
		if (paraname.Count == paraval.Count)
		{
			cmd = new SqlCommand(sp_name, cn);
			//cmd.ExecuteNonQuery()
			cmd.CommandType = CommandType.StoredProcedure;

			for (i = 0; i < paraname.Count; i++)
			{
				cmd.Parameters.AddWithValue((paraname[i]).ToString(), paraval[i]);
			}
			tempexecutestored = cmd.ExecuteNonQuery();
            HttpContext.Current.Response.Output.WriteLine("Your Details Inserted Succesfully");
		}
		else
		{
			HttpContext.Current.Response.Output.WriteLine("Your Details has Not Inserted Succesfully");
		}
		return tempexecutestored;
	}
}
