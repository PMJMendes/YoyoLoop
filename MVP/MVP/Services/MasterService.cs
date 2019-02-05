using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Globalization;
using System.Linq;
using System.Net.Mail;
using System.Threading;
using System.Web;
using System.Web.Configuration;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using Microsoft.Owin;
using MVP.Models;
using MVP.Models.Entities;
using MVP.Models.Helpers;

namespace MVP.Services
{
    public class MasterService
    {
        public enum ErrorCode
        {
            OK,
            NOPHONE
        }

        public SignInStatus LogIn (IOwinContext context, string email, string password, bool rememberme)
        {
            var manager = context.GetUserManager<ApplicationUserManager>();
            var signinManager = context.GetUserManager<ApplicationSignInManager>();

            var result = signinManager.PasswordSignIn(email, password, rememberme, shouldLockout: false);
            return result;
        }

        public void ForceLogIn(IOwinContext context, string userid)
        {
            var manager = context.GetUserManager<ApplicationUserManager>();
            var signinManager = context.GetUserManager<ApplicationSignInManager>();
            var user = manager.FindById(userid);

            signinManager.SignIn(user, false, false);
        }

        public IdentityResult CreateUser (IOwinContext context, Func<string, string, string> genCallbackUrl, string email, string password, string contactname, string phonenumber, out string userid)
        {
            var manager = context.GetUserManager<ApplicationUserManager>();
            var signInManager = context.Get<ApplicationSignInManager>();
            var user = new ApplicationUser() { UserName = email, Email = email, ContactName = contactname, PhoneNumber = phonenumber, CreationDate = DateTime.Now };
            IdentityResult result = manager.Create(user, password);
            if (result.Succeeded)
            {
                string code = manager.GenerateEmailConfirmationToken(user.Id);
                string callbackUrl = genCallbackUrl(code, user.Id);
                SendEmailConfirmation(user.Email, callbackUrl);

                signInManager.SignIn(user, isPersistent: false, rememberBrowser: false);
            }
            userid = user?.Id;
            return result;
        }

        public void SendEmailConfirmation(string email, string callbackUrl)
        {

            SmtpClient client = new SmtpClient();
            using (MailMessage msg = new MailMessage())
            {
                msg.IsBodyHtml = true;
                msg.Subject = Resources.LocalizedText.MasterService_SendEmailConfirmation_Subject;
                msg.Body = Resources.LocalizedText.MasterService_SendEmailConfirmation_Body_Title + "<br />";
                msg.Body += "<br />";
                msg.Body += Resources.LocalizedText.MasterService_SendEmailConfirmation_Body_ConfirmEmail + " <a href=\"" + callbackUrl + "\">" + Resources.LocalizedText.MasterService_SendEmailConfirmation_Body_HereLink + "</a>.<br />";
                msg.Body += "<br />";
                msg.Body += Resources.LocalizedText.MasterService_SendEmailConfirmation_Body_ConfirmWhy + "<br />";
                msg.Body += "<br />";
                msg.Body += "<ul><li>" + Resources.LocalizedText.MasterService_SendEmailConfirmation_Body_ConfirmAnswer + "</li></ul>";
                msg.Body += "<br />";
                msg.Body += Resources.LocalizedText.MasterService_SendEmailConfirmation_Body_Thankyou + "<br />";
                msg.Body += Resources.LocalizedText.MasterService_SendEmailConfirmation_Body_YoyoloopTeam;
                msg.To.Add(email);
                msg.Bcc.Add(WebConfigurationManager.AppSettings["EmailServiceBlindCopy"]);
                client.Send(msg);
            }
        }

