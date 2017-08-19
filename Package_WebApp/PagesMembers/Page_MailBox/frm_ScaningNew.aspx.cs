using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ClosedXML.Excel;
using Package_WebApp.Properties;
using System.Configuration;
using System.Data.OleDb;
//using Microsoft.Office.Interop.Excel;
using System.IO;

namespace Package_WebApp.PagesMembers.Page_MailBox
{
    public partial class frm_ScaningNew : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
                        TextBoxTracking.Focus();
            if (!IsPostBack)
            {
                //ButtonUpdate.Enabled = false;
                //Button4.Enabled = false;
                TextBoxTracking.Focus();
            }

            string userName = System.Web.HttpContext.Current.User.Identity.Name;//.Request.LogonUserIdentity.Name;
         //   string user = (string)Session["user"];
         //   string userShort = (string)Session["userShort"];
         //   string mLavel = (string)Session["N_lavel"];

         //   textBox_usuario.Text = userName;
            Usuario.Text = userName;
            //if (mLavel == "admin")
            //{
            //   // ButtonUser_Manager.Enabled = true;
            //   // Button5.Enabled = true;
            //   // ButtonView_Register.Enabled = true;
            //}
            //else
            //{
            //   //  ButtonUser_Manager.Enabled = false;
            //   //  Button5.Enabled = false;
            //   //  ButtonView_Register.Enabled = false;
            //}
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            //Capturar los datos de la DataGrid y asignarlos a las cajas de texto   
            GridViewRow row = GridView1.SelectedRow;
            TextBoxAWB.Text = row.Cells[3].Text;
            TextBoxTracking.Text = row.Cells[5].Text;
            //  TextBoxName.Text = row.Cells[6].Text;
            TextBoxCaja.Text = row.Cells[4].Text;
            TextBoxCuenta.Text = row.Cells[8].Text;
            ID_Package.Text = row.Cells[1].Text;
            ImageButton5.Enabled = true;
            ImageButton4.Enabled = true;
            ImageButton3.Enabled = false;
            //      ListBox1.Text = row.Cells[5].Text;
            ListBox1.Items.Clear();
            ListBox1.Items.Add(row.Cells[6].Text);
            ListBox1.SelectedIndex = 0;

        }

        protected void Button4_Click(object sender, EventArgs e)
        {
        }

        protected void ButtonUpdate_Click(object sender, EventArgs e)
        {
        }

        protected void Button5_Click(object sender, EventArgs e)
        {
     
            string MoverString = "INSERT INTO TBL_Package_Main_Store ([Date], AWB, Tracking, Nombre_Congsinne, Box, Cod_Congsinne, No_Cuenta, userShort ) SELECT Date, AWB, Tracking, Nombre_Congsinne, Box, Cod_Congsinne, No_Cuenta, userShort FROM TBL_Package_Main";
            using (OleDbConnection conn = new OleDbConnection(Properties.Settings.Default.ConnectionStringMainBox))
            {
                using (OleDbCommand cmd = new OleDbCommand(MoverString, conn))
                {
                    cmd.CommandType = System.Data.CommandType.Text;
                    conn.Open();
                    cmd.ExecuteNonQuery();
                    conn.Close();
                    GridView1.DataBind();
                }

            }
        
        }

        protected void Button6_Click(object sender, EventArgs e)
        {
            Server.Transfer("/Froms/AdminUser.aspx"); 
        }

        protected void ButtonView_Register_Click(object sender, EventArgs e)
        {
            Server.Transfer("/Froms/Busquedas.aspx");
        }

        protected void Store_Click(object sender, EventArgs e)
        {

        }

       

        protected void Button5_Click1(object sender, EventArgs e)
        {
     
        }



        protected void Button6_Click1(object sender, EventArgs e)
        {
           
        }

        protected void TextBoxCuenta_TextChanged(object sender, EventArgs e)
        {
            ListBox1.Items.Clear();
            ListBox2.Items.Clear();
          
                string SqlString = "Insert Into TBL_Package_Main (AWB, Tracking, No_Cuenta, Box, Nombre_Congsinne, userShort) Values (?, ?, ?, ?, ?, ?)";
                using (OleDbConnection conn = new OleDbConnection(Properties.Settings.Default.ConnectionStringMainBox))
                {
                    using (OleDbCommand cmd = new OleDbCommand(SqlString, conn))
                    {
                        cmd.CommandType = System.Data.CommandType.Text;

                        //  cmd.Parameters.AddWithValue("Date", fecha_inicial.ToString()); 

                        cmd.Parameters.AddWithValue("AWB", TextBoxAWB.Text);
                       // TextBoxTracking.Text = TextBoxTracking.Text + ";";
                        TextBoxTracking.Text = TextBoxTracking.Text;

                        cmd.Parameters.AddWithValue("Tracking", TextBoxTracking.Text);


                        string mCodCuenta = DropDownCuenta.SelectedValue;

                        // ANtes de seguir INSERTANDO, selecciona sufijo de la cuenta ------------------------------------
                        string BuscaSufijo = "SELECT id_Agen_Destination, Sufij_Agen_Destination FROM tbl_N_Agen_Destination WHERE id_Agen_Destination = " + mCodCuenta + ";";
                        OleDbDataAdapter das = new OleDbDataAdapter(BuscaSufijo, conn);
                        System.Data.DataTable dts = new System.Data.DataTable();
                        das.Fill(dts);
                        System.Data.DataRow rows = dts.Rows[0];
                        //string mCuenta = rows["Sufij_Agen_Destination"].ToString() + TextBoxCuenta.Text;
                        string mCuenta = TextBoxCuenta.Text;


                        //-------------------------------------------------------
                        // Y Busca el cliente si existe segun codido destino y numero de cuenta del cliente



                        string SelectBusca = "SELECT ID_Cliente, Cod_Cliente, Name_Cliente, Cuenta FROM tbl_Clientes WHERE Cuenta = " + mCodCuenta + " AND Cod_Cliente = '" + mCuenta + "';";
                        OleDbDataAdapter da = new OleDbDataAdapter(SelectBusca, conn);
                        System.Data.DataTable dt = new System.Data.DataTable();
                        da.Fill(dt);
                        //------------------------------------------------------------------
                        OleDbConnection cn;
                        OleDbCommand cm;
                        OleDbDataReader Dr;
                        cn = new OleDbConnection(Properties.Settings.Default.ConnectionStringMainBox);
                        cn.Open();
                        cm = new OleDbCommand("SELECT ID_Cliente, Cod_Cliente, Name_Cliente, Cuenta FROM tbl_Clientes WHERE Cuenta = " + mCodCuenta + " AND Cod_Cliente = '" + mCuenta + "';", cn);
                        Dr = cm.ExecuteReader();

                        string nC = dt.Rows.Count.ToString();
                        if (nC != "0")
                        {
                            while (Dr.Read())
                            {

                                ListBox1.Items.Add(Dr[2].ToString());
                            }
                            if (ListBox1.Items.Count > 0)
                               ListBox1.SelectedIndex = 0;

                        }
                            
                      }

                    ListBox1.Focus();
                   }
              }

        protected void TextBoxTracking_TextChanged(object sender, EventArgs e)
        {
            TextBoxCuenta.Focus();
        }

   

        protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
        {
            
            string mCodCuenta = DropDownCuenta.SelectedValue;
            if (TextBoxCuenta.Text == "" || TextBoxName.Text == "" || TextBoxCuenta.Text == "" || mCodCuenta == "")
            {
                Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "clave", "alert(' No debe dejar escaques en blanco ');", true);

            }
            else
            {
                string SqlString = "Insert Into tbl_Clientes (Cod_Cliente, Name_Cliente, Cuenta) Values (?, ?, ?)";
                using (OleDbConnection conn = new OleDbConnection(Properties.Settings.Default.ConnectionStringMainBox))
                using (OleDbCommand cmd = new OleDbCommand(SqlString, conn))
                {



                    cmd.CommandType = System.Data.CommandType.Text;

                    cmd.Parameters.AddWithValue("Cod_Cliente", TextBoxCuenta.Text);
                    cmd.Parameters.AddWithValue("Name_Cliente", TextBoxName.Text);

                    cmd.Parameters.AddWithValue("Cuenta", mCodCuenta);

                    conn.Open();
                    cmd.ExecuteNonQuery();
                    conn.Close();
                    TextBoxName.Text = "";
                    TextBoxCuenta.Text = "";
                    ListBox1.Items.Clear();
                }
                TextBoxCuenta.Focus();

            }
        }

        // ----- COMIENZO EXPORTACION DE FHICHEROS ----------------------------------------------------------------------------------------

             public override void VerifyRenderingInServerForm(Control control)
               {
                 /* Confirms that an HtmlForm control is rendered for the specified ASP.NET
                 server control at run time. */
               }
        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {

            Response.ClearContent();
            Response.ContentType = "application/vnd.ms-excel";
            //   Response.AppendHeader("content-disposition,", "attachment; filename=Mifichero.xls");
            Response.AddHeader("content-disposition", "attachment; filename=Mail_Box.xls");
            //  Response.ContentType = "application/excel";
            StringWriter stringWriter = new StringWriter();
            HtmlTextWriter htmlTextWriter = new HtmlTextWriter(stringWriter);

            GridView1.AllowPaging = false;
            GridView1.DataBind();
            GridView1.EnableViewState = false;


            GridView1.RenderControl(htmlTextWriter);
            Response.Write(stringWriter.ToString());
            Response.End();

           // ------------------------


        }

        protected void ImageButtonBUSCA_Click(object sender, ImageClickEventArgs e)
        {
           ListBox2.Items.Clear();
           string mCodCuenta = DropDownCuenta.SelectedValue;

           using (OleDbConnection conn = new OleDbConnection(Properties.Settings.Default.ConnectionStringMainBox))
           {

               string SelectBusca = "SELECT ID_Cliente, Cod_Cliente, Name_Cliente, Cuenta FROM tbl_Clientes";
               OleDbDataAdapter da = new OleDbDataAdapter(SelectBusca, conn);
               System.Data.DataTable dt = new System.Data.DataTable();
               da.Fill(dt);
               OleDbConnection cn;
               OleDbCommand cm;
               OleDbDataReader Dr;
               cn = new OleDbConnection(Properties.Settings.Default.ConnectionStringMainBox);
               cn.Open();
               cm = new OleDbCommand("SELECT ID_Cliente, Cod_Cliente, Cod_Cliente + ' - ' + Name_Cliente, Cuenta FROM tbl_Clientes WHERE Cuenta = " + mCodCuenta + " AND Name_Cliente LIKE '%" + TextBoxBUSCA.Text + "%'", cn);
               Dr = cm.ExecuteReader();





               string nC = dt.Rows.Count.ToString();
               if (nC != "0")
               {
                   while (Dr.Read())
                   {

                       ListBox2.Items.Add(Dr[2].ToString());
                   }
               }
           }

        }

        protected void TextBoxCuenta_TextChanged1(object sender, EventArgs e)
        {
            ListBox1.Items.Clear();
            ListBox2.Items.Clear();
            string mCodCuenta = DropDownCuenta.SelectedValue;

            using (OleDbConnection conn = new OleDbConnection(Properties.Settings.Default.ConnectionStringMainBox))
            {

                string SelectBusca = "SELECT ID_Cliente, Cod_Cliente, Name_Cliente, Cuenta FROM tbl_Clientes WHERE Cuenta = " + mCodCuenta + " AND Cod_Cliente = '" + TextBoxCuenta.Text + "'";
                OleDbDataAdapter da = new OleDbDataAdapter(SelectBusca, conn);
                System.Data.DataTable dt = new System.Data.DataTable();
                da.Fill(dt);
                OleDbConnection cn;
                OleDbCommand cm;
                OleDbDataReader Dr;
                cn = new OleDbConnection(Properties.Settings.Default.ConnectionStringMainBox);
                cn.Open();
                cm = new OleDbCommand("SELECT ID_Cliente, Cod_Cliente, Name_Cliente, Cuenta FROM tbl_Clientes WHERE Cuenta = " + mCodCuenta + " AND Cod_Cliente = '" + TextBoxCuenta.Text + "'", cn);
                Dr = cm.ExecuteReader();

                string nC = dt.Rows.Count.ToString();
                if (nC != "0")
                {
                    while (Dr.Read())
                    {

                        ListBox1.Items.Add(Dr[2].ToString());
                    }
                    if (ListBox1.Items.Count > 0)
                        ListBox1.SelectedIndex = 0;

                }
            }
            ListBox1.Focus();
        }

        protected void ImageButton3_Click(object sender, ImageClickEventArgs e)
        {
            if (TextBoxAWB.Text == "" || TextBoxTracking.Text == "" || TextBoxCuenta.Text == "" || TextBoxCaja.Text == "")
            {
                Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "clave", "alert(' No debe dejar escaques en blanco ');", true);
            }
            else
            {
                string SqlString = "Insert Into TBL_Package_Main (AWB, Tracking, No_Cuenta, Box, Nombre_Congsinne, userShort) Values (?, ?, ?, ?, ?, ?)";
                using (OleDbConnection conn = new OleDbConnection(Properties.Settings.Default.ConnectionStringMainBox))
                {
                    using (OleDbCommand cmd = new OleDbCommand(SqlString, conn))
                    {
                        if (ListBox1.SelectedValue != "")
                        {
                            cmd.CommandType = System.Data.CommandType.Text;
                            // EVALUAR COMILLA AL FINAL DEL TRACKING
                            string cadena = TextBoxTracking.Text;
                            string lastLetra = cadena.Substring(cadena.Length - 1, 1);
                            if (lastLetra != ";") cadena = cadena + ";"; // SE EVALUA SI TERMNA EN COMILLA Y SINO SE LE PONE
                            cmd.Parameters.AddWithValue("AWB", TextBoxAWB.Text);
                            cmd.Parameters.AddWithValue("Tracking", cadena);
                            cmd.Parameters.AddWithValue("No_Cuenta", TextBoxCuenta.Text);
                            cmd.Parameters.AddWithValue("Box", TextBoxCaja.Text);
                            cmd.Parameters.AddWithValue("Nombre_Congsinne", ListBox1.SelectedValue);
                            cmd.Parameters.AddWithValue("userShort", Usuario.Text);

                            conn.Open();
                            cmd.ExecuteNonQuery();
                            conn.Close();
                            GridView1.DataBind();
                            TextBoxTracking.Text = "";
                            TextBoxCuenta.Text = "";
                            ListBox1.Items.Clear();
                        }
                        else
                        {
                            Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "clave", "alert(' Cliente no encontrado ');", true);
                        }
                    }
                }
            }
            TextBoxTracking.Focus();
        }





        protected void Button3_Click(object sender, EventArgs e)
        {
            if (TextBoxAWB.Text == "" || TextBoxTracking.Text == "" || TextBoxCuenta.Text == "" || TextBoxCaja.Text == "")
            {
                Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "clave", "alert(' No debe dejar escaques en blanco ');", true);
            }
            else
            {
                string userName = System.Web.HttpContext.Current.User.Identity.Name;//.Request.LogonUserIdentity.Name;

                string SqlString = "Insert Into TBL_Package_Main (AWB, Tracking, No_Cuenta, Box, Nombre_Congsinne, userShort) Values (?, ?, ?, ?, ?, ?)";
                using (OleDbConnection conn = new OleDbConnection(Properties.Settings.Default.ConnectionStringMainBox))
                {
                    using (OleDbCommand cmd = new OleDbCommand(SqlString, conn))
                    {
                        if (ListBox1.SelectedValue != "")
                        {
                            cmd.CommandType = System.Data.CommandType.Text;
                            // EVALUAR COMILLA AL FINAL DEL TRACKING
                            string cadena = TextBoxTracking.Text;
                            string lastLetra = cadena.Substring(cadena.Length - 1, 1);
                            if (lastLetra != ";") cadena = cadena + ";"; // SE EVALUA SI TERMNA EN COMILLA Y SINO SE LE PONE
                            cmd.Parameters.AddWithValue("AWB", TextBoxAWB.Text);
                            cmd.Parameters.AddWithValue("Tracking", cadena);
                            cmd.Parameters.AddWithValue("No_Cuenta", TextBoxCuenta.Text);
                            cmd.Parameters.AddWithValue("Box", TextBoxCaja.Text);
                            cmd.Parameters.AddWithValue("Nombre_Congsinne", ListBox1.SelectedValue);
                            cmd.Parameters.AddWithValue("userShort", Usuario.Text);

                            conn.Open();
                            cmd.ExecuteNonQuery();
                            conn.Close();
                            GridView1.DataBind();
                            TextBoxTracking.Text = "";
                            TextBoxCuenta.Text = "";
                            ListBox1.Items.Clear();
                        }
                        else
                        {
                            Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "clave", "alert(' Cliente no encontrado ');", true);
                        }
                    }
                }
            }
            TextBoxTracking.Focus();

        }

        protected void ImageButton4_Click(object sender, ImageClickEventArgs e)
        {
            if (ListBox1.SelectedValue != "")
            {
                // EVALUAR COMILLA AL FINAL DEL TRACKING
                string cadena = TextBoxTracking.Text;
                string lastLetra = cadena.Substring(cadena.Length - 1, 1);
                if (lastLetra != ";") cadena = cadena + ";"; // SE EVALUA SI TERMNA EN COMILLA Y SINO SE LE PONE
                //---------
                string SqlString = "Update TBL_Package_Main set AWB = '" + TextBoxAWB.Text + "', Tracking = '" + cadena + "', Nombre_Congsinne = '" + ListBox1.SelectedValue + "', Box = '" + TextBoxCaja.Text + "', No_Cuenta = '" + TextBoxCuenta.Text + "', userShort = '" + Usuario.Text + "' where id_Package_Box = " + ID_Package.Text + ";";
                using (OleDbConnection conn = new OleDbConnection(Properties.Settings.Default.ConnectionStringMainBox))
                {
                    using (OleDbCommand MiComando = new OleDbCommand(SqlString, conn))
                    {
                        conn.Open();
                        int FilasAfectadas = MiComando.ExecuteNonQuery();
                        conn.Close();
                        GridView1.DataBind();
                        ImageButton3.Enabled = true;
                        TextBoxTracking.Text = "";
                        TextBoxCuenta.Text = "";
                        TextBoxAWB.Text = "";
                        TextBoxName.Text = "";
                        TextBoxCaja.Text = "";
                    }
                }
            }
            else
            {
                Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "clave", "alert(' Cliente no encontrado ');", true);
            }
            ListBox1.Items.Clear();
            TextBoxTracking.Focus();

        }

        protected void ImageButton5_Click(object sender, ImageClickEventArgs e)
        {
            string SqlString = "DELETE TBL_Package_Main.* FROM TBL_Package_Main where id_Package_Box = " + ID_Package.Text + ";";
            using (OleDbConnection conn = new OleDbConnection(Properties.Settings.Default.ConnectionStringMainBox))
            {
                using (OleDbCommand MiComando = new OleDbCommand(SqlString, conn))
                {
                    conn.Open();
                    int FilasAfectadas = MiComando.ExecuteNonQuery();
                    conn.Close();
                    GridView1.DataBind();
                    ImageButton3.Enabled = true;
                    TextBoxTracking.Text = "";
                    TextBoxCuenta.Text = "";
                    TextBoxAWB.Text = "";
                    TextBoxName.Text = "";
                    TextBoxCaja.Text = "";

                    Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "clave", "alert('RECORD REMOVED....');", true);

                    ImageButton5.Enabled = false;

                    ListBox1.Items.Clear();
                }
            }

        }

     
      
        }
   


 }
