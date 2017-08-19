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
    public partial class StoreRegister : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            actualizarGrid_Actual();
            actualizarGrid_Store();
        }

        private void actualizarGrid_Actual()
        {
            string StringActual = "select AWB, Tracking FROM TBL_Package_Main";
            OleDbConnection cnn = new OleDbConnection(Properties.Settings.Default.ConnectionStringMainBox);
            OleDbDataAdapter da = new OleDbDataAdapter(StringActual, cnn);
            System.Data.DataTable dt = new System.Data.DataTable();
            da.Fill(dt);
            GridViewActual.DataSource = dt;
            GridViewActual.DataBind();
            cnn.Close();

        }
        private void actualizarGrid_Store()
        {
            string StringStore = "SELECT AWB, Tracking FROM TBL_Package_Main_Store ORDER BY Date DESC"; //WHERE AWB = '" + TextBox1.Text + "';";
            OleDbConnection cnn2 = new OleDbConnection(Properties.Settings.Default.ConnectionStringMainBox);
            OleDbDataAdapter da = new OleDbDataAdapter(StringStore, cnn2);
            System.Data.DataTable dt  = new System.Data.DataTable();
            da.Fill(dt);
            GridViewStore.DataSource = dt;
            GridViewStore.DataBind();
            cnn2.Close();
        }

      

        protected void Button1_Click(object sender, EventArgs e)
        {
            GridViewStore.DataBind();
        }

        protected void ImageButton_Dr_Click(object sender, ImageClickEventArgs e)
        {
            string MoverString = "INSERT INTO TBL_Package_Main_Store ([Date], AWB, Tracking, Nombre_Congsinne, Box, Cod_Congsinne, No_Cuenta, userShort ) SELECT Date, AWB, Tracking, Nombre_Congsinne, Box, Cod_Congsinne, No_Cuenta, userShort FROM TBL_Package_Main WHERE AWB = '" + TextBox1.Text + "';";
            using (OleDbConnection conn = new OleDbConnection(Properties.Settings.Default.ConnectionStringMainBox))
            {
                using (OleDbCommand cmd = new OleDbCommand(MoverString, conn))
                {
                    cmd.CommandType = System.Data.CommandType.Text;
                    conn.Open();
                    cmd.ExecuteNonQuery();
                    conn.Close();
                 }
            }

            string SqlString = "DELETE TBL_Package_Main.* FROM TBL_Package_Main WHERE AWB = '" + TextBox1.Text + "';";
            using (OleDbConnection conn = new OleDbConnection(Properties.Settings.Default.ConnectionStringMainBox))
            {
                using (OleDbCommand MiComando = new OleDbCommand(SqlString, conn))
                {
                    conn.Open();
                    int FilasAfectadas = MiComando.ExecuteNonQuery();
                    conn.Close();
                }
            }
            actualizarGrid_Actual();
            actualizarGrid_Store();
        }

        protected void ImageButton_Iz_Click(object sender, ImageClickEventArgs e)
        {
            string MoverString = "INSERT INTO TBL_Package_Main ([Date], AWB, Tracking, Nombre_Congsinne, Box, Cod_Congsinne, No_Cuenta, userShort ) SELECT Date, AWB, Tracking, Nombre_Congsinne, Box, Cod_Congsinne, No_Cuenta, userShort FROM TBL_Package_Main_Store WHERE AWB = '" + TextBox1.Text + "';";
            using (OleDbConnection conn = new OleDbConnection(Properties.Settings.Default.ConnectionStringMainBox))
            {
                using (OleDbCommand cmd = new OleDbCommand(MoverString, conn))
                {
                    cmd.CommandType = System.Data.CommandType.Text;
                    conn.Open();
                    cmd.ExecuteNonQuery();
                    conn.Close();
                 }
            }

            string SqlString = "DELETE TBL_Package_Main_Store.* FROM TBL_Package_Main_Store WHERE AWB = '" + TextBox1.Text + "';";
            using (OleDbConnection conn = new OleDbConnection(Properties.Settings.Default.ConnectionStringMainBox))
            {
                using (OleDbCommand MiComando = new OleDbCommand(SqlString, conn))
                {
                    conn.Open();
                    int FilasAfectadas = MiComando.ExecuteNonQuery();
                    conn.Close();
                }
            }
            actualizarGrid_Actual();
            actualizarGrid_Store();
        }

 

        protected void GridViewStore_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridViewStore.PageIndex = e.NewPageIndex;
            GridViewStore.DataBind();
        }

     

      


            
       
    }
}