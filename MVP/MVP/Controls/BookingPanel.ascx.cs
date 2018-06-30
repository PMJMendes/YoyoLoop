using MVP.Models.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MVP.Controls
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

        [System.ComponentModel.Bindable(true)]
        public bool PromoForm { get; set; }

        public BookingPanelDTO PanelData
        {
            get
            {
                return (BookingPanelDTO)ViewState["bookingData"];
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
            PanelData = new BookingPanelDTO
            {
                Active = false,
                Trigger = string.Empty,
                Seats = 1,
                FareType = Fare.FareType.STANDARD,
                StandardPrice = 0,
                Price = 0,
                StandardCost = 0,
                Cost = 0,
                Promocode = string.Empty,
                PromoValid = false,
                StartTime = DateTime.MinValue,
                StartRegionName = "REGIAO DE ORIGEM",
                StartAPName = "Paragem de origem",
                EndRegionName = "REGIAO DE DESTINO",
                EndAPName = "Paragem de destino"
            };
            Clear_Promo();
            Clear_Errors();
        }

        internal void Databind(BookingPanelDTO source)
        {
            PanelData = source;
            tbPromo.Text = PanelData.Promocode;
            if(PanelData.PromoValid)
            {
                pnPromocode.Visible = true;
            }

            if (PanelData.Active)
            {
                Clear_Errors();
            }
            else
            {
                switch (PanelData.Trigger)
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
                BtnBook.Text = "Viagem indisponível";
                BtnBook.Enabled = false;
            }
            if(PanelData.Trigger == "promo")
            {
                if(tbPromo.Text == string.Empty)
                {
                    PanelData.PromoValid = false;
                    pnPromoCheck.Visible = false;
                    pnPromoError.Visible = false;
                }
                else
                {
                    if (!PanelData.PromoValid)
                    {
                        pnPromoCheck.Visible = false;
                        pnPromoError.Visible = true;
                    }
                    else
                    {
                        pnPromoCheck.Visible = true;
                        pnPromoError.Visible = false;
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
            BtnBook.Text = "Reservar";
            BtnBook.Enabled = true;
            BtnBook.ForeColor = System.Drawing.Color.Empty;
            BtnBook.BackColor = System.Drawing.Color.Empty;
            BtnBook.BorderColor = System.Drawing.Color.Empty;
        }

        internal void Clear_Promo()
        {
            tbPromo.Text = string.Empty;
            PanelData.PromoValid = false;
            pnPromocode.Visible = false;
            pnPromoCheck.Visible = false;
            pnPromoError.Visible = false;
        }
    }
}