        public void SendResetPassword(string email, string callbackUrl, string homepageUrl)
        {
            SmtpClient client = new SmtpClient();
            using (MailMessage msg = new MailMessage())
            {
                msg.IsBodyHtml = true;
                msg.Subject = Resources.LocalizedText.MasterService_SendResetPassword_Subject;
                msg.Body = Resources.LocalizedText.MasterService_SendResetPassword_Body_Title + " <a href=\"" + homepageUrl + "\">Yoyoloop</a>.<br />";
                msg.Body += "<br />";
                msg.Body += Resources.LocalizedText.MasterService_SendResetPassword_Body_ResetPassword + " <a href=\"" + callbackUrl + "\">" + Resources.LocalizedText.MasterService_SendResetPassword_Body_HereLink + "</a>.<br />";
                msg.Body += "<br />";
                msg.Body += Resources.LocalizedText.MasterService_SendResetPassword_Body_ResetWhy + "<br />";
                msg.Body += "<br />";
                msg.Body += "<ul><li>" + Resources.LocalizedText.MasterService_SendResetPassword_Body_ResetAnswer + "</li></ul>";
                msg.Body += "<br />";
                msg.Body += Resources.LocalizedText.MasterService_SendResetPassword_Body_Thankyou + "<br />";
                msg.Body += Resources.LocalizedText.MasterService_SendResetPassword_Body_YoyoloopTeam;
                msg.To.Add(msg.From);
                msg.Bcc.Add(email);
                msg.Bcc.Add(WebConfigurationManager.AppSettings["EmailServiceBlindCopy"]);
                client.Send(msg);
            }
        }

        public void CheckUpdater(string host)
        {
            using (var model = new EntityModel())
            {
                if(model.UpdateService.First().Warning)
                {
                    return;
                }
                var lastrun = model.UpdateService.First().LastRun;
                var elapsed = DateTime.Now - lastrun;
                var threshold = model.UpdateService.First().WarningThreshold;
                if (elapsed > threshold)
                {
                    SendWarning("Host: " + host + "<br>Update task hasn't run in over " + threshold.ToString("mm") + " minutes.<br>LastRun: " + lastrun.ToString("F", ApplicationHelpers.DefaultCulture()));
                    model.UpdateService.First().Warning = true;
                    model.SaveChanges();
                }
            }
        }

        public void MasterUpdate()
        {
            using (var model = new EntityModel())
            {
                model.UpdateService.First().LastRun = DateTime.Now;
                model.UpdateService.First().Warning = false;
                CheckBooked(model);
                CheckClosed(model);
                if(model.UpdateService.First().LastDaily != DateTime.Today)
                {
                    CheckDaily(model);
                    Cleanup(model);
                }
                model.SaveChanges();
            }
        }

        private void CheckBooked(EntityModel model)
        {
            var threshold = DateTime.Now + model.Settings.Select(s => s.MinTimeBookLastMinute).First();
            var trips = model.Trip.Include(t => t.Bookings).Where(t => t.Status == TripStatus.BOOKED && t.StartTime < threshold);

            if (!trips.Any())
            {
                return;
            }

            foreach (Trip t in trips)
            {
                t.Status = TripStatus.CLOSED;
                foreach (Booking b in t.Bookings.Where(b => b.Status == BookingStatus.PENDING))
                {
                    b.Status = BookingStatus.CANCELLED;
                }
                SendPassengerList(t.TripId);
            }
        }

        private void CheckClosed(EntityModel model)
        {
            var now = DateTime.Now;
            var trips = model.Trip.Include(t => t.Bookings).Where(t => t.Status == TripStatus.CLOSED && t.StartTime < now);

            if (!trips.Any())
            {
                return;
            }

            foreach (Trip t in trips)
            {
                t.Status = TripStatus.COMPLETED;
                foreach (Booking b in t.Bookings.Where(b => b.Status == BookingStatus.BOOKED))
                {
                    b.Status = BookingStatus.COMPLETED;
                }
            }
        }

        private void CheckDaily(EntityModel model)
        {
            var tomorrow = DateTime.Today.AddDays(1);
            List<Trip> trips = model.Trip.Include(t => t.StartAccessPoint).Include(ap => ap.StartAccessPoint.Region)
                                         .Include(t => t.EndAccessPoint).Include(ap => ap.EndAccessPoint.Region)
                                         .Include(t => t.Driver)
                                         .Include(t => t.Bookings)
                                         .Include(t => t.Departure)
                                         .Where(t => DbFunctions.TruncateTime(t.StartTime) == tomorrow && t.Status == TripStatus.BOOKED).ToList();
            if(SendDailyList(tomorrow, trips, model.Settings.Select(s => s.VehicleCapacity).First()))
            {
                model.UpdateService.First().LastDaily = DateTime.Today;
            }
            SendTripDetails(trips);
        }

