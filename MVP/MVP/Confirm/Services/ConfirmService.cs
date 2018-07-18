using MVP.Models;
using MVP.Models.Entities;
using MVP.Confirm;
using System;
using System.Web;
using System.Data.Entity;
using System.Linq;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using System.Net.Mail;
using System.Web.UI.WebControls;
using System.Collections.Specialized;
using System.IO;
using System.Web.UI;
using TheArtOfDev.HtmlRenderer.PdfSharp;

namespace MVP.Services
{
    public class ConfirmService
    {
        public ConfirmDTO GetInitialData()
        {
            var result = new ConfirmDTO
            {
                BookingId = Guid.Empty,
                UserId = "",
                UserEmail = "email@email.com",
                Seats = 0,
                Cost = 0,
                TicketCode = "#MYTICKETYO",
                StartTime = DateTime.Now,
                StartRegionName = "Start Region",
                StartAPName = "Start AP",
                EndRegionName = "End Region",
                EndAPName = "End AP"
            };
            return result;
        }

        public ConfirmDTO GetBooking(Guid id)
        {
            using (var model = new EntityModel())
            {
                var booking = model.Booking.Where(b => b.BookingId == id && b.Status == BookingStatus.BOOKED)
                                           .Include(t => t.Trip)
                                           .Include(sap => sap.Trip.StartAccessPoint)
                                           .Include(dap => dap.Trip.EndAccessPoint)
                                           .Include(sr => sr.Trip.StartAccessPoint.Region)
                                           .Include(er => er.Trip.EndAccessPoint.Region)
                                           .FirstOrDefault();
                if (booking == null)
                {
                    return null;
                }
                else
                {
                    var result = new ConfirmDTO
                    {
                        BookingId = booking.BookingId,
                        UserId = booking.UserId,
                        UserEmail = HttpContext.Current.GetOwinContext().GetUserManager<ApplicationUserManager>().FindById(booking.UserId).Email,
                        Seats = booking.Seats,
                        Cost = booking.Cost,
                        TicketCode = booking.TicketCode,
                        StartTime = booking.Trip.StartTime,
                        StartRegionName = booking.Trip.StartAccessPoint.Region.Name,
                        StartAPName = booking.Trip.StartAccessPoint.Name,
                        EndRegionName = booking.Trip.EndAccessPoint.Region.Name,
                        EndAPName = booking.Trip.EndAccessPoint.Name
                    };
                    return result;
                }
            }
        }

        public void SendTicket(ConfirmDTO state)
        {

            SmtpClient client = new SmtpClient();
            MailDefinition md = new MailDefinition
            {
                IsBodyHtml = true,
                Subject = "A sua viagem está confirmada"
            };

            ListDictionary fill_in = new ListDictionary();
            fill_in.Add("<%StartRegionName%>", state.StartRegionName.ToUpper());
            fill_in.Add("<%StartAPName%>", state.StartAPName);
            fill_in.Add("<%EndRegionName%>", state.EndRegionName.ToUpper());
            fill_in.Add("<%EndAPName%>", state.EndAPName);
            fill_in.Add("<%Date%>", state.StartTime.ToString("dd MMMM").ToUpper());
            fill_in.Add("<%Weekday%>", state.StartTime.ToString("ddd").ToUpper());
            fill_in.Add("<%Time%>", state.StartTime.ToString("HH\\:mm"));
            fill_in.Add("<%Cost%>", state.Cost.ToString("C"));
            fill_in.Add("<%TicketCode%>", state.TicketCode.ToUpper());
            fill_in.Add("<%Seats%>", state.Seats.ToString() + " " + (state.Seats == 1 ? "Lugar" : "Lugares"));

            StreamReader reader = new StreamReader(HttpContext.Current.Server.MapPath("/EmailTemplates/Ticket.html"));
            string body = reader.ReadToEnd();
            reader.Close();

            MailMessage msg = md.CreateMailMessage(state.UserEmail, fill_in, body, new Control());

            try
            {
                client.Send(msg);
            }
            finally
            {
                if (msg != null)
                {
                    msg.Dispose();
                }
            }
        }

        public byte [] GetPDF (ConfirmDTO state)
        {
            StreamReader reader = new StreamReader(HttpContext.Current.Server.MapPath("/PDFTemplates/Ticket.html"));
            string html = reader.ReadToEnd();
            reader.Close();

            html = html.Replace("<%StartRegionName%>", state.StartRegionName.ToUpper());
            html = html.Replace("<%StartAPName%>", state.StartAPName);
            html = html.Replace("<%EndRegionName%>", state.EndRegionName.ToUpper());
            html = html.Replace("<%EndAPName%>", state.EndAPName);
            html = html.Replace("<%Date%>", state.StartTime.ToString("dd MMMM").ToUpper());
            html = html.Replace("<%Weekday%>", state.StartTime.ToString("ddd").ToUpper());
            html = html.Replace("<%Time%>", state.StartTime.ToString("HH\\:mm"));
            html = html.Replace("<%Cost%>", state.Cost.ToString("C"));
            html = html.Replace("<%TicketCode%>", state.TicketCode.ToUpper());
            html = html.Replace("<%Seats%>", state.Seats.ToString() + " " + (state.Seats == 1 ? "Lugar" : "Lugares"));

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
