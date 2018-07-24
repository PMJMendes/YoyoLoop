using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.Configuration;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using Microsoft.Owin;
using MVP.Models;
using MVP.Models.Entities;

namespace MVP.Services
{
    public class MasterService
    {
        public SignInStatus LogIn (IOwinContext context, string email, string password, bool rememberme)
        {
            var manager = context.GetUserManager<ApplicationUserManager>();
            var signinManager = context.GetUserManager<ApplicationSignInManager>();

            // This doen't count login failures towards account lockout
            // To enable password failures to trigger lockout, change to shouldLockout: true
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

        public IdentityResult CreateUser (IOwinContext context, Func<string, string, string> genCallbackUrl, string email, string password, string contactname)
        {
            var manager = context.GetUserManager<ApplicationUserManager>();
            var signInManager = context.Get<ApplicationSignInManager>();
            var user = new ApplicationUser() { UserName = email, Email = email, ContactName = contactname };
            IdentityResult result = manager.Create(user, password);
            if (result.Succeeded)
            {
                string code = manager.GenerateEmailConfirmationToken(user.Id);
                string callbackUrl = genCallbackUrl(code, user.Id);
                SendEmailConfirmation(user.Email, callbackUrl);

                signInManager.SignIn(user, isPersistent: false, rememberBrowser: false);
            }
            return result;
        }

        public void SendEmailConfirmation(string email, string callbackUrl)
        {

            SmtpClient client = new SmtpClient();
            MailMessage msg = new MailMessage
            {
                Subject = "[YOYOLOOP] Please confirm your email",
                Body = "Please confirm your email by clicking <a href=\"" + callbackUrl + "\">here</a>.",
                IsBodyHtml = true
            };

            msg.To.Add(email);
            msg.Bcc.Add(WebConfigurationManager.AppSettings["EmailServiceBlindCopy"]);

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

        public void SendResetPassword(string email, string callbackUrl)
        {
            SmtpClient client = new SmtpClient();
            MailMessage msg = new MailMessage
            {
                Subject = "[YOYOLOOP] Password reset confirmation",
                Body = "Please reset your password by clicking <a href=\"" + callbackUrl + "\">here</a>.",
                IsBodyHtml = true
            };

            msg.To.Add(msg.From);
            msg.Bcc.Add(email);
            msg.Bcc.Add(WebConfigurationManager.AppSettings["EmailServiceBlindCopy"]);

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
                    SendWarning("Host: " + host + "\r\nUpdate task hasn't run in over " + threshold.ToString("mm") + " minutes.\r\nLastRun: " + lastrun.ToString("R"));
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
                                         .Include(t => t.Bookings)
                                         .Where(t => DbFunctions.TruncateTime(t.StartTime) == tomorrow && t.Status == TripStatus.BOOKED).ToList();
            if(SendDailyList(tomorrow, trips, model.Settings.Select(s => s.VehicleCapacity).First()))
            {
                model.UpdateService.First().LastDaily = DateTime.Today;
            }
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

        public bool SendDailyList(DateTime date, List<Trip> trips, int capacity)
        {
            SmtpClient client = new SmtpClient();
            MailMessage msg = new MailMessage
            {
                IsBodyHtml = false
            };

            msg.Subject = "[YOYOLOOP] Lista de Viagens - " + date.ToLongDateString();
            string body = string.Empty;

            if(!trips.Any())
            {
                body += "\r\nNão há viagens para " + date.ToLongDateString();
            }
            else
            {
                body += "\r\nViagens para " + date.ToLongDateString() + ":";
                body += "\r\n";
                body += "\r\n";
                trips = trips.OrderBy(t => t.StartTime).ToList();
                foreach (Trip t in trips)
                {
                    int ocup = t.Bookings.Where(b => b.Status == BookingStatus.BOOKED).Sum(b => b.Seats);
                    int free = capacity - ocup;
                    body += t.StartTime.ToShortTimeString() + " > " + t.StartAccessPoint.Region.Name + " (" + t.StartAccessPoint.Name + ") para " + t.EndAccessPoint.Region.Name + " (" + t.EndAccessPoint.Name + ")";
                    body += "\r\n";
                    body += "\tLugares: " + capacity.ToString() + " total, " + ocup.ToString() + " vendidos, " + free.ToString() + " disponíveis";
                    body += "\r\n";
                    body += "\r\n";
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
            finally
            {
                msg?.Dispose();
            }

        }

        public void SendPassengerList(Guid tripid)
        {
            SmtpClient client = new SmtpClient();
            MailMessage msg = new MailMessage
            {
                IsBodyHtml = false
            };

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

                body += "\r\nDETALHES DA VIAGEM:";
                body += "\r\nOrigem: " + trip.StartAccessPoint.Region.Name + " (" + trip.StartAccessPoint.Name + ")";
                body += "\r\nDestino: " + trip.EndAccessPoint.Region.Name + " (" + trip.EndAccessPoint.Name + ")";
                body += "\r\nHora: " + trip.StartTime.ToString("R");
                body += "\r\n";
                body += "\r\nOCUPAÇÃO:";
                body += "\r\nTotal de lugares: " + capacity.ToString();
                body += "\r\nLugares ocupados: " + ocup.ToString();
                body += "\r\nLugares disponíveis para venda: " + free.ToString();
                body += "\r\n";
                body += "\r\nPASSAGEIROS:";
                foreach (Booking b in trip.Bookings.Where(b => b.Status == BookingStatus.BOOKED))
                {
                    string contactname = model.Users.SingleOrDefault(u => u.Id == b.UserId)?.ContactName;
                    string username = model.Users.SingleOrDefault(u => u.Id == b.UserId)?.UserName;
                    body += "\r\n" + contactname + " (" + username + "), " + b.Seats.ToString() + " lugar(es), Codigo: " + b.TicketCode.ToUpper();
                    body += "\r\n";
                }
            }

            msg.Body = body;

            msg.To.Add(WebConfigurationManager.AppSettings["OperationsProviderEmail"]);
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

        private void SendWarning(string warning)
        {
            SmtpClient client = new SmtpClient();
            MailMessage msg = new MailMessage
            {
                IsBodyHtml = false
            };

            msg.Subject = "[YOYOLOOP] System Warning";
            string body = string.Empty;

            body += warning + "\r\n";

            msg.Body = body;

            msg.To.Add(WebConfigurationManager.AppSettings["SystemsProviderEmail"]);
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