        private void Cleanup(EntityModel model)
        {
            // This method shouldn't be needed. It cleans up status on both Trips and Bookings that should never have gotten to that state.
            // Maybe keep it as a manual method to be called from the Update page.

            foreach(Trip t in model.Trip.Include(t => t.Bookings).Where(t => (t.Status != TripStatus.CANCELLED || t.Status != TripStatus.COMPLETED) && t.StartTime < DateTime.Now))
            {
                if(t.Status == TripStatus.PENDING)
                {
                    t.Status = TripStatus.CANCELLED;
                    foreach(Booking b in t.Bookings)
                    {
                        b.Status = BookingStatus.CANCELLED;
                    }
                }
                else if(t.Status == TripStatus.BOOKED || t.Status == TripStatus.CLOSED)
                {
                    t.Status = TripStatus.COMPLETED;
                    foreach(Booking b in t.Bookings.Where(b => b.Status != BookingStatus.CANCELLED))
                    {
                        b.Status = BookingStatus.COMPLETED;
                    }
                }
            }

            foreach (Booking b in model.Booking.Include(b => b.Trip).Where(b => (b.Status != BookingStatus.CANCELLED || b.Status != BookingStatus.COMPLETED) && b.Trip.StartTime < DateTime.Now))
            {
                if(b.Status == BookingStatus.PENDING)
                {
                    b.Status = BookingStatus.CANCELLED;
                }
                else if(b.Status == BookingStatus.BOOKED)
                {
                    if(b.Trip.Status == TripStatus.CANCELLED)
                    {
                        b.Status = BookingStatus.CANCELLED;
                    }
                    else
                    {
                        b.Status = BookingStatus.COMPLETED;
                    }
                }
            }
        }

        public void SendTripDetails(List<Trip> trips)
        {
            using (var model = new EntityModel())
            {
                foreach (Trip t in trips.Where(t => t.Driver != null ))
                {
                    foreach (Booking b in t.Bookings.Where(b => b.Status == BookingStatus.BOOKED))
                    {
                        SendClientTripDetails(t, b, model.Users.FirstOrDefault(u => u.Id == b.UserId).Email);
                    }
                }
            }
        }

        public void SendClientTripDetails(Trip trip, Booking booking, string useremail)
        {
            // WE HAVE NO WAY OF STORING USER LANGUAGE SO WE'RE SETTING THREAD TO PT FOR NOW
            Thread.CurrentThread.CurrentCulture = new CultureInfo("pt-PT", false);
            Thread.CurrentThread.CurrentUICulture = new CultureInfo("pt-PT", false);

            SmtpClient client = new SmtpClient();
            using (MailMessage msg = new MailMessage())
            {
                msg.IsBodyHtml = true;
                msg.Subject = "Detalhes da sua viagem de amanhã com a YoYoLoop";

                string body = "Estimado(a) cliente,";
                body += "<br />" + "junto enviamos os detalhes da sua viagem de amanhã com a " + "<a href='https://www.yoyoloop.com/'>YoYoLoop</a>.<br />";
                body += "<br />" + Resources.LocalizedText.Confirm_Service_SendTicket_Email_Body_Date + ": " + trip.StartTime.ToString("F");
                body += "<br />" + Resources.LocalizedText.Confirm_Service_SendTicket_Email_Body_Origin + ": " + trip.StartAccessPoint.Region.Name + " (<a href='" + trip.StartAccessPoint.GoogleLocation + "'>" + trip.StartAccessPoint.Name + "</a>)";
                body += "<br />" + Resources.LocalizedText.Confirm_Service_SendTicket_Email_Body_Destination + ": " + trip.EndAccessPoint.Region.Name + " (<a href='" + trip.EndAccessPoint.GoogleLocation + "'>" + trip.EndAccessPoint.Name + "</a>)";
                body += "<br /><small>" + Resources.LocalizedText.Confirm_Service_SendTicket_Email_Body_SeeOnMap + "</small>";
                body += "<br />";
                body += "<br />" + "<strong><u>Contacto do Motorista:</u></strong>";
                body += "<br />" + "<strong>" + trip.Driver.Name + ": " + trip.Driver.Phone + "</strong>";
                body += "<br />";
                body += "<br />" + Resources.LocalizedText.Confirm_Service_SendTicket_Email_Body_AccessTicket + " <a href='https://www.yoyoloop.com/Ticket/Ticket?Id=" + booking.BookingId + "'>" + Resources.LocalizedText.Confirm_Service_SendTicket_Email_HereLink + "</a>.";
                body += "<br />";
                body += "<br />" + Resources.LocalizedText.Confirm_Service_SendTicket_Email_Body_Invite + " <a href='https://www.yoyoloop.com/Profile/Invite'>" + Resources.LocalizedText.Confirm_Service_SendTicket_Email_HereLink + "</a>.";
                body += "<br />";
                body += "<br />" + Resources.LocalizedText.Confirm_Service_SendTicket_Email_Body_ThankYou;
                body += "<br />" + Resources.LocalizedText.Confirm_Service_SendTicket_Email_Body_YoyoloopTeam;

                msg.Body = body;

                msg.To.Add(useremail);
                msg.ReplyToList.Add(WebConfigurationManager.AppSettings["ReservationsProviderEmail"]);
                msg.Bcc.Add(WebConfigurationManager.AppSettings["EmailServiceBlindCopy"]);

                client.Send(msg);
            }

        }

