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
        public bool BookingActive { get; set; }

        public BookingPanelDTO PanelData
        {
            get
            {
                return (BookingPanelDTO)ViewState["PanelData"];
            }
            set
            {
                ViewState["PanelData"] = value;
            }
        }

        internal void Init_Data()
        {
            PanelData = new BookingPanelDTO
            {
                BookingValid = false,
                Trigger = string.Empty,
                Seats = 1,
                FareType = Fare.FareType.STANDARD,
                StandardPrice = 0,
                Price = 0,
                StandardCost = 0,
                Cost = 0,
                PriceSummary = new List<BookingPanelDTO.PriceItem>(),
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
            SummaryRepeater.DataSource = PanelData.PriceSummary;
            SummaryRepeater.DataBind();

            if(PanelData.PromoValid || PanelData.MGM)
            {
                pnPromocode.Visible = true;
            }

            if (PanelData.BookingValid)
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
                BtnBook.Text = Resources.LocalizedText.Controls_BookingPanel_btnBook_Unavailable_Text;
                BtnBook.Enabled = false;
            }
            if(PanelData.Trigger == "promo")
            {
                if(tbPromo.Text == string.Empty)
                {
                    PanelData.PromoValid = false;
                    phPromoCheck.Visible = false;
                    phPromoError.Visible = false;
                    tbPromo.Attributes.Add("placeholder", Resources.LocalizedText.Controls_BookingPanel_Promocode_tbPromo_placeholder);
                    tbPromo.Enabled = true;
                }
                else
                {
                    if (!PanelData.PromoValid && !PanelData.MGM)
                    {
                        phPromoCheck.Visible = false;
                        phPromoError.Visible = true;
                        tbPromo.Text = string.Empty;
                        tbPromo.Attributes.Add("placeholder", string.Empty);
                        tbPromo.Enabled = false;
                    }
                    else
                    {
                        phPromoCheck.Visible = true;
                        phPromoError.Visible = false;
                        tbPromo.Text = string.Empty;
                        tbPromo.Attributes.Add("placeholder", string.Empty);
                        tbPromo.Enabled = false;
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

        protected void lkClearPromo_ServerClick(object sender, EventArgs e)
        {
            OnPromoChanged(new PromoEnteredEventArgs
            {
                Promocode = string.Empty
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
            var labels = upBookingPanel.Controls[0].Controls.OfType<Label>();
            foreach (Label l in labels)
            {
                l.ForeColor = System.Drawing.Color.Empty;
            }
            BtnBook.Text = Resources.LocalizedText.Controls_BookingPanel_btnBook_Text;
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
            phPromoCheck.Visible = false;
            phPromoError.Visible = false;
        }

        protected void SummaryRepeater_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.DataItem != null)
            {
                var priceitem = (BookingPanelDTO.PriceItem)e.Item.DataItem;
                var desclabel = (Label)e.Item.FindControl("lbPriceItemDescription");
                var pricelabel = (Label)e.Item.FindControl("lbPriceItemValue");
                desclabel.Text = priceitem.Description;
                pricelabel.Text = priceitem.Value;
                switch (priceitem.Type)
                {
                    case (BookingPanelDTO.PriceItemType.NORMAL):
                        pricelabel.CssClass = "price pl-1";
                        break;
                    case (BookingPanelDTO.PriceItemType.DISCOUNT):
                        pricelabel.CssClass = "price-green pl-1";
                        break;
                    case (BookingPanelDTO.PriceItemType.NEUTRAL):
                        pricelabel.CssClass = "pl-1";
                        break;
                    default:
                        pricelabel.CssClass = "pl-1";
                        break;
                }
            }
        }
    }
}