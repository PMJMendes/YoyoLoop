using System;
using System.Web.UI;


namespace MVP.Calendar
{
    public partial class CalendarDay : UserControl
    {
        public delegate void DayClickedHandler(object sender);
        public event DayClickedHandler DayClicked;

        public CalendarDay()
        {
            this.Click += new EventHandler(Day_Click);
        }

        protected virtual void OnDayClicked()
        {
            DayClicked?.Invoke(this);
        }

        private void Day_Click(object sender, EventArgs e)
        {
            OnDayClicked();
        }

        public enum DayFlag
        {
            None,
            OffMonth,
            Weekend,
            Limited,
            Selected,
            Unavailable,
            Available,
            Fully
        }

        public DateTime Date
        {
            get
            {
                return (DateTime)ViewState["Date"];
            }
            set
            {
                ViewState["Date"] = value;
            }
        }

        public string DayText
        {
            get
            {
                return (string)ViewState["DayText"];
            }
            set
            {
                ViewState["DayText"] = value;
            }
        }

        public bool IsCurrent
        {
            get
            {
                return (bool)ViewState["IsCurrent"];
            }
            set
            {
                ViewState["IsCurrent"] = value;
            }
        }

        public string InfoText
        {
            get
            {
                return (string)ViewState["InfoText"];
            }
            set
            {
                ViewState["InfoText"] = value;
            }
        }

        public string PriceText
        {
            get
            {
                return (string)ViewState["PriceText"];
            }
            set
            {
                ViewState["PriceText"] = value;
            }
        }

        public DayFlag Flag
        {
            get
            {
                return (DayFlag)ViewState["Flag"];
            }
            set
            {
                ViewState["Flag"] = value;
            }
        }

        protected string CurrentDayTag
        {
            get
            {
                return IsCurrent ? " date--today" : "";
            }
        }

        protected string DayBackgroundTag
        {
            get
            {
                switch (this.Flag)
                {
                    case DayFlag.Limited:
                        return " day--limited-availability";

                    case DayFlag.Selected:
                        return " day--selected";

                    case DayFlag.Unavailable:
                        return " day--unavailable";

                    case DayFlag.Available:
                        return " day--available";

                    case DayFlag.Fully:
                        return " day--fully-available";

                    case DayFlag.Weekend:
                        return " day--weekend";

                    case DayFlag.OffMonth:
                        return " bg-light text-muted";

                    default:
                        return "";
                }
            }
        }
    }
}
