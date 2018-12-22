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
using MVP.Models.Helpers;

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
                UserEmailConfirmed = false,
                Seats = 0,
                Cost = 0,
                TicketCode = "#MYTICKETYO",
                TicketURL = "#",
                StartTime = DateTime.Now,
                ArrivalTime = DateTime.Now,
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
                                           .Include(d => d.Trip.Departure)
                                           .Include(r => r.Trip.Departure.Route)
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
                    var user = model.Users.FirstOrDefault(u => u.Id == booking.UserId);
                    var result = new ConfirmDTO
                    {
                        BookingId = booking.BookingId,
                        UserId = booking.UserId,
                        UserEmail = user.Email,
                        UserEmailConfirmed = user.EmailConfirmed,
                        UserContactName = user.ContactName,
                        UserMGMCode = user.MGMCode,
                        Seats = booking.Seats,
                        Cost = booking.Cost,
                        TicketCode = booking.TicketCode,
                        TicketURL = "#",
                        StartTime = booking.Trip.StartTime,
                        ArrivalTime = booking.Trip.StartTime +
                                      (model.Route.FirstOrDefault(r => r.RouteId == booking.Trip.Departure.Route.RouteId)?.Duration ?? TimeSpan.Zero) +
                                      (model.Departure.FirstOrDefault(d => d.DepartureId == booking.Trip.Departure.DepartureId)?.DurationModifier ?? TimeSpan.Zero) +
                                      (model.AccessPoint.FirstOrDefault(ap => ap.AccessPointId == booking.Trip.StartAccessPoint.AccessPointId)?.DurationModifier ?? TimeSpan.Zero) +
                                      (model.AccessPoint.FirstOrDefault(ap => ap.AccessPointId == booking.Trip.EndAccessPoint.AccessPointId)?.DurationModifier ?? TimeSpan.Zero),
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
                msg.Subject = Resources.LocalizedText.Confirm_Service_SendTicket_Email_Subject1 + " " + state.StartRegionName + " " + Resources.LocalizedText.Confirm_Service_SendTicket_Email_Subject2 + " " + state.EndRegionName + " " + Resources.LocalizedText.Confirm_Service_SendTicket_Email_Subject3;

                string body = Resources.LocalizedText.Confirm_Service_SendTicket_Email_Body_TripConfirmed + "<br />";
                body += Resources.LocalizedText.Confirm_Service_SendTicket_Email_Body_TicketCode + ": " + state.TicketCode.ToUpper() + "<br />";
                body += "<br />" + Resources.LocalizedText.Confirm_Service_SendTicket_Email_Body_Date + ": " + state.StartTime.ToString("F") + " &rarr; " + state.ArrivalTime.ToString("HH\\:mm\\:ss");
                body += "<br />" + Resources.LocalizedText.Confirm_Service_SendTicket_Email_Body_Origin + ": " + state.StartRegionName + " (<a href='" + state.StartAPLocation + "'>" + state.StartAPName + "</a>)";
                body += "<br />" + Resources.LocalizedText.Confirm_Service_SendTicket_Email_Body_Destination + ": " + state.EndRegionName + " (<a href='" + state.EndAPLocation + "'>" + state.EndAPName + "</a>)";
                body += "<br /><small>" + Resources.LocalizedText.Confirm_Service_SendTicket_Email_Body_SeeOnMap + "</small>";
                body += "<br />" + Resources.LocalizedText.Confirm_Service_SendTicket_Email_Body_Seats + ": " + state.Seats.ToString();
                body += "<br />" + Resources.LocalizedText.Confirm_Service_SendTicket_Email_Body_FinalCost + ": " + state.Cost.ToString("C", ApplicationHelpers.DefaultCulture());
                body += "<br />";
                body += "<br />" + Resources.LocalizedText.Confirm_Service_SendTicket_Email_Body_AccessTicket + " <a href='" + state.TicketURL + "'>" + Resources.LocalizedText.Confirm_Service_SendTicket_Email_HereLink + "</a>.";
                body += "<br />";
                body += "<br />" + Resources.LocalizedText.Confirm_Service_SendTicket_Email_Body_Invite + " <a href='" + state.InviteURL + "'>" + Resources.LocalizedText.Confirm_Service_SendTicket_Email_HereLink + "</a>.";
                body += "<br />";
                body += "<br />" + Resources.LocalizedText.Confirm_Service_SendTicket_Email_Body_ThankYou;
                body += "<br />" + Resources.LocalizedText.Confirm_Service_SendTicket_Email_Body_YoyoloopTeam;

                msg.Body = body;

                msg.To.Add(state.UserEmail);
                msg.Bcc.Add(WebConfigurationManager.AppSettings["EmailServiceBlindCopy"]);

                client.Send(msg);
            }
        }

        public void SendUnconfirmedTicket(ConfirmDTO state, string callbackUrl)
        {
            SmtpClient client = new SmtpClient();
            using (MailMessage msg = new MailMessage())
            {
                msg.IsBodyHtml = true;
                msg.Subject = Resources.LocalizedText.Confirm_Service_SendTicket_Email_Subject1 + " " + state.StartRegionName + " " + Resources.LocalizedText.Confirm_Service_SendTicket_Email_Subject2 + " " + state.EndRegionName + " " + Resources.LocalizedText.Confirm_Service_SendTicket_Email_Subject3;

                string body = Resources.LocalizedText.Confirm_Service_SendTicket_Email_Body_TripConfirmed + "<br />";
                body += Resources.LocalizedText.Confirm_Service_SendUnconfirmedTicket_Email_Body_ConfirmEmail + " <a href='" + callbackUrl + "'>" + Resources.LocalizedText.Confirm_Service_SendTicket_Email_HereLink + "</a>.<br />";
                body += "<br />";
                body += Resources.LocalizedText.Confirm_Service_SendUnconfirmedTicket_Email_Body_ConfirmWhy + "<br />";
                body += "<br />";
                body += "<ul><li>" + Resources.LocalizedText.Confirm_Service_SendUnconfirmedTicket_Email_Body_ConfirmAnswer + "</li></ul>";
                body += "<br />" + Resources.LocalizedText.Confirm_Service_SendTicket_Email_Body_Invite + " <a href='" + state.InviteURL + "'>" + Resources.LocalizedText.Confirm_Service_SendTicket_Email_HereLink + "</a>.";
                body += "<br />";
                body += "<br />" + Resources.LocalizedText.Confirm_Service_SendTicket_Email_Body_ThankYou;
                body += "<br />" + Resources.LocalizedText.Confirm_Service_SendTicket_Email_Body_YoyoloopTeam;

                msg.Body = body;

                msg.To.Add(state.UserEmail);
                msg.Bcc.Add(WebConfigurationManager.AppSettings["EmailServiceBlindCopy"]);

                client.Send(msg);
            }
        }
    }
}
