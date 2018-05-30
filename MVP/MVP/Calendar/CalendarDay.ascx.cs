using System.Web.UI;

namespace MVP.Calendar
{
    public partial class CalendarDay : UserControl
    {
        public enum DayFlag
        {
            None,
            Limited,
            Selected,
            Unavailable,
            Available
        }

        public string DayText
        {
            get; set;
        }

        public bool IsOffMonth
        {
            get; set;
        }

        public bool IsWeekend
        {
            get; set;
        }

        public bool IsCurrent
        {
            get; set;
        }

        public string InfoText
        {
            get; set;
        }

        public string PriceText
        {
            get; set;
        }

        public DayFlag Flag
        {
            get; set;
        }

        protected string OffMonthTag
        {
            get
            {
                return IsOffMonth ? " bg-light text-muted" : "";
            }
        }

        protected string DayWeekendTag
        {
            get
            {
                return IsWeekend ? " day--weekend" : "";
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

                    default:
                        return "";
                }
            }
        }
    }
}
