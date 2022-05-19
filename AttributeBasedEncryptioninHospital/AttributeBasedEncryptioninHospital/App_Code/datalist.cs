using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;
using System.Web.UI.WebControls;
using System.Configuration;
/// <summary>
/// Summary description for datalist
/// </summary>
public class datalist
{
    SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings[1].ConnectionString);
	public datalist()
	{

		
	}
    public void calldatalist(DataList list)
    {
        SqlDataAdapter da = new SqlDataAdapter("tilescollection",cn);
        da.SelectCommand.CommandType = CommandType.StoredProcedure;
        DataTable dt = new DataTable();
        da.Fill(dt);
        list.DataSource = da;
        list.DataBind();
    }
    public void getlist()
    {

    }

}