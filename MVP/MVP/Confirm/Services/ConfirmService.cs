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
                StartAPLocation = "#",
                EndRegionName = "End Region",
                EndAPName = "End AP",
                EndAPLocation = "#"
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
                        StartAPLocation = booking.Trip.StartAccessPoint.GoogleLocation,
                        EndRegionName = booking.Trip.EndAccessPoint.Region.Name,
                        EndAPName = booking.Trip.EndAccessPoint.Name,
                        EndAPLocation = booking.Trip.EndAccessPoint.GoogleLocation,
                        InviteURL = "#"
                    };
                    return result;
                }
            }
        }

        public void SendTicket(ConfirmDTO state)
        {
            SmtpClient client = new SmtpClient();
            using (MailMessage msg = new MailMessage())
            {
                msg.IsBodyHtml = true;
                msg.Subject = "A tua viagem de " + state.StartRegionName + " para " + state.EndRegionName + " está confirmada";

                string body = "A tua viagem está confirmada.<br />";
                body += "Código do bilhete: " + state.TicketCode.ToUpper() + "<br />";
                body += "<br />Data: " + state.StartTime.ToString("R");
                body += "<br />Origem: " + state.StartRegionName + " (<a href='" + state.StartAPLocation + "'>" + state.StartAPName + "</a>)";
                body += "<br />Destino: " + state.EndRegionName + " (<a href='" + state.EndAPLocation + "'>" + state.EndAPName + "</a>)";
                body += "<br />Lugares: " + state.Seats.ToString();
                body += "<br />Preço Final: " + state.Cost.ToString("C");
                body += "<br />";
                body += "<br />Podes aceder ao teu bilhete em qualquer altura <a href='" + state.TicketURL + "'>aqui</a>.";
                body += "<br />";
                body += "<br />Convida amigos e viaja a 3€ <a href='" + state.InviteURL + "'>aqui</a>.";
                body += "<br />";
                body += "<br />Obrigado pela tua preferência!";
                body += "<br />A equipa Yoyoloop.";

                msg.Body = body;

                msg.To.Add(state.UserEmail);
                msg.Bcc.Add(WebConfigurationManager.AppSettings["EmailServiceBlindCopy"]);

                client.Send(msg);
            }
        }
    }
}
