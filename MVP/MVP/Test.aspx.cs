using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MVP
{
	public partial class Test : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{

		}

        protected void btn_Click(object sender, EventArgs e)
        {
            SmtpClient client = new SmtpClient();
            MailMessage msg = new MailMessage();

            msg.To.Add(new MailAddress("rogerio.alecrim@outlook.com"));
            msg.Subject = "Test Subject";
            msg.Body = "This is a test email from yoyoloop web app";

            try
            {
                client.Send(msg);
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('" + ex.ToString() + "')", true);
            }
        }
    }
}