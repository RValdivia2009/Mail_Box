using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;
using Package_WebApp.Properties;


namespace Package_WebApp
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //Froms.frm_Scaning princ = new Froms.frm_Scaning();
        }
        protected void button_aceptar_Click(object sender, EventArgs e)
        {
            OleDbConnection cn = new OleDbConnection(Properties.Settings.Default.ConnectionStringMainBox);

            try
            {
                OleDbCommand cmd = new OleDbCommand("select user_name, user_ID, user_password, user_Lavel, usuario FROM Login WHERE user_ID = " + comboBox1.SelectedValue + " ", cn);
                cn.Open();
                cmd.ExecuteNonQuery();

                System.Data.DataSet ds = new System.Data.DataSet();
                OleDbDataAdapter da = new OleDbDataAdapter(cmd);
                da.Fill(ds, "Login");
                System.Data.DataRow dr;
                dr = ds.Tables["Login"].Rows[0];
                // dr = ds.Tables["Login"].Rows. sq


                if ((comboBox1.SelectedValue == dr["user_ID"].ToString()) & (textBox_password.Text == dr["user_password"].ToString()))
                {

                    string Nombre = dr["user_name"].ToString();
                    string Usuario = dr["usuario"].ToString();
                    string Password = dr["user_password"].ToString();
                    string Lavel_Access = dr["user_Lavel"].ToString();
                    // String Id = dr["user_ID"].ToString();

                    //  Hacer lo mismo pero guardando los valores en la session
                    Session.Add("user", Nombre);
                    Session.Add("userShort", Usuario);
                    Session.Add("N_lavel", Lavel_Access);


                    //redireccionamos
                    Response.Redirect("PagesMembers/Page_MailBox/frm_ScaningNew.aspx");
                    //en la siguiente recuperamos los valores
                    string user = (string)Session["user"];
                    // string pwd = (string)Session["pwd"];
                    //borramos las vars de la sesion
                    Session.Remove("user"); //etc...
                }
                else
                {
                    Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "clave", "alert(' Error, en Username or Password, intentelo de nuevo ');", true);
                }

            }

            finally
            {

            }

        }

          protected void button_salir_Click1(object sender, EventArgs e)
        {

        }
      
    }
}