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
using System.Web.Configuration;

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
                TicketURL = "#",
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
                        UserContactName = HttpContext.Current.GetOwinContext().GetUserManager<ApplicationUserManager>().FindById(booking.UserId).ContactName,
                        Seats = booking.Seats,
                        Cost = booking.Cost,
                        TicketCode = booking.TicketCode,
                        TicketURL = "#",
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
            MailMessage msg = new MailMessage
            {
                IsBodyHtml = true
            };

            msg.Subject = "A sua viagem de " + state.StartRegionName + " para " + state.EndRegionName + " está confirmada";

            string body = "Caro " + state.UserContactName + ",";
            body += "<br />";
            body += "<br />A sua viagem está confirmada.<br />";
            body += "<br />Código do bilhete: <h1>" + state.TicketCode.ToUpper() + "</h1>";
            body += "<br />DETALHES DA VIAGEM:";
            body += "<br />Origem: " + state.StartRegionName + " (" + state.StartAPName + ")";
            body += "<br />Destino: " + state.EndRegionName + " (" + state.EndAPName + ")";
            body += "<br />Hora: " + state.StartTime.ToString("R");
            body += "<br />Lugares: " + state.Seats.ToString();
            body += "<br />";
            body += "<br />Pode fazer download do seu bilhete <a href=\"" + state.TicketURL + "\">aqui</a>.";

            msg.Body = body;

            msg.To.Add(state.UserEmail);
            msg.Bcc.Add(WebConfigurationManager.AppSettings["EmailServiceBlindCopy"]);

            try
            {
                client.Send(msg);
            }
            finally
            {
                msg?.Dispose();
            }
        }
    }
}
