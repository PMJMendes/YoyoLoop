using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MVP.Models.Entities;
using MVP.Services;

namespace MVP.Pages
{
    public partial class Cities : System.Web.UI.Page
    {
        public const String CITY_PARAM = "City";

        public List<LoopedRegion> AllCities;

        public String SelectedCity;
        public List<AccessPoint> SelectedCityStops;

        private CityService cities = new CityService();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                var cityParam = Request.QueryString[CITY_PARAM];
                var city = string.IsNullOrEmpty(cityParam) ? null : cities.GetCity(cityParam);
                if (city != null)
                {
                    SelectedCity = city.Name;
                    SelectedCityStops = cities.GetCityLoops(cityParam);
                } else
                {
                    AllCities = cities.GetCities();
                }

                this.DataBind();
            }
        }

        public String CityText(String city, String key)
        {
            String cityKey = new StringBuilder("StaticPages_Destinos_").Append(city).Append("_").Append(key).ToString();
            return Resources.LocalizedText.ResourceManager.GetString(cityKey);
        }

        public String StopText(String stop, String key)
        {
            String stopKey = new StringBuilder("Stops_StopCard_").Append(stop).Append("_").Append(key).ToString();
            return CityText(SelectedCity, stopKey);
        }

    }
}