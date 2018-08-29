using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MVP.Help
{
    public partial class Help : System.Web.UI.Page
    {
        protected class PageState
        {
            public string SelectedTopic { get; set; }
            public string SelectedQuestion { get; set; }
        }

        protected PageState localData;

        protected void Page_Load(object sender, EventArgs e)
        {
            localData = null;

            if (IsPostBack)
            {
                localData = (PageState)Session["help.data"];
            }
            if (localData == null)
            {
                localData = GetInitialData();
                Session["help.data"] = localData;
            }
        }

        protected PageState GetInitialData()
        {
            var result = new PageState();

            return result;
        }

        protected void ShowHelpMain()
        {
            phHelpMain.Visible = true;
            phHelpList.Visible = false;
            upHelp.Update();
        }

        protected void ShowHelpList()
        {
            phHelpMain.Visible = false;
            phHelpList.Visible = true;
            upHelp.Update();
        }

        protected void MainTopicSelect(object sender, EventArgs e)
        {
            LinkButton button = (LinkButton)sender;
            string topic = button.ID;

            switch(topic)
            {
                case "btnTopicTrip":
                    localData.SelectedTopic = "Trip";
                    break;
                case "btnTopicDashboard":
                    localData.SelectedTopic = "Dashboard";
                    break;
                case "btnTopicInvite":
                    localData.SelectedTopic = "Invite";
                    break;
                case "btnTopicVehicle":
                    localData.SelectedTopic = "Vehicle";
                    break;
                case "btnTopicPromo":
                    localData.SelectedTopic = "Promo";
                    break;
                case "btnTopicLuggage":
                    localData.SelectedTopic = "Luggage";
                    break;
                case "btnTopicCorporate":
                    localData.SelectedTopic = "Corporate";
                    break;
                case "btnTopicPartners":
                    localData.SelectedTopic = "Partners";
                    break;
                case "btnTopicCareers":
                    localData.SelectedTopic = "Careers";
                    break;
                default:
                    localData.SelectedTopic = "None";
                    break;
            }

            ShowHelpList();
        }

        protected void ListTopicSelect(object sender, EventArgs e)
        {
            LinkButton button = (LinkButton)sender;
            string topic = button.ID;

            switch (topic)
            {
                case "btnMenuTopicTrip":
                    localData.SelectedTopic = "Trip";
                    break;
                case "btnMenuTopicDashboard":
                    localData.SelectedTopic = "Dashboard";
                    break;
                case "btnMenuTopicInvite":
                    localData.SelectedTopic = "Invite";
                    break;
                case "btnMenuTopicVehicle":
                    localData.SelectedTopic = "Vehicle";
                    break;
                case "btnMenuTopicPromo":
                    localData.SelectedTopic = "Promo";
                    break;
                case "btnMenuTopicLuggage":
                    localData.SelectedTopic = "Luggage";
                    break;
                case "btnMenuTopicCorporate":
                    localData.SelectedTopic = "Corporate";
                    break;
                case "btnMenuTopicPartners":
                    localData.SelectedTopic = "Partners";
                    break;
                case "btnMenuTopicCareers":
                    localData.SelectedTopic = "Careers";
                    break;
                default:
                    localData.SelectedTopic = "None";
                    break;
            }

            ShowHelpList();
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            ShowHelpMain();
        }

        protected void ddlMobileMenu_SelectedIndexChanged(object sender, EventArgs e)
        {
            localData.SelectedTopic = ddlMobileMenu.SelectedValue;
            ShowHelpList();
        }
    }
}