using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Package_WebApp.Properties;
using System.Data.OleDb;
using Microsoft.Office.Interop.Excel;


namespace Package_WebApp.PagesMembers.Page_MailBox
{

    public partial class frm_Scaning : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ButtonUpdate.Enabled = false;
            Button4.Enabled = false;
            
        } 
        protected void Button3_Click(object sender, EventArgs e)
        {
            if (TextBoxAWB.Text == "" || TextBoxTracking.Text == "" || TextBoxCuenta.Text == "" || TextBoxCaja.Text == "")
            {
                Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "clave", "alert(' No debe dejar escaques en blanco ');", true);

            }
            else
            {
                string SqlString = "Insert Into TBL_Package_Main (AWB, Tracking, No_Cuenta, Box, Nombre_Congsinne) Values (?, ?, ?, ?, ?)";
                using (OleDbConnection conn = new OleDbConnection(Properties.Settings.Default.ConnectionString))
                {
                    using (OleDbCommand cmd = new OleDbCommand(SqlString, conn))
                    {
                        cmd.CommandType = System.Data.CommandType.Text;

                        //  cmd.Parameters.AddWithValue("Date", fecha_inicial.ToString()); 

                        cmd.Parameters.AddWithValue("AWB", TextBoxAWB.Text);
                        TextBoxTracking.Text = TextBoxTracking.Text;
                        cmd.Parameters.AddWithValue("Tracking", TextBoxTracking.Text);


                        string mCuenta = "T-" + TextBoxCuenta.Text;
                        string SelectBusca = "SELECT ID_Cliente, Cod_Cliente, Name_Cliente, Cuenta FROM tbl_Clientes WHERE Cod_Cliente = '" + mCuenta + "';";
                        OleDbDataAdapter da = new OleDbDataAdapter(SelectBusca, conn);
                        System.Data.DataTable dt = new System.Data.DataTable();
                        da.Fill(dt);

                        string nC = dt.Rows.Count.ToString();
                        if (nC != "0")
                        {
                            System.Data.DataRow row = dt.Rows[0];
                            TextBoxTracking.Text = TextBoxTracking.Text;
                            TextBoxName.Text = row["Name_Cliente"].ToString();
                            cmd.Parameters.AddWithValue("No_Cuenta", TextBoxCuenta.Text);
                            cmd.Parameters.AddWithValue("Box", TextBoxCaja.Text);
                            cmd.Parameters.AddWithValue("Nombre_Congsinne", TextBoxName.Text);
                        }
                        else
                        {
                            TextBoxName.Text = "U N K N O W N";
                            cmd.Parameters.AddWithValue("No_Cuenta", TextBoxCuenta.Text);
                            cmd.Parameters.AddWithValue("Box", TextBoxCaja.Text);
                            cmd.Parameters.AddWithValue("Nombre_Congsinne", "U N K N O W N");
                        }

                        //cmd.Parameters.AddWithValue("Nombre_Congsinne", TextBoxName.Text); 
                        conn.Open();
                        cmd.ExecuteNonQuery();
                        conn.Close();
                        GridView1.DataBind();
                        TextBoxTracking.Text = "";
                        TextBoxCuenta.Text = "";
                    }
                }
            }
            
           
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            //Capturar los datos de la DataGrid y asignarlos a las cajas de texto   
            GridViewRow row = GridView1.SelectedRow;
            
            TextBoxAWB.Text = row.Cells[3].Text;
            TextBoxTracking.Text = row.Cells[5].Text;
            TextBoxName.Text = row.Cells[6].Text;
            TextBoxCaja.Text = row.Cells[4].Text;
            TextBoxCuenta.Text = row.Cells[8].Text;
            ID_Package.Text = row.Cells[1].Text;
            ButtonUpdate.Enabled = true;
            Button4.Enabled = true;
            Button3.Enabled = false;
        }

        protected void ButtonUpdate_Click(object sender, EventArgs e)
        {
            using (OleDbConnection cond = new OleDbConnection(Properties.Settings.Default.ConnectionString))
            {
                string mCuenta = "T-" + TextBoxCuenta.Text;
                TextBoxTracking.Text = TextBoxTracking.Text;
                string SelectBusca = "SELECT ID_Cliente, Cod_Cliente, Name_Cliente, Cuenta FROM tbl_Clientes WHERE Cod_Cliente = '" + mCuenta + "';";
                using (OleDbCommand MiComando = new OleDbCommand(SelectBusca, cond))
                {
                    OleDbDataAdapter da = new OleDbDataAdapter(SelectBusca, cond);
                    System.Data.DataTable dt = new System.Data.DataTable();
                    da.Fill(dt);
                    string nC = dt.Rows.Count.ToString();
                    if (nC != "0")
                    {
                        System.Data.DataRow row = dt.Rows[0];
                        TextBoxName.Text = row["Name_Cliente"].ToString();
                        //TextBoxCuenta.Text = mCuenta;
                    }
                    else
                    {
                        TextBoxName.Text = "U N K N O W N";
                    }
                    cond.Close();
                }
             }   
                
             string SqlString = "Update TBL_Package_Main set AWB = '" + TextBoxAWB.Text + "', Tracking = '" + TextBoxTracking.Text + "', Nombre_Congsinne = '" + TextBoxName.Text + "', Box = '" + TextBoxCaja.Text + "', No_Cuenta = '" + TextBoxCuenta.Text + "' where id_Package_Box = " + ID_Package.Text + ";";
             using (OleDbConnection conn = new OleDbConnection(Properties.Settings.Default.ConnectionString))
             {
                using (OleDbCommand MiComando = new OleDbCommand(SqlString, conn))
                {
                  conn.Open();
                  int FilasAfectadas = MiComando.ExecuteNonQuery();
                  conn.Close();
                  GridView1.DataBind();
                  Button3.Enabled = true;
                  TextBoxTracking.Text = "";
                  TextBoxCuenta.Text = "";
                  TextBoxAWB.Text = "";
                  TextBoxName.Text = "";
                  TextBoxCaja.Text = "";
                }
            }
        }

        protected void Button4_Click(object sender, EventArgs e)
        {

            //  Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "clave", "alert(' Para un calculo correcto, no debe dejar ningun escaque (peso, largo, ancho ni altura) en CERO');", true);
            
            string SqlString = "DELETE TBL_Package_Main.* FROM TBL_Package_Main where id_Package_Box = " + ID_Package.Text + ";";
            using (OleDbConnection conn = new OleDbConnection(Properties.Settings.Default.ConnectionString))
            {
                using (OleDbCommand MiComando = new OleDbCommand(SqlString, conn))
                {
                    conn.Open();
                    int FilasAfectadas = MiComando.ExecuteNonQuery();
                    conn.Close();
                    GridView1.DataBind();
                    Button3.Enabled = true;
                    TextBoxTracking.Text = "";
                    TextBoxCuenta.Text = "";
                    TextBoxAWB.Text = "";
                    TextBoxName.Text = "";
                    TextBoxCaja.Text = "";

                    Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "clave", "alert('RECORD REMOVED....');", true);
                    
                    Button4.Enabled = false;
                    
                    // labelMessage.Visible = true;
                   // labelMessage.Text = "Registro eliminado.";
                }
            }
        }

        protected void Button5_Click(object sender, EventArgs e)
        {
        
            }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            Microsoft.Office.Interop.Excel.Application Excel = new Microsoft.Office.Interop.Excel.Application();
            Workbook wb = Excel.Workbooks.Add(XlSheetType.xlWorksheet);
            Worksheet ws = (Worksheet)Excel.ActiveSheet;
            Excel.Visible = true;

          //  ws.Cells[1, 1] = "";
          //  ws.Cells[1, 2] = " ID";
          //  ws.Cells[1, 3] = "Date";
          //  ws.Cells[1, 1] = " AWB";
          //  ws.Cells[1, 2] = "Tracking";
          //  ws.Cells[1, 3] = "Consignee";
          //  ws.Cells[1, 4] = "Box";
          //  ws.Cells[1, 5] = "Suite";


            for (int j = 1; j <= GridView1.Rows.Count; j++)
            {
                for (int i = 1; i <= 7; i++)
                {
                    ws.Cells[j, i] = GridView1.Rows[j - 1].Cells[i - 1].Text;

                }
            }
        }
    }    
      
}