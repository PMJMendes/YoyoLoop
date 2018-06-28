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
        public class BookingSelectedEventArgs : EventArgs
        {
            public string Selected_StartAPName;
            public string Selected_EndAPName;
        }

        public class PromoEnteredEventArgs : EventArgs
        {
            public string Promocode;
        }

        public event EventHandler<BookingSelectedEventArgs> BookingSelected;
        public event EventHandler<PromoEnteredEventArgs> PromoEntered;

        [Serializable]
        public class BookingData 
        {
            public int Seats { get; set; }
            public decimal FullCost { get; set; }
            public decimal Cost { get; set; }

            public DateTime StartTime { get; set; }
            public string StartRegionName { get; set; }
            public string StartAPName { get; set; }
            public string EndRegionName { get; set; }
            public string EndAPName { get; set; }
        }

        public BookingData PanelData
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
                Init_Data();
            }
        }

        internal void Init_Data()
        {
            PanelData = new BookingData
            {
                Seats = 1,
                FullCost = 0,
                Cost = 0,
                StartTime = DateTime.MinValue,
                StartRegionName = "REGIAO DE ORIGEM",
                StartAPName = "Paragem de origem",
                EndRegionName = "REGIAO DE DESTINO",
                EndAPName = "Paragem de destino",
            };
            Clear_Promo();
            Clear_Errors();
        }

        internal void Databind(Selection source, string trigger, bool active)
        {
            PanelData.Seats = source.Seats;
            PanelData.FullCost = source.FullPrice * source.Seats;
            PanelData.Cost = source.Price * source.Seats;
            PanelData.StartTime = source.Date + source.Time;
            PanelData.StartRegionName = source.Route.StartRegion.Name;
            PanelData.EndRegionName = source.Route.EndRegion.Name;
            PanelData.StartAPName = source.SAP.Name;
            PanelData.EndAPName = source.DAP.Name;
            if (active)
            {
                Clear_Errors();
            }
            else
            {
                switch (trigger)
                {
                    case "sap":
                        LbStartAP.ForeColor = System.Drawing.Color.Red;
                        break;
                    case "dap":
                        LbEndAP.ForeColor = System.Drawing.Color.Red;
                        break;
                    case "date":
                        LbDate.ForeColor = System.Drawing.Color.Red;
                        break;
                    case "seats":
                        LbSeats.ForeColor = System.Drawing.Color.Red;
                        break;
                }
                BtnBook.BackColor = System.Drawing.Color.Gray;
                BtnBook.ForeColor = System.Drawing.Color.White;
                BtnBook.BorderColor = System.Drawing.Color.Black;
                BtnBook.Enabled = false;
                LbError.Visible = true;
            }
            if(trigger == "promo")
            {
                if(tbPromo.Text == string.Empty)
                {
                    pnPromoCheck.Visible = false;
                    pnPromoError.Visible = false;
                }
                else
                {
                    if (PanelData.Cost == PanelData.FullCost)
                    {
                        pnPromoCheck.Visible = false;
                        pnPromoError.Visible = true;
                    }
                    else
                    {
                        pnPromoCheck.Visible = true;
                        pnPromoError.Visible = false;
                        //adjust panel to show discounted price
                    }
                }
            }
        }

        protected void BtnBook_Click(object sender, EventArgs e)
        {
            OnBookingSelected(new BookingSelectedEventArgs
            {
                Selected_StartAPName = PanelData.StartAPName,
                Selected_EndAPName = PanelData.EndAPName
            });
        }

        protected void lkPromo_ServerClick(object sender, EventArgs e)
        {
            pnPromocode.Visible = !pnPromocode.Visible;
        }

        protected void tbPromo_TextChanged(object sender, EventArgs e)
        {
            OnPromoChanged(new PromoEnteredEventArgs
            {
                Promocode = tbPromo.Text.ToUpper()
            });
        }

        protected virtual void OnBookingSelected(BookingSelectedEventArgs args)
        {
            BookingSelected?.Invoke(this, args);
        }

        protected virtual void OnPromoChanged(PromoEnteredEventArgs args)
        {
            PromoEntered?.Invoke(this, args);
        }

        internal void Clear_Errors()
        {
            var labels = this.Controls.OfType<Label>();
            foreach (Label l in labels)
            {
                l.ForeColor = System.Drawing.Color.Empty;
            }
            BtnBook.Enabled = true;
            BtnBook.ForeColor = System.Drawing.Color.Empty;
            BtnBook.BackColor = System.Drawing.Color.Empty;
            BtnBook.BorderColor = System.Drawing.Color.Empty;
            LbError.Visible = false;
        }

        internal void Clear_Promo()
        {
            tbPromo.Text = string.Empty;
            pnPromocode.Visible = false;
            pnPromoCheck.Visible = false;
            pnPromoError.Visible = false;
        }
    }
}