        public bool SendDailyList(DateTime date, List<Trip> trips, int capacity)
        {
            // THIS IS AN INTERNAL EMAIL - NOT TRANSLATED AT THIS POINT

            SmtpClient client = new SmtpClient();
            using (MailMessage msg = new MailMessage())
            {
                msg.IsBodyHtml = true;
                msg.Subject = "[YOYOLOOP] Lista de Viagens - " + date.ToString("D", ApplicationHelpers.DefaultCulture());
                string body = string.Empty;

                if (!trips.Any())
                {
                    body += "<br>Não há viagens para " + date.ToString("D", ApplicationHelpers.DefaultCulture());
                }
                else
                {
                    body += "<br>Viagens para " + date.ToString("D", ApplicationHelpers.DefaultCulture()) + ":";
                    body += "<br>";
                    body += "<br>";
                    trips = trips.OrderBy(t => t.StartTime).ToList();
                    foreach (Trip t in trips)
                    {
                        int ocup = t.Bookings.Where(b => b.Status == BookingStatus.BOOKED).Sum(b => b.Seats);
                        int free = capacity - ocup;
                        body += t.StartTime.ToShortTimeString() + " > " + t.StartAccessPoint.Region.Name + " (" + t.StartAccessPoint.Name + ") para " + t.EndAccessPoint.Region.Name + " (" + t.EndAccessPoint.Name + ")";
                        body += "<br>";
                        body += "&nbsp;&nbsp;&nbsp;&nbsp;Lugares: " + capacity.ToString() + " total, " + ocup.ToString() + " vendidos, " + free.ToString() + " disponíveis";
                        body += "<br>";
                        body += "<br>";
                    }
                }

                msg.Body = body;

                msg.To.Add(WebConfigurationManager.AppSettings["OperationsProviderEmail"]);
                msg.Bcc.Add(WebConfigurationManager.AppSettings["EmailServiceBlindCopy"]);

                try
                {
                    client.Send(msg);
                    return true;
                }
                catch (Exception ex)
                {
                    SendWarning(ex.Message);
                    return false;
                }
            }
        }

