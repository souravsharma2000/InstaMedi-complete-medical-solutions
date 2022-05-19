using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_Default : System.Web.UI.Page
{
    save s = new save();
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Delete_Click(object sender, EventArgs e)
    {
        Button button = sender as  Button;
        GridViewRow gridViewRow = button.NamingContainer as GridViewRow;
        int id = Convert.ToInt32(gridViewRow.Cells[1].Text);        
        s.insert("delete from adddoctor where loginid='"+id+"'");
        GridView1.DataBind();

    }
}