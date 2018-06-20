using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MVP.Calendar
{
    public partial class BookingPanel : System.Web.UI.UserControl
    {
        [Serializable]
        public class BookingData 
        {
            public Guid? DepartureID { get; set; }
            public Guid? TripID { get; set; }

            public int Seats { get; set; }
            public decimal Cost { get; set; }

            public DateTime StartTime { get; set; }
            public string StartRegionName { get; set; }
            public string StartAPName { get; set; }
            public string EndRegionName { get; set; }
            public string EndAPName { get; set; }
        }

        public BookingData bookingData
        {
            get
            {
                return (BookingData)ViewState["bookingData"];
            }
            set
            {
                ViewState["bookingData"] = value;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                bookingData = new BookingData
                {
                    DepartureID = null,
                    TripID = null,
                    Seats = 1,
                    Cost = 0,
                    StartTime = DateTime.MinValue,
                    StartRegionName = "REGIAO DE ORIGEM",
                    StartAPName = "Paragem de origem",
                    EndRegionName = "REGIAO DE DESTINO",
                    EndAPName = "Paragem de destino"
                };
            }
        }
    }
}