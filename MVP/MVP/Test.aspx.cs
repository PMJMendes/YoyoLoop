using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TheArtOfDev.HtmlRenderer.PdfSharp;

namespace MVP
{
    public partial class Test : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnDownload_Click(object sender, EventArgs e)
        {
            MemoryStream pdf = new MemoryStream(GetPDF());

            ScriptManager.RegisterStartupScript(this, this.GetType(), "downloadUnblock", "$.unblockUI();", true);
            Response.Clear();
            Response.ContentType = "application/pdf";
            Response.AddHeader("content-disposition", "attachment; filename=ticket.pdf");
            Response.Buffer = true;
            Response.BinaryWrite(pdf.ToArray());
            this.Context.ApplicationInstance.CompleteRequest();
        }

        public byte[] GetPDF()
        {
            StreamReader reader = new StreamReader(HttpContext.Current.Server.MapPath("/PDFTemplates/Ticket.html"));
            string html = reader.ReadToEnd();
            reader.Close();

            html = html.Replace("<%StartRegionName%>", "");
            html = html.Replace("<%StartAPName%>", "");
            html = html.Replace("<%EndRegionName%>", "");
            html = html.Replace("<%EndAPName%>", "");
            html = html.Replace("<%Date%>", "");
            html = html.Replace("<%Weekday%>", "");
            html = html.Replace("<%Time%>", "");
            html = html.Replace("<%Cost%>", "");
            html = html.Replace("<%TicketCode%>", "");
            html = html.Replace("<%Seats%>", "");

            return PdfSharpConvert(html);
        }

        public static Byte[] PdfSharpConvert(String html)
        {
            Byte[] result = null;
            using (MemoryStream ms = new MemoryStream())
            {
                var pdf = PdfGenerator.GeneratePdf(html, PdfSharp.PageSize.A4);
                pdf.Save(ms);
                result = ms.ToArray();
            }
            return result;
        }
    }
}