using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Optimization;
using System.Web.Routing;
using System.Web.Security;
using System.Web.SessionState;
using System.Web.Configuration;
using Stripe;
using System.Threading;
using System.Globalization;

namespace MVP
{
    public class Global : HttpApplication
    {
        void Application_Start(object sender, EventArgs e)
        {
            // Code that runs on application startup
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            BundleConfig.RegisterBundles(BundleTable.Bundles);

            // Stripe
            var secretKey = WebConfigurationManager.AppSettings["StripeSecretKey"];
            StripeConfiguration.SetApiKey(secretKey);
        }

        protected void Application_BeginRequest(Object sender, EventArgs e)
        {
            HttpCookie langCookie = Request.Cookies["langCookie"];
            if (langCookie != null && !string.IsNullOrEmpty(langCookie.Value))
            {
                Thread.CurrentThread.CurrentCulture = new CultureInfo(langCookie.Value, false);
                Thread.CurrentThread.CurrentUICulture = new CultureInfo(langCookie.Value, false);
            }
        }
    }
}