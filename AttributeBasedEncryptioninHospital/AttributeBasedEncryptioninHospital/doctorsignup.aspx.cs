using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.Text;
using System.Device.Location;

using System.Net;
using System.Net.Mail;


public partial class doctorsignup : System.Web.UI.Page
{
    SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["eclinic"].ConnectionString);
    save s = new save();
    //GeoCoordinateWatcher watcher;

    private GeoCoordinateWatcher Watcher = new GeoCoordinateWatcher();
    protected void Page_Load(object sender, EventArgs e)
    {

        Watcher = new GeoCoordinateWatcher();

        // Catch the StatusChanged event.
        Watcher.StatusChanged += Watcher_StatusChanged;

        // Start the watcher.
        Watcher.Start();
    }

    private void Watcher_StatusChanged(object sender, GeoPositionStatusChangedEventArgs e)
    {
        if (e.Status == GeoPositionStatus.Ready)
        {
            // Display the latitude and longitude.
            if (Watcher.Position.Location.IsUnknown)
            {
                lbllat.Text = "Cannot find location data";
            }
            else
            {
                GeoCoordinate location =
                    Watcher.Position.Location;
                lbllat.Text = location.Latitude.ToString();
                lbllong.Text = location.Longitude.ToString();
            }
        }
    }

    //public void GetLocationEvent()
    //{
    //    this.watcher = new GeoCoordinateWatcher();
    //    this.watcher.PositionChanged += new EventHandler<GeoPositionChangedEventArgs<GeoCoordinate>>(watcher_PositionChanged);
    //    bool started = this.watcher.TryStart(false, TimeSpan.FromMilliseconds(2000));
    //    if (!started)
    //    {
    //        Console.WriteLine("GeoCoordinateWatcher timed out on start.");
    //    }
    //}
    //public static string lat = string.Empty;
    //public static string lon = string.Empty;
    //public void watcher_PositionChanged(object sender, GeoPositionChangedEventArgs<GeoCoordinate> e)
    //{
    //    PrintPosition(e.Position.Location.Latitude, e.Position.Location.Longitude);
    //    lbllat.Text = e.Position.Location.Latitude.ToString();
    //    lbllong.Text = e.Position.Location.Longitude.ToString();
       

    //}

    public void PrintPosition(double Latitude, double Longitude)
    {
        Console.WriteLine("Latitude: {0}, Longitude {1}", Latitude, Longitude);
    }
    protected void subbtn_Click(object sender, EventArgs e)
    {
        cn.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "spadddoctor";
        cmd.Connection = cn;
        //GetLocationEvent();

        SqlParameter p = new SqlParameter("@name",SqlDbType.VarChar,20);
        p.Value = nametxt.Text;
        cmd.Parameters.Add(p);

        SqlParameter p1 = new SqlParameter("@loginid",SqlDbType.VarChar,20);
        p1.Value = lidtxt.Text;
        cmd.Parameters.Add(p1);

        SqlParameter p2 = new SqlParameter("@password",SqlDbType.VarChar,20);
        p2.Value = pwdtxt.Text;
        cmd.Parameters.Add(p2);

        SqlParameter p3 = new SqlParameter("@department",SqlDbType.VarChar,20);
        p3.Value = depddl.Text;
        cmd.Parameters.Add(p3);

        

        SqlParameter p5 = new SqlParameter("@phonenumber",SqlDbType.BigInt);
        p5.Value = phtxt.Text;
        cmd.Parameters.Add(p5);

        SqlParameter p6 = new SqlParameter("@address",SqlDbType.VarChar,20);
        p6.Value = addtxt.Text;
        cmd.Parameters.Add(p6);

        SqlParameter p7 = new SqlParameter("@email", SqlDbType.VarChar,50);
        p7.Value = emtxt.Text;
        cmd.Parameters.Add(p7);

        SqlParameter p8 = new SqlParameter("@Lat", SqlDbType.VarChar, 50);
        p8.Value = lbllat.Text;
        cmd.Parameters.Add(p8);

        SqlParameter p9 = new SqlParameter("@Lon", SqlDbType.VarChar, 50);
        p9.Value = lbllong.Text;
        cmd.Parameters.Add(p9);

        cmd.ExecuteNonQuery();
        cn.Close();
        save.ShowAlertMessage("Doctor successfully added!!");
        

    }
    protected void Resbtn_Click(object sender, EventArgs e)
    {
        Response.Redirect("doctorsignup.aspx");
    }
    protected void canbtn_Click(object sender, EventArgs e)
    {
        Response.Redirect("doctorlogin.aspx");
    }
}
