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
using System.Device.Location;

public partial class doctorlogin : System.Web.UI.Page
{
    SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["eclinic"].ConnectionString);
    SqlDataReader dr;
    protected void Page_Load(object sender, EventArgs e)
    {
        GetLocationEvent();
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        cn.Open();
        string qry;
        qry = "select * from Adddoctor where email='" + lidtxt.Text + "' and password='" + pwdtxt.Text + "'";
        SqlCommand cmd = new SqlCommand(qry, cn);
        dr = cmd.ExecuteReader();
        if (dr.Read())
        {
            Session["doctor"] = lidtxt.Text;
            Session["doctorname"] = dr[0].ToString();
            Response.Redirect("Doctor/appointments.aspx");
        }
        else
        {

        }
    }
    GeoCoordinateWatcher watcher;

    public void GetLocationEvent()
    {
        this.watcher = new GeoCoordinateWatcher();
        this.watcher.PositionChanged += new EventHandler<GeoPositionChangedEventArgs<GeoCoordinate>>(watcher_PositionChanged);
        bool started = this.watcher.TryStart(false, TimeSpan.FromMilliseconds(2000));
        if (!started)
        {
            Console.WriteLine("GeoCoordinateWatcher timed out on start.");
        }
    }
    public static string lat = string.Empty;
    public static string lon = string.Empty;
    public void watcher_PositionChanged(object sender, GeoPositionChangedEventArgs<GeoCoordinate> e)
    {
        PrintPosition(e.Position.Location.Latitude, e.Position.Location.Longitude);
        lbllat.Text = e.Position.Location.Latitude.ToString();
        lbllong.Text = e.Position.Location.Longitude.ToString();

    }

    public void PrintPosition(double Latitude, double Longitude)
    {
        Console.WriteLine("Latitude: {0}, Longitude {1}", Latitude, Longitude);
    }
}
