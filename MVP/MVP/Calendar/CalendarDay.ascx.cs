using System.Web.UI;

namespace MVP.Calendar
{
    public partial class CalendarDay : UserControl
    {
        public enum DayFlag
        {
            None,
            Weekend,
            Limited,
            Selected,
            Unavailable,
            Available
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

        public bool IsOffMonth
        {
            get
            {
                return (bool)ViewState["IsOffMonth"];
            }
            set
            {
                ViewState["IsOffMonth"] = value;
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

        protected string OffMonthTag
        {
            get
            {
                return IsOffMonth ? " bg-light text-muted" : "";
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
                        return " day--fully-available";

                    case DayFlag.Weekend:
                        return " day--weekend";

                    default:
                        return "";
                }
            }
        }
    }
}
