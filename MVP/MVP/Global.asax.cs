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
using System.Web.Mvc;

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
            HttpContextBase currentContext = new HttpContextWrapper(HttpContext.Current);
            UrlHelper urlHelper = new UrlHelper(HttpContext.Current.Request.RequestContext);
            RouteData routeData = urlHelper.RouteCollection.GetRouteData(currentContext);

            string lang = routeData?.Values["lang"] as string;

            if(!string.IsNullOrEmpty(lang))
            {
                switch(lang)
                {
                    case "pt":
                        Thread.CurrentThread.CurrentCulture = new CultureInfo("pt-PT", false);
                        Thread.CurrentThread.CurrentUICulture = new CultureInfo("pt-PT", false);
                        Response.Cookies["langCookie"].Value = "pt-PT";
                        Response.Cookies["langCookie"].Expires = DateTime.Now.AddDays(20);
                        return;

                    case "en":
                        Thread.CurrentThread.CurrentCulture = new CultureInfo("en-US", false);
                        Thread.CurrentThread.CurrentUICulture = new CultureInfo("en-US", false);
                        Response.Cookies["langCookie"].Value = "en-US";
                        Response.Cookies["langCookie"].Expires = DateTime.Now.AddDays(20);
                        return;

                }
            }
            HttpCookie langCookie = Request.Cookies["langCookie"];
            if (langCookie != null && !string.IsNullOrEmpty(langCookie.Value))
            {
                Thread.CurrentThread.CurrentCulture = new CultureInfo(langCookie.Value, false);
                Thread.CurrentThread.CurrentUICulture = new CultureInfo(langCookie.Value, false);
                return;
            }

            //browser culture handler
        }
    }
}