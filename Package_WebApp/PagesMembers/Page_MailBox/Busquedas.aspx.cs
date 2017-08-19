using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Package_WebApp.Properties;
using System.Data.OleDb;

namespace Package_WebApp.PagesMembers.Page_MailBox
{
    public partial class Busquedas : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            actuallizaGridView();
        }

        protected void actuallizaGridView()
        {
            string SQL_Pack_Main = "SELECT AWB, Tracking, Nombre_Congsinne, Box, No_Cuenta, userShort FROM TBL_Package_Main_Store";
           // "WHERE ( dia  Between '" + fecha_retun(f_desde) + "' and '" + fecha_retun(f_hasta) + "') ";
            //ORDER BY TBL_Package_Main_Store.AWB, TBL_Package_Main_Store.Box

            if (TextBoxTracking.Text != "" & TextBoxAWB.Text != "")
            {
                SQL_Pack_Main = SQL_Pack_Main + " WHERE Tracking LIKE '%" + TextBoxTracking.Text + "%' AND AWB = '" + TextBoxAWB.Text + "' ORDER BY TBL_Package_Main_Store.AWB, TBL_Package_Main_Store.Box";
            }
            
            if (TextBoxTracking.Text != "" & TextBoxAWB.Text == "")
            {
                SQL_Pack_Main = SQL_Pack_Main + " WHERE Tracking LIKE '%" + TextBoxTracking.Text + "%' ORDER BY TBL_Package_Main_Store.AWB, TBL_Package_Main_Store.Box";
            }
           
            if (TextBoxTracking.Text == "" & TextBoxAWB.Text != "")
            {
                SQL_Pack_Main = SQL_Pack_Main + " WHERE AWB = '" + TextBoxAWB.Text + "' ORDER BY TBL_Package_Main_Store.AWB, TBL_Package_Main_Store.Box";
            }   
            else
            {
               // SQL_Pack_Main = SQL_Pack_Main + " ORDER BY TBL_Package_Main_Store.AWB, TBL_Package_Main_Store.Box";
            }

            OleDbConnection conn = new OleDbConnection(Properties.Settings.Default.ConnectionStringMainBox); // se establece conexion
            OleDbDataAdapter da = new OleDbDataAdapter(SQL_Pack_Main, conn);   // creo dataadapter
            System.Data.DataTable DT = new System.Data.DataTable();
            da.Fill(DT);
            GridView2.DataSource = DT;
            GridView2.DataBind();
         }

        protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
        {
            actuallizaGridView();
        }

    

      

       
       
    }
}