        public void SendPassengerList(Guid tripid)
        {
            // THIS IS AN INTERNAL EMAIL - NOT TRANSLATED AT THIS POINT

            SmtpClient client = new SmtpClient();
            using (MailMessage msg = new MailMessage())
            {
                msg.IsBodyHtml = true;
                msg.Subject = "[YOYOLOOP] Lista de Passageiros - Viagem: " + tripid.ToString().Substring(0, 8);

                string body = string.Empty;

                using (var model = new EntityModel())
                {
                    var trip = model.Trip.Include(t => t.Bookings)
                                         .Include(t => t.StartAccessPoint).Include(ap => ap.StartAccessPoint.Region)
                                         .Include(t => t.EndAccessPoint).Include(ap => ap.EndAccessPoint.Region)
                                         .SingleOrDefault(t => t.TripId == tripid);
                    int capacity = model.Settings.Select(s => s.VehicleCapacity).First();
                    int ocup = trip.Bookings.Where(b => b.Status == BookingStatus.BOOKED).Sum(b => b.Seats);
                    int free = capacity - ocup;

                    body += "<br />DETALHES DA VIAGEM:";
                    body += "<br />Origem: " + trip.StartAccessPoint.Region.Name + " (<a href='" + trip.StartAccessPoint.GoogleLocation + "'>" + trip.StartAccessPoint.Name + "</a>)";
                    body += "<br />Destino: " + trip.EndAccessPoint.Region.Name + " (<a href='" + trip.EndAccessPoint.GoogleLocation + "'>" + trip.EndAccessPoint.Name + "</a>)";
                    body += "<br />Hora: " + trip.StartTime.ToString("F", ApplicationHelpers.DefaultCulture());
                    body += "<br />";
                    body += "<br />OCUPAÇÃO:";
                    body += "<br />Total de lugares: " + capacity.ToString();
                    body += "<br />Lugares ocupados: " + ocup.ToString();
                    body += "<br />Lugares disponíveis para venda: " + free.ToString();
                    body += "<br />";
                    body += "<br />PASSAGEIROS:";
                    foreach (Booking b in trip.Bookings.Where(b => b.Status == BookingStatus.BOOKED))
                    {
                        string contactname = model.Users.SingleOrDefault(u => u.Id == b.UserId)?.ContactName;
                        string username = model.Users.SingleOrDefault(u => u.Id == b.UserId)?.UserName;
                        body += "<br />" + contactname + " (" + username + "), " + b.Seats.ToString() + " lugar(es), Codigo: " + b.TicketCode.ToUpper();
                        body += "<br />";
                    }
                }

                msg.Body = body;

                msg.To.Add(WebConfigurationManager.AppSettings["OperationsProviderEmail"]);
                msg.Bcc.Add(WebConfigurationManager.AppSettings["EmailServiceBlindCopy"]);

                client.Send(msg);
            }
        }

        private void SendWarning(string warning)
        {
            SmtpClient client = new SmtpClient();
            using (MailMessage msg = new MailMessage())
            {
                msg.IsBodyHtml = true;
                msg.Subject = "[YOYOLOOP] System Warning";
                string body = string.Empty;

                body += warning + "<br>";

                msg.Body = body;

                msg.To.Add(WebConfigurationManager.AppSettings["SystemsProviderEmail"]);
                msg.Bcc.Add(WebConfigurationManager.AppSettings["EmailServiceBlindCopy"]);

                client.Send(msg);
            }
        }

        public void SendSuggestion(string senderemail, string text)
        {
            // THIS IS AN INTERNAL EMAIL - NOT TRANSLATED AT THIS POINT

            SmtpClient client = new SmtpClient();
            using (MailMessage msg = new MailMessage())
            {
                msg.IsBodyHtml = true;
                msg.Subject = "[YOYOLOOP] Sugestão de Loop";
                string body = string.Empty;

                body += "Sugestão enviada por: " + senderemail + "<br>";
                body += "<br>";
                body += "Mensagem: " + "<br>";
                body += text;

                msg.Body = body;

                msg.To.Add(WebConfigurationManager.AppSettings["SuggestionProviderEmail"]);
                msg.Bcc.Add(WebConfigurationManager.AppSettings["EmailServiceBlindCopy"]);

                client.Send(msg);
            }
        }

        public void SendContactMessage(string senderName, string senderEmail, string senderSubject, string senderBody)
        {
            // THIS IS AN INTERNAL EMAIL - NOT TRANSLATED AT THIS POINT

            SmtpClient client = new SmtpClient();
            using (MailMessage msg = new MailMessage())
            {
                msg.IsBodyHtml = true;
                msg.Subject = "[YOYOLOOP] Mensagem Recebida";
                string body = string.Empty;

                body += "Mensagem enviada por: " + senderName + " (" + senderEmail + ")" + "<br>";
                body += "<br>";
                body += "Assunto: " + senderSubject + "<br>";
                body += "<br>";
                body += "Mensagem: " + "<br>";
                body += senderBody;

                msg.Body = body;

                msg.To.Add(WebConfigurationManager.AppSettings["ContactProviderEmail"]);
                msg.Bcc.Add(WebConfigurationManager.AppSettings["EmailServiceBlindCopy"]);

                client.Send(msg);
            }
        }
    }
}
