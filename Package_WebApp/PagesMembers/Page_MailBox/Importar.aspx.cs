using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;
//using ScanCourier_Web.Properties;
using System.IO;




namespace Package_WebApp.PagesMembers.Page_MailBox
{
    public partial class Importar : System.Web.UI.Page
    {
        string carpeta;
        string aa;
        
        protected void Page_Load(object sender, EventArgs e)
        {
            actualizarGrisView2();
            Button1.Enabled = false;
            
            // donde guardamos el file
            carpeta = Path.Combine(Request.PhysicalApplicationPath, "Data_Import");
            Label2.Text = carpeta;
            Label3.Visible = false;
        }
        protected void actualizarGrisView2()
        {
            string mCodCuenta = DropDownCuenta.SelectedValue;
            
            string SQL_Pack_Main = "SELECT Cod_Cliente, Name_Cliente, Cuenta FROM tbl_Clientes";

            if (DropDownCuenta.SelectedValue != "")
            {
                SQL_Pack_Main = SQL_Pack_Main + " WHERE tbl_Clientes.Cuenta = " + DropDownCuenta.SelectedValue + ";";
            
            }
            OleDbConnection conn = new OleDbConnection(Properties.Settings.Default.ConnectionStringMainBox); // se establece conexion
            OleDbDataAdapter da = new OleDbDataAdapter(SQL_Pack_Main, conn);   // creo dataadapter
            System.Data.DataTable DT = new System.Data.DataTable();
            da.Fill(DT);
            GridView2.DataSource = DT;
            //GridView2.DataBind();
        }
        
        protected void SubirExcel_Click(object sender, ImageClickEventArgs e)
        {
            if (Label4.Text == "Label")
            {
                Label3.Text = "You have not selected and update any file";
                Label3.Visible = true;
            }
            else
            {
                string archivo = Path.GetFileName(FileUpload1.PostedFile.FileName);
                string mPath = Path.Combine(carpeta, Label4.Text);
                string conexion = "Provider=Microsoft.Jet.OLEDB.4.0;" + "Data Source=" + mPath + ";Extended Properties='Excel 8.0;'";
                //"Provider = Microsoft.ACE.OLEDB.12.0; Data Source =C:\\Cliente\\Clientes.xlsx; Extended Propiedades Excel = 12.0;";          //PARA EXCEL 2010 .XLSX
                // "Provider=Microsoft.Jet.OleDb.4.0; Data Source =C:\\Cliente\\Clientes.xls;Extended Properties=\"Excel 8.0; HDR=Yes\"";      //PARA EXCEL 2003 - 2007 .XLS

                OleDbConnection origen = default(OleDbConnection);
                origen = new OleDbConnection(conexion);

                OleDbCommand seleccion = default(OleDbCommand);
                seleccion = new OleDbCommand("Select * From [Sheet1$]", origen);

                OleDbDataAdapter adaptador = new OleDbDataAdapter();
                adaptador.SelectCommand = seleccion;

                System.Data.DataSet ds = new System.Data.DataSet();

                adaptador.Fill(ds);

                GridView1.DataSource = ds.Tables[0];
                GridView1.DataBind();
            }
 
        }
        
        protected void Insert_Click(object sender, EventArgs e)
        {
            
            string SqlString = "Insert Into tbl_Clientes (Cod_Cliente, Name_Cliente, Cuenta) Values (?, ?, ?)";
             {
                 using (OleDbConnection conn = new OleDbConnection(Properties.Settings.Default.ConnectionStringMainBox))
                {
                    using (OleDbCommand cmd = new OleDbCommand(SqlString, conn))
                    {
                        conn.Close();
                        cmd.CommandType = System.Data.CommandType.Text;

                        cmd.Parameters.Add("Cod_Cliente", OleDbType.VarChar);
                        cmd.Parameters.Add("Name_Cliente", OleDbType.VarChar);
                        cmd.Parameters.Add("Cuenta", OleDbType.VarChar);
                        foreach (GridViewRow row in GridView1.Rows)
                        {
                            cmd.Parameters[0].Value = row.Cells[0].Text;
                            cmd.Parameters[1].Value = row.Cells[1].Text;    //Convert.ToInt32(row.Cells[1].Text);
                            cmd.Parameters[2].Value = row.Cells[2].Text;
                            conn.Open();
                            cmd.ExecuteNonQuery();
                            conn.Close();
                        }
                    }
                }
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
             
            string SqlString = "DELETE tbl_Clientes.* FROM tbl_Clientes where Cuenta = " + DropDownCuenta.SelectedValue + ";";
            using (OleDbConnection conn = new OleDbConnection(Properties.Settings.Default.ConnectionStringMainBox))
               {
                   using (OleDbCommand MiComando = new OleDbCommand(SqlString, conn))
                   {
                       conn.Open();
                       int FilasAfectadas = MiComando.ExecuteNonQuery();
                       conn.Close();
                       GridView1.DataBind();


                       Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "clave", "alert('RECORD REMOVED....');", true);

                    }
                   Button1.Enabled = false;
                   actualizarGrisView2();
                   GridView2.DataBind();

               }
        }

        protected void ButtonFiltar_Click(object sender, EventArgs e)
        {
            actualizarGrisView2();
            GridView2.DataBind();
            Button1.Enabled = true;
        }

        protected void Button2_Click1(object sender, EventArgs e)
        {
            
            //verificar si se seleccionó el archivo
            if (FileUpload1.PostedFile.FileName == "")
            {
                Label3.Text = "You have not selected any file";
                Label3.Visible = true;
            }
            else
            {
               //verificar extencion
                string extension = Path.GetExtension(FileUpload1.PostedFile.FileName);
                switch (extension.ToLower())
                { 
                    //validar
                    case ".xls":
                    case ".xlsx":
                    break;
                    //no validamos
                    default:
                    Label3.Text = "Extension no valida";
                    return;
                }
                // Copiar archivo
                try
                {
                    string archivo = Path.GetFileName(FileUpload1.PostedFile.FileName);
                    
                    //nomble del archivo
                    Label3.Text = archivo;
                    string folder_final = Path.Combine(carpeta, archivo);
                    FileUpload1.PostedFile.SaveAs(folder_final);
                    Label3.Text = "File copied correctly";
                    Label4.Text = archivo;
                    

                    Label3.Visible = true;
                }

                catch (Exception ex)
                {
                    Label3.Text = "Error" + ex.Message;
                
                }

            }                   
        }

        public string archivo1 { get; set; }
    }
}