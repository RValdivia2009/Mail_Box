<html>
<head id="Head1" runat="server">
    <title>Página sin título</title>
    <style type="text/css">
        #prueba
        {
            height: 453px;
        }
        #Form2
        {
            height: 432px;
        }
    </style>
    <script language="javascript" type="text/javascript">
// <![CDATA[

        function btnUploadTheFile_onclick() {

        }

// ]]>
    </script>
</head>
<body>
<script language="C#" runat="server">
    void btnUploadTheFile_Click(object Source, EventArgs evArgs)
    {
        string invento = txtServername.Value;
        string strFileNameOnServer = txtServername.Value;
        string strBaseLocation = "la ruta donde lo guardas";

        if ("" == invento)
        {
            txtOutput.InnerHtml = "Error - a file name must be specified.";
            return;
        }

        if (null != uplTheFile.PostedFile)
        {
            try
            {
                uplTheFile.PostedFile.SaveAs(strBaseLocation + invento);
                txtOutput.InnerHtml = "File <b>" + strBaseLocation + invento + "</b> uploaded successfully";
            }
            catch (Exception e)
            {
                txtOutput.InnerHtml = "Error saving <b>" +
                  strBaseLocation + "Web.config" + "</b><br>" + e.ToString();
            }
        }
    }
    void btnEnviar_Click(object Source, EventArgs evArgs)
    {
        string invento = txtServername.Value;
        string strFileNameOnServer = txtServername.Value;
        string strBaseLocation = "ruta donde se guarda el archivo en el servidor";

        System.Net.Mail.MailMessage msg = new System.Net.Mail.MailMessage();

        msg.To.Add(txtMail.Text);
        msg.From = new System.Net.Mail.MailAddress("correo", "tu nombre", System.Text.Encoding.UTF8);
        msg.Subject = txtNombre.Text;
        msg.SubjectEncoding = System.Text.Encoding.UTF8;
        msg.Body = txtMensaje.Text;
        msg.BodyEncoding = System.Text.Encoding.UTF8;
        msg.IsBodyHtml = false;

        System.Net.Mail.SmtpClient client = new System.Net.Mail.SmtpClient();
        client.Credentials = new System.Net.NetworkCredential("correo", "contraseña");
        client.Port = 25;
        client.Host = "smtp.live.com";
        client.EnableSsl = true;


        //Subir el fichero
        try
        {
            System.Net.Mail.Attachment MiFichero = new System.Net.Mail.Attachment(strBaseLocation + invento);
            msg.Attachments.Add(MiFichero);
            lbErrorEnviar.Text = "Se a adjuntado el archivo correctamente.";
        }
        catch (Exception ex)
        {
            lbErrorEnviar.Text = "No se a adjuntado ningún archivo.";
        }

        //Envio
        try
        {
            client.Send(msg);
            lbError.Text = "El E-Mail se a enviado correctamente.";
        }
        catch (System.Net.Mail.SmtpException ex)
        {
            lbError.Text = "No se a podido enviar el correo.";
        }
    }
</script>
<div id="prueba">
<form id="Form2" enctype="multipart/form-data" runat="server">


  <p />&nbsp;<p />Nombre:
  <asp:TextBox ID="txtNombre" runat="server"></asp:TextBox>
        <p />E-Mail:<asp:TextBox ID="txtMail" runat="server"></asp:TextBox>
        <p />Mensaje:<asp:DropDownList ID="DropDownList1" runat="server">
            </asp:DropDownList>
  <p />:<asp:TextBox ID="txtMensaje" runat="server" Height="91px" 
            TextMode="MultiLine" CausesValidation="True"></asp:TextBox>
        <asp:DropDownList ID="DropDownList2" runat="server">
      </asp:DropDownList>
        <p />Adjuntar archivos: 
            <input id="uplTheFile" type="file" runat="server" onchange="this.form.txtServername.value=this.value" onclick="return uplTheFile_onclick()"/>&nbsp; 
            <input id="txtServername" type="text" runat="server"/>
            <input type="button" id="btnUploadTheFile" value="Upload" OnServerClick="btnUploadTheFile_Click" runat="server" onclick="return btnUploadTheFile_onclick()" />
            <p />
            <input type="button" id="btnEnviar" value="Enviar" OnServerClick="btnEnviar_Click" runat="server"/>
         <p />
            <asp:Label ID="lbErrorEnviar" runat="server"></asp:Label>
         <p />
            <asp:Label ID="lbError" runat="server"></asp:Label>

</form>

    
<span id="txtOutput" style="font: 8pt verdana;" runat="server" />
</div>
</body>
</html>

