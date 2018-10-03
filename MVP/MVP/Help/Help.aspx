<%@ Page Title="Yoyoloop" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Help.aspx.cs" Inherits="MVP.Help.Help" %>

<asp:Content ID="HeadContent" ContentPlaceHolderID="HeadContent" runat="server">
    <title>
        <asp:Literal runat="server" Text="<%$ Resources:LocalizedText, Meta_Help_Title%>"/>
    </title>
    <meta name="description" content="<%= Resources.LocalizedText.Meta_Help_Description%>">
</asp:Content>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="help">
        <div class="help__container">
            <div class="container-fluid">
                <asp:UpdatePanel runat="server" ID="upHelp" UpdateMode="Conditional">
                    <ContentTemplate>

                        <asp:PlaceHolder runat="server" ID="phHelpMain" Visible="true">
                            <h1 class="help__main-title"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, Help_MainTitle%>"/></h1>

                            <div class="help__separator mt-5 mb-5"></div>

                            <div class="row help__menu pb-5">
                                <div class="col-12">
                                    <div class="row">
                                        <div class="col-12">
                                            <h1 class="help__menu__main-title"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, Help_SubTitle%>"/></h1>
                                        </div>
                                    </div>
        
                                    <div class="row pt-4">

                                        <div class="col-md-4 pr-4">
                                            <h2 class="help__menu__sub-title">
                                                <asp:Literal runat="server" Text="<%$ Resources:LocalizedText, Help_Topic_TripsAndLoops%>"/>
                                            </h2>
                                            <p class="help__menu__text mb-0"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, Help_Topic_TripsAndLoops_Question_AvailableLoops%>"/></p>
                                            <p class="help__menu__text mb-0"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, Help_Topic_TripsAndLoops_Question_SuggestLoop%>"/></p>
                                            <p class="help__menu__text mb-0"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, Help_Topic_TripsAndLoops_Question_PaymentMethods%>"/></p>
                                            <p class="help__menu__text mb-0"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, Help_Topic_TripsAndLoops_Question_Invoices%>"/></p>
                                            <asp:LinkButton runat="server" ID="btnTopicTrip" OnClientClick="javascript:window.scrollTo(0, 0)" OnClick="MainTopicSelect" CssClass="help__menu__see-all" Text="<%$ Resources:LocalizedText, Help_SeeAllLink%>" />
                                        </div>

                                        <div class="col-md-4 pr-4">
                                            <h2 class="help__menu__sub-title">
                                                <asp:Literal runat="server" Text="<%$ Resources:LocalizedText, Help_Topic_UserDashboard%>"/>
                                            </h2>
                                            <p class="help__menu__text mb-0"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, Help_Topic_UserDashboard_Question_WhatCanIDo%>"/></p>
                                            <asp:LinkButton runat="server" ID="btnTopicDashboard" OnClientClick="javascript:window.scrollTo(0, 0)" OnClick="MainTopicSelect" CssClass="help__menu__see-all" Text="<%$ Resources:LocalizedText, Help_SeeAllLink%>" />
                                        </div>

                                        <div class="col-md-4 pr-4">
                                            <h2 class="help__menu__sub-title">
                                                <asp:Literal runat="server" Text="<%$ Resources:LocalizedText, Help_Topic_Invite%>"/>
                                            </h2>
                                            <p class="help__menu__text mb-0"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, Help_Topic_Invite_Question_HowManyFriends%>"/></p>
                                            <p class="help__menu__text mb-0"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, Help_Topic_Invite_Question_GiftToYoyoUsers%>"/></p>
                                            <p class="help__menu__text mb-0"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, Help_Topic_Invite_Question_FriendsBenefits%>"/></p>
                                            <p class="help__menu__text mb-0"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, Help_Topic_Invite_Question_MyBenefits%>"/></p>
                                            <asp:LinkButton runat="server" ID="btnTopicInvite" OnClientClick="javascript:window.scrollTo(0, 0)" OnClick="MainTopicSelect" CssClass="help__menu__see-all" Text="<%$ Resources:LocalizedText, Help_SeeAllLink%>" />
                                        </div>
                                    </div>
                    
                                    <div class="row pt-4">

                                        <div class="col-md-4 pr-4">
                                            <h2 class="help__menu__sub-title">
                                                <asp:Literal runat="server" Text="<%$ Resources:LocalizedText, Help_Topic_YoyoloopCars%>"/>
                                            </h2>
                                            <p class="help__menu__text mb-0"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, Help_Topic_YoyoloopCars_Question_Wifi%>"/></p>
                                            <p class="help__menu__text mb-0"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, Help_Topic_YoyoloopCars_Question_ProfessionalDriver%>"/></p>
                                            <p class="help__menu__text mb-0"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, Help_Topic_YoyoloopCars_Question_Seats%>"/></p>
                                            <p class="help__menu__text mb-0"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, Help_Topic_YoyoloopCars_Question_Electric%>"/></p>
                                            <asp:LinkButton runat="server" ID="btnTopicVehicle" OnClientClick="javascript:window.scrollTo(0, 0)" OnClick="MainTopicSelect" CssClass="help__menu__see-all" Text="<%$ Resources:LocalizedText, Help_SeeAllLink%>" />
                                        </div>

                                        <div class="col-md-4 pr-4">
                                            <h2 class="help__menu__sub-title">
                                                <asp:Literal runat="server" Text="<%$ Resources:LocalizedText, Help_Topic_DiscountAndPromo%>"/>
                                            </h2>
                                            <p class="help__menu__text mb-0"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, Help_Topic_DiscountAndPromo_Question_TwoPromocodes%>"/></p>
                                            <p class="help__menu__text mb-0"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, Help_Topic_DiscountAndPromo_Question_PromoAndMGM%>"/></p>
                                            <asp:LinkButton runat="server" ID="btnTopicPromo" OnClientClick="javascript:window.scrollTo(0, 0)" OnClick="MainTopicSelect" CssClass="help__menu__see-all" Text="<%$ Resources:LocalizedText, Help_SeeAllLink%>" />
                                        </div> 

                                        <div class="col-md-4 pr-4">
                                            <h2 class="help__menu__sub-title">
                                                <asp:Literal runat="server" Text="<%$ Resources:LocalizedText, Help_Topic_Luggage%>"/>
                                            </h2>
                                            <p class="help__menu__text mb-0"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, Help_Topic_Luggage_Question_CanIBring%>"/></p>
                                            <p class="help__menu__text mb-0"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, Help_Topic_Luggage_Question_SizeLimit%>"/></p>
                                            <p class="help__menu__text mb-0"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, Help_Topic_Luggage_Question_NotAllowed%>"/></p>
                                            <asp:LinkButton runat="server" ID="btnTopicLuggage" OnClientClick="javascript:window.scrollTo(0, 0)" OnClick="MainTopicSelect" CssClass="help__menu__see-all" Text="<%$ Resources:LocalizedText, Help_SeeAllLink%>" />
                                        </div>
                                    </div>

                                    <div class="row pt-4">

                                        <div class="col-md-4 pr-4">
                                            <h2 class="help__menu__sub-title">
                                                <asp:Literal runat="server" Text="<%$ Resources:LocalizedText, Help_Topic_Corporate%>"/>
                                            </h2>
                                            <p class="help__menu__text mb-0"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, Help_Topic_Corporate_Question_TaxInvoices%>"/></p>
                                            <p class="help__menu__text mb-0"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, Help_Topic_Corporate_Question_TotalSpending%>"/></p>
                                            <p class="help__menu__text mb-0"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, Help_Topic_Corporate_Question_CorporatePricing%>"/></p>
                                            <asp:LinkButton runat="server" ID="btnTopicCorporate" OnClientClick="javascript:window.scrollTo(0, 0)" OnClick="MainTopicSelect" CssClass="help__menu__see-all" Text="<%$ Resources:LocalizedText, Help_SeeAllLink%>" />
                                        </div>

                                        <div class="col-md-4 pr-4">
                                            <h2 class="help__menu__sub-title">
                                                <asp:Literal runat="server" Text="<%$ Resources:LocalizedText, Help_Topic_Partners%>"/>
                                            </h2>
                                            <p class="help__menu__text mb-0"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, Help_Topic_Partners_Question_PartnerProgram%>"/></p>
                                            <p class="help__menu__text mb-0"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, Help_Topic_Partners_Question_HowTo%>"/></p>
                                            <asp:LinkButton runat="server" ID="btnTopicPartners" OnClientClick="javascript:window.scrollTo(0, 0)" OnClick="MainTopicSelect" CssClass="help__menu__see-all" Text="<%$ Resources:LocalizedText, Help_SeeAllLink%>" />
                                        </div>

                                        <div class="col-md-4 pr-4">
                                            <h2 class="help__menu__sub-title">
                                                <asp:Literal runat="server" Text="<%$ Resources:LocalizedText, Help_Topic_Careers%>"/>
                                            </h2>
                                            <p class="help__menu__text mb-0"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, Help_Topic_Careers_Question_HowTo%>"/></p>
                                            <asp:LinkButton runat="server" ID="btnTopicCareers" OnClientClick="javascript:window.scrollTo(0, 0)" OnClick="MainTopicSelect" CssClass="help__menu__see-all" Text="<%$ Resources:LocalizedText, Help_SeeAllLink%>" />
                                        </div> 
                                    </div>
                                </div>
                            </div>
                            <div class="help__separator mb-5"></div>
            
                            <div class="row justify-content-center mb-5 align-items-center mt-5">
                                <div class="invitefriends__any-question mr-5"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, Help_CantFind%>"/></div>
                                <a OnClick="javascript:$.blockUI()" href="/Pages/Contact" class="btn btn-default static-page__question-btn static-page__question-btn--white" tabindex="-1" ><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, Help_CantFind_ContactUs%>"/></a>
                            </div>
                        </asp:PlaceHolder>

                        <asp:PlaceHolder runat="server" ID="phHelpList" Visible="false">
                            <h1 class="help__main-title">
                                <asp:Literal runat="server" Text="<%$ Resources:LocalizedText, Help_MainTitle%>"/>

                                <asp:LinkButton runat="server" ID="btnBack" OnClick="btnBack_Click" CssClass="help__main-title__btn" Text="<%$ Resources:LocalizedText, Help_Detailed_btnBack_Text%>" />
                            </h1>

                            <div class="help__separator mt-5 mb-5"></div>

                            <div class="row">
                                <div class="col-md-4">

                                    <div class="left-menu mb-5">
                                        <div class="left-menu__entry <%= localData.SelectedTopic == "Trip" ? "left-menu__entry--selected" : "" %>"><asp:LinkButton runat="server" ID="btnMenuTopicTrip" OnClick="ListTopicSelect"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, Help_Topic_TripsAndLoops%>"/></asp:LinkButton></div>
                                        <div class="left-menu__entry <%= localData.SelectedTopic == "Dashboard" ? "left-menu__entry--selected" : "" %>"><asp:LinkButton runat="server" ID="btnMenuTopicDashboard" OnClick="ListTopicSelect"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, Help_Topic_UserDashboard%>"/></asp:LinkButton></div>
                                        <div class="left-menu__entry <%= localData.SelectedTopic == "Invite" ? "left-menu__entry--selected" : "" %>"><asp:LinkButton runat="server" ID="btnMenuTopicInvite" OnClick="ListTopicSelect"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, Help_Topic_Invite%>"/></asp:LinkButton></div>
                                        <div class="left-menu__entry <%= localData.SelectedTopic == "Vehicle" ? "left-menu__entry--selected" : "" %>"><asp:LinkButton runat="server" ID="btnMenuTopicVehicle" OnClick="ListTopicSelect"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, Help_Topic_YoyoloopCars%>"/></asp:LinkButton></div>
                                        <div class="left-menu__entry <%= localData.SelectedTopic == "Promo" ? "left-menu__entry--selected" : "" %>"><asp:LinkButton runat="server" ID="btnMenuTopicPromo" OnClick="ListTopicSelect"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, Help_Topic_DiscountAndPromo%>"/></asp:LinkButton></div>
                                        <div class="left-menu__entry <%= localData.SelectedTopic == "Luggage" ? "left-menu__entry--selected" : "" %>"><asp:LinkButton runat="server" ID="btnMenuTopicLuggage" OnClick="ListTopicSelect"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, Help_Topic_Luggage%>"/></asp:LinkButton></div>
                                        <div class="left-menu__entry <%= localData.SelectedTopic == "Corporate" ? "left-menu__entry--selected" : "" %>"><asp:LinkButton runat="server" ID="btnMenuTopicCorporate" OnClick="ListTopicSelect"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, Help_Topic_Corporate%>"/></asp:LinkButton></div>
                                        <div class="left-menu__entry <%= localData.SelectedTopic == "Partners" ? "left-menu__entry--selected" : "" %>"><asp:LinkButton runat="server" ID="btnMenuTopicPartners" OnClick="ListTopicSelect"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, Help_Topic_Partners%>"/></asp:LinkButton></div>
                                        <div class="left-menu__entry <%= localData.SelectedTopic == "Careers" ? "left-menu__entry--selected" : "" %>"><asp:LinkButton runat="server" ID="btnMenuTopicCareers" OnClick="ListTopicSelect"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, Help_Topic_Careers%>"/></asp:LinkButton></div>
                                    </div>

                                    <div class="left-menu-mobile mb-5">
                                        <asp:DropDownList runat="server" ID="ddlMobileMenu" OnSelectedIndexChanged="ddlMobileMenu_SelectedIndexChanged" AutoPostBack="true" CssClass="left-menu-mobile__select" tabindex="-1">
                                            <asp:ListItem Value="Trip" Text="<%$ Resources:LocalizedText, Help_Topic_TripsAndLoops%>"/>
                                            <asp:ListItem Value="Dashboard" Text="<%$ Resources:LocalizedText, Help_Topic_UserDashboard%>"/>
                                            <asp:ListItem Value="Invite" Text="<%$ Resources:LocalizedText, Help_Topic_Invite%>"/>
                                            <asp:ListItem Value="Vehicle" Text="<%$ Resources:LocalizedText, Help_Topic_YoyoloopCars%>"/>
                                            <asp:ListItem Value="Promo" Text="<%$ Resources:LocalizedText, Help_Topic_DiscountAndPromo%>"/>
                                            <asp:ListItem Value="Luggage" Text="<%$ Resources:LocalizedText, Help_Topic_Luggage%>"/>
                                            <asp:ListItem Value="Corporate" Text="<%$ Resources:LocalizedText, Help_Topic_Corporate%>"/>
                                            <asp:ListItem Value="Partners" Text="<%$ Resources:LocalizedText, Help_Topic_Partners%>"/>
                                            <asp:ListItem Value="Careers" Text="<%$ Resources:LocalizedText, Help_Topic_Careers%>"/>
                                        </asp:DropDownList>

                                        <img src="/img/arr.png" srcset="/img/arr@2x.png 2x, /img/arr@3x.png 3x" class="arr">
                                    </div>

                                </div>

                                <div class="col-md-8">

                                    <!-- Topic Trip -->
                                    <div class="panel-group <%= localData.SelectedTopic == "Trip" ? "panel-group__show" : "" %>">
                                        <div class="panel panel-default">
                                            <div class="panel-heading">
                                                <h4 class="panel-title">
                                                    <a class="panel-title__subtitle" data-toggle="collapse" href="#collapse1-1"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, Help_Topic_TripsAndLoops_Question_AvailableLoops%>"/></a>
                                                </h4>
                                            </div>

                                            <div id="collapse1-1" class="panel-collapse collapse">
                                                <div class="panel-body mt-5 mb-5">
                                                    <asp:Literal runat="server" Text="<%$ Resources:LocalizedText, Help_Topic_TripsAndLoops_Question_AvailableLoops_Answer%>"/>
                                                    <br />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="panel panel-default">
                                            <div class="panel-heading">
                                                <h4 class="panel-title">
                                                    <a class="panel-title__subtitle" data-toggle="collapse" href="#collapse1-2"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, Help_Topic_TripsAndLoops_Question_SuggestLoop%>"/></a>
                                                </h4>
                                            </div>

                                            <div id="collapse1-2" class="panel-collapse collapse">
                                                <div class="panel-body mt-5 mb-5">
                                                    <asp:Literal runat="server" Text="<%$ Resources:LocalizedText, Help_Topic_TripsAndLoops_Question_SuggestLoop_Answer%>"/>
                                                    <br />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="panel panel-default">
                                            <div class="panel-heading">
                                                <h4 class="panel-title">
                                                    <a class="panel-title__subtitle" data-toggle="collapse" href="#collapse1-3"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, Help_Topic_TripsAndLoops_Question_PaymentMethods%>"/></a>
                                                </h4>
                                            </div>

                                            <div id="collapse1-3" class="panel-collapse collapse">
                                                <div class="panel-body mt-5 mb-5">
                                                    <asp:Literal runat="server" Text="<%$ Resources:LocalizedText, Help_Topic_TripsAndLoops_Question_PaymentMethods_Answer%>"/>
                                                    <br />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="panel panel-default">
                                            <div class="panel-heading">
                                                <h4 class="panel-title">
                                                    <a class="panel-title__subtitle" data-toggle="collapse" href="#collapse1-4"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, Help_Topic_TripsAndLoops_Question_Invoices%>"/></a>
                                                </h4>
                                            </div>

                                            <div id="collapse1-4" class="panel-collapse collapse">
                                                <div class="panel-body mt-5 mb-5">
                                                    <asp:Literal runat="server" Text="<%$ Resources:LocalizedText, Help_Topic_TripsAndLoops_Question_Invoices_Answer%>"/>
                                                    <br />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="panel panel-default">
                                            <div class="panel-heading">
                                                <h4 class="panel-title">
                                                    <a class="panel-title__subtitle" data-toggle="collapse" href="#collapse1-5"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, Help_Topic_TripsAndLoops_Question_HowMuch%>"/></a>
                                                </h4>
                                            </div>

                                            <div id="collapse1-5" class="panel-collapse collapse">
                                                <div class="panel-body mt-5 mb-5">
                                                    <asp:Literal runat="server" Text="<%$ Resources:LocalizedText, Help_Topic_TripsAndLoops_Question_HowMuch_Answer%>"/>
                                                    <br />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="panel panel-default">
                                            <div class="panel-heading">
                                                <h4 class="panel-title">
                                                    <a class="panel-title__subtitle" data-toggle="collapse" href="#collapse1-6"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, Help_Topic_TripsAndLoops_Question_Cancel%>"/></a>
                                                </h4>
                                            </div>

                                            <div id="collapse1-6" class="panel-collapse collapse">
                                                <div class="panel-body mt-5 mb-5">
                                                    <asp:Literal runat="server" Text="<%$ Resources:LocalizedText, Help_Topic_TripsAndLoops_Question_Cancel_Answer%>"/>
                                                    <br />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="panel panel-default">
                                            <div class="panel-heading">
                                                <h4 class="panel-title">
                                                    <a class="panel-title__subtitle" data-toggle="collapse" href="#collapse1-7"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, Help_Topic_TripsAndLoops_Question_CouldNotBook%>"/></a>
                                                </h4>
                                            </div>

                                            <div id="collapse1-7" class="panel-collapse collapse">
                                                <div class="panel-body mt-5 mb-5">
                                                    <asp:Literal runat="server" Text="<%$ Resources:LocalizedText, Help_Topic_TripsAndLoops_Question_CouldNotBook_Answer%>"/>
                                                    <br />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="panel panel-default">
                                            <div class="panel-heading">
                                                <h4 class="panel-title">
                                                    <a class="panel-title__subtitle" data-toggle="collapse" href="#collapse1-8"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, Help_Topic_TripsAndLoops_Question_BuyAtDeparture%>"/></a>
                                                </h4>
                                            </div>

                                            <div id="collapse1-8" class="panel-collapse collapse">
                                                <div class="panel-body mt-5 mb-5">
                                                    <asp:Literal runat="server" Text="<%$ Resources:LocalizedText, Help_Topic_TripsAndLoops_Question_BuyAtDeparture_Answer%>"/>
                                                    <br/>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="panel panel-default">
                                            <div class="panel-heading">
                                                <h4 class="panel-title">
                                                    <a class="panel-title__subtitle" data-toggle="collapse" href="#collapse1-9"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, Help_Topic_TripsAndLoops_Question_DownloadTicket%>"/></a>
                                                </h4>
                                            </div>

                                            <div id="collapse1-9" class="panel-collapse collapse">
                                                <div class="panel-body mt-5 mb-5">
                                                    <asp:Literal runat="server" Text="<%$ Resources:LocalizedText, Help_Topic_TripsAndLoops_Question_DownloadTicket_Answer%>"/>
                                                    <br />
                                                </div>
                                            </div>
                                        </div>
                                        <div class="panel panel-default">
                                            <div class="panel-heading">
                                                <h4 class="panel-title">
                                                    <a class="panel-title__subtitle" data-toggle="collapse" href="#collapse1-10"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, Help_Topic_TripsAndLoops_Question_GuaranteedSeat%>"/></a>
                                                </h4>
                                            </div>

                                            <div id="collapse1-10" class="panel-collapse collapse">
                                                <div class="panel-body mt-5 mb-5">
                                                    <asp:Literal runat="server" Text="<%$ Resources:LocalizedText, Help_Topic_TripsAndLoops_Question_GuaranteedSeat_Answer%>"/>
                                                    <br />
                                                </div>
                                            </div>
                                        </div>
                                        <div class="panel panel-default">
                                            <div class="panel-heading">
                                                <h4 class="panel-title">
                                                    <a class="panel-title__subtitle" data-toggle="collapse" href="#collapse1-11"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, Help_Topic_TripsAndLoops_Question_AssignedSeats%>"/></a>
                                                </h4>
                                            </div>

                                            <div id="collapse1-11" class="panel-collapse collapse">
                                                <div class="panel-body mt-5 mb-5">
                                                    <asp:Literal runat="server" Text="<%$ Resources:LocalizedText, Help_Topic_TripsAndLoops_Question_AssignedSeats_Answer%>"/>
                                                    <br />
                                                </div>
                                            </div>
                                        </div>
                                        <div class="panel panel-default">
                                            <div class="panel-heading">
                                                <h4 class="panel-title">
                                                    <a class="panel-title__subtitle" data-toggle="collapse" href="#collapse1-12"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, Help_Topic_TripsAndLoops_Question_ChangeDate%>"/></a>
                                                </h4>
                                            </div>

                                            <div id="collapse1-12" class="panel-collapse collapse">
                                                <div class="panel-body mt-5 mb-5">
                                                    <asp:Literal runat="server" Text="<%$ Resources:LocalizedText, Help_Topic_TripsAndLoops_Question_ChangeDate_Answer%>"/>
                                                    <br />
                                                </div>
                                            </div>
                                        </div>
                                        <div class="panel panel-default">
                                            <div class="panel-heading">
                                                <h4 class="panel-title">
                                                    <a class="panel-title__subtitle" data-toggle="collapse" href="#collapse1-13"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, Help_Topic_TripsAndLoops_Question_FindAP%>"/></a>
                                                </h4>
                                            </div>

                                            <div id="collapse1-13" class="panel-collapse collapse">
                                                <div class="panel-body mt-5 mb-5">
                                                    <asp:Literal runat="server" Text="<%$ Resources:LocalizedText, Help_Topic_TripsAndLoops_Question_FindAP_Answer%>"/>
                                                    <br />
                                                </div>
                                            </div>
                                        </div>
                                        <div class="panel panel-default">
                                            <div class="panel-heading">
                                                <h4 class="panel-title">
                                                    <a class="panel-title__subtitle" data-toggle="collapse" href="#collapse1-14"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, Help_Topic_TripsAndLoops_Question_DifferentAP%>"/></a>
                                                </h4>
                                            </div>

                                            <div id="collapse1-14" class="panel-collapse collapse">
                                                <div class="panel-body mt-5 mb-5">
                                                    <asp:Literal runat="server" Text="<%$ Resources:LocalizedText, Help_Topic_TripsAndLoops_Question_DifferentAP_Answer%>"/>
                                                    <br />
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- End of Topic Trip -->

                                    <!-- Topic Dashboard -->
                                    <div class="panel-group <%= localData.SelectedTopic == "Dashboard" ? "panel-group__show" : "" %>">
                                        <div class="panel panel-default">
                                            <div class="panel-heading">
                                                <h4 class="panel-title">
                                                    <a class="panel-title__subtitle" data-toggle="collapse" href="#2-2"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, Help_Topic_UserDashboard_Question_WhatCanIDo%>"/></a>
                                                </h4>
                                            </div>

                                            <div id="2-2" class="panel-collapse collapse">
                                                <div class="panel-body mt-5 mb-5">
                                                    <asp:Literal runat="server" Text="<%$ Resources:LocalizedText, Help_Topic_UserDashboard_Question_WhatCanIDo_Answer%>"/>
                                                    <br />
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- End of Topic Dashboard -->

                                    <!-- Topic Invite -->
                                    <div class="panel-group <%= localData.SelectedTopic == "Invite" ? "panel-group__show" : "" %>">
                                        <div class="panel panel-default">
                                            <div class="panel-heading">
                                                <h4 class="panel-title">
                                                    <a class="panel-title__subtitle" data-toggle="collapse" href="#3-1"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, Help_Topic_Invite_Question_HowManyFriends%>"/></a>
                                                </h4>
                                            </div>

                                            <div id="3-1" class="panel-collapse collapse">
                                                <div class="panel-body mt-5 mb-5">
                                                    <asp:Literal runat="server" Text="<%$ Resources:LocalizedText, Help_Topic_Invite_Question_HowManyFriends_Answer%>"/>
                                                    <br />
                                                </div>
                                            </div>
                                        </div>
                                        <div class="panel panel-default">
                                            <div class="panel-heading">
                                                <h4 class="panel-title">
                                                    <a class="panel-title__subtitle" data-toggle="collapse" href="#3-2"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, Help_Topic_Invite_Question_GiftToYoyoUsers%>"/></a>
                                                </h4>
                                            </div>

                                            <div id="3-2" class="panel-collapse collapse">
                                                <div class="panel-body mt-5 mb-5">
                                                    <asp:Literal runat="server" Text="<%$ Resources:LocalizedText, Help_Topic_Invite_Question_GiftToYoyoUsers_Answer%>"/>
                                                    <br />
                                                </div>
                                            </div>
                                        </div>
                                        <div class="panel panel-default">
                                            <div class="panel-heading">
                                                <h4 class="panel-title">
                                                    <a class="panel-title__subtitle" data-toggle="collapse" href="#3-3"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, Help_Topic_Invite_Question_FriendsBenefits%>"/></a>
                                                </h4>
                                            </div>

                                            <div id="3-3" class="panel-collapse collapse">
                                                <div class="panel-body mt-5 mb-5">
                                                    <asp:Literal runat="server" Text="<%$ Resources:LocalizedText, Help_Topic_Invite_Question_FriendsBenefits_Answer%>"/>
                                                    <br />
                                                </div>
                                            </div>
                                        </div>
                                        <div class="panel panel-default">
                                            <div class="panel-heading">
                                                <h4 class="panel-title">
                                                    <a class="panel-title__subtitle" data-toggle="collapse" href="#3-4"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, Help_Topic_Invite_Question_MyBenefits%>"/></a>
                                                </h4>
                                            </div>

                                            <div id="3-4" class="panel-collapse collapse">
                                                <div class="panel-body mt-5 mb-5">
                                                    <asp:Literal runat="server" Text="<%$ Resources:LocalizedText, Help_Topic_Invite_Question_MyBenefits_Answer%>"/>
                                                    <br />
                                                </div>
                                            </div>
                                        </div>
                                        <div class="panel panel-default">
                                            <div class="panel-heading">
                                                <h4 class="panel-title">
                                                    <a class="panel-title__subtitle" data-toggle="collapse" href="#3-5"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, Help_Topic_Invite_Question_Share%>"/></a>
                                                </h4>
                                            </div>

                                            <div id="3-5" class="panel-collapse collapse">
                                                <div class="panel-body mt-5 mb-5">
                                                    <asp:Literal runat="server" Text="<%$ Resources:LocalizedText, Help_Topic_Invite_Question_Share_Answer%>"/>
                                                    <br />
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- End of Topic Invite -->

                                    <!-- Topic Vehicle -->
                                    <div class="panel-group <%= localData.SelectedTopic == "Vehicle" ? "panel-group__show" : "" %>">
                                        <div class="panel panel-default">
                                            <div class="panel-heading">
                                                <h4 class="panel-title">
                                                    <a class="panel-title__subtitle" data-toggle="collapse" href="#4-1"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, Help_Topic_YoyoloopCars_Question_Wifi%>"/></a>
                                                </h4>
                                            </div>

                                            <div id="4-1" class="panel-collapse collapse">
                                                <div class="panel-body mt-5 mb-5">
                                                    <asp:Literal runat="server" Text="<%$ Resources:LocalizedText, Help_Topic_YoyoloopCars_Question_Wifi_Answer%>"/>
                                                    <br />
                                                </div>
                                            </div>
                                        </div>
                                        <div class="panel panel-default">
                                            <div class="panel-heading">
                                                <h4 class="panel-title">
                                                    <a class="panel-title__subtitle" data-toggle="collapse" href="#4-2"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, Help_Topic_YoyoloopCars_Question_ProfessionalDriver%>"/></a>
                                                </h4>
                                            </div>

                                            <div id="4-2" class="panel-collapse collapse">
                                                <div class="panel-body mt-5 mb-5">
                                                    <asp:Literal runat="server" Text="<%$ Resources:LocalizedText, Help_Topic_YoyoloopCars_Question_ProfessionalDriver_Answer%>"/>
                                                    <br />
                                                </div>
                                            </div>
                                        </div>
                                        <div class="panel panel-default">
                                            <div class="panel-heading">
                                                <h4 class="panel-title">
                                                    <a class="panel-title__subtitle" data-toggle="collapse" href="#4-3"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, Help_Topic_YoyoloopCars_Question_Seats%>"/></a>
                                                </h4>
                                            </div>

                                            <div id="4-3" class="panel-collapse collapse">
                                                <div class="panel-body mt-5 mb-5">
                                                    <asp:Literal runat="server" Text="<%$ Resources:LocalizedText, Help_Topic_YoyoloopCars_Question_Seats_Answer%>"/>
                                                    <br />
                                                </div>
                                            </div>
                                        </div>
                                        <div class="panel panel-default">
                                            <div class="panel-heading">
                                                <h4 class="panel-title">
                                                    <a class="panel-title__subtitle" data-toggle="collapse" href="#4-4"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, Help_Topic_YoyoloopCars_Question_Electric%>"/></a>
                                                </h4>
                                            </div>

                                            <div id="4-4" class="panel-collapse collapse">
                                                <div class="panel-body mt-5 mb-5">
                                                    <asp:Literal runat="server" Text="<%$ Resources:LocalizedText, Help_Topic_YoyoloopCars_Question_Electric_Answer%>"/>
                                                    <br />
                                                </div>
                                            </div>
                                        </div>
                                        <div class="panel panel-default">
                                            <div class="panel-heading">
                                                <h4 class="panel-title">
                                                    <a class="panel-title__subtitle" data-toggle="collapse" href="#4-5"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, Help_Topic_YoyoloopCars_Question_Children%>"/></a>
                                                </h4>
                                            </div>

                                            <div id="4-5" class="panel-collapse collapse">
                                                <div class="panel-body mt-5 mb-5">
                                                    <asp:Literal runat="server" Text="<%$ Resources:LocalizedText, Help_Topic_YoyoloopCars_Question_Children_Answer%>"/>
                                                    <br />
                                                </div>
                                            </div>
                                        </div>
                                        <div class="panel panel-default">
                                            <div class="panel-heading">
                                                <h4 class="panel-title">
                                                    <a class="panel-title__subtitle" data-toggle="collapse" href="#4-6"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, Help_Topic_YoyoloopCars_Question_Insurance%>"/></a>
                                                </h4>
                                            </div>

                                            <div id="4-6" class="panel-collapse collapse">
                                                <div class="panel-body mt-5 mb-5">
                                                    <asp:Literal runat="server" Text="<%$ Resources:LocalizedText, Help_Topic_YoyoloopCars_Question_Insurance_Answer%>"/>
                                                    <br />
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- End of Topic Vehicle -->

                                    <!-- Topic Promo -->
                                    <div class="panel-group <%= localData.SelectedTopic == "Promo" ? "panel-group__show" : "" %>">
                                        <div class="panel panel-default">
                                            <div class="panel-heading">
                                                <h4 class="panel-title">
                                                    <a class="panel-title__subtitle" data-toggle="collapse" href="#5-1"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, Help_Topic_DiscountAndPromo_Question_TwoPromocodes%>"/></a>
                                                </h4>
                                            </div>

                                            <div id="5-1" class="panel-collapse collapse">
                                                <div class="panel-body mt-5 mb-5">
                                                    <asp:Literal runat="server" Text="<%$ Resources:LocalizedText, Help_Topic_DiscountAndPromo_Question_TwoPromocodes_Answer%>"/>
                                                    <br />
                                                </div>
                                            </div>
                                        </div>
                                        <div class="panel panel-default">
                                            <div class="panel-heading">
                                                <h4 class="panel-title">
                                                    <a class="panel-title__subtitle" data-toggle="collapse" href="#5-2"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, Help_Topic_DiscountAndPromo_Question_PromoAndMGM%>"/></a>
                                                </h4>
                                            </div>

                                            <div id="5-2" class="panel-collapse collapse">
                                                <div class="panel-body mt-5 mb-5">
                                                    <asp:Literal runat="server" Text="<%$ Resources:LocalizedText, Help_Topic_DiscountAndPromo_Question_PromoAndMGM_Answer%>"/>
                                                    <br />
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- End of Topic Promo -->

                                    <!-- Topic Luggage -->
                                    <div class="panel-group <%= localData.SelectedTopic == "Luggage" ? "panel-group__show" : "" %>">
                                        <div class="panel panel-default">
                                            <div class="panel-heading">
                                                <h4 class="panel-title">
                                                    <a class="panel-title__subtitle" data-toggle="collapse" href="#6-1"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, Help_Topic_Luggage_Question_CanIBring%>"/></a>
                                                </h4>
                                            </div>

                                            <div id="6-1" class="panel-collapse collapse">
                                                <div class="panel-body mt-5 mb-5">
                                                    <asp:Literal runat="server" Text="<%$ Resources:LocalizedText, Help_Topic_Luggage_Question_CanIBring_Answer%>"/>
                                                    <br />
                                                </div>
                                            </div>
                                        </div>
                                        <div class="panel panel-default">
                                            <div class="panel-heading">
                                                <h4 class="panel-title">
                                                    <a class="panel-title__subtitle" data-toggle="collapse" href="#6-2"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, Help_Topic_Luggage_Question_SizeLimit%>"/></a>
                                                </h4>
                                            </div>

                                            <div id="6-2" class="panel-collapse collapse">
                                                <div class="panel-body mt-5 mb-5">
                                                    <asp:Literal runat="server" Text="<%$ Resources:LocalizedText, Help_Topic_Luggage_Question_SizeLimit_Answer%>"/>
                                                    <br />
                                                </div>
                                            </div>
                                        </div>
                                        <div class="panel panel-default">
                                            <div class="panel-heading">
                                                <h4 class="panel-title">
                                                    <a class="panel-title__subtitle" data-toggle="collapse" href="#6-3"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, Help_Topic_Luggage_Question_NotAllowed%>"/></a>
                                                </h4>
                                            </div>

                                            <div id="6-3" class="panel-collapse collapse">
                                                <div class="panel-body mt-5 mb-5">
                                                    <asp:Literal runat="server" Text="<%$ Resources:LocalizedText, Help_Topic_Luggage_Question_NotAllowed_Answer%>"/>
                                                    <br />
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- End of Topic Luggage -->

                                    <!-- Topic Corporate -->
                                    <div class="panel-group <%= localData.SelectedTopic == "Corporate" ? "panel-group__show" : "" %>">
                                        <div class="panel panel-default">
                                            <div class="panel-heading">
                                                <h4 class="panel-title">
                                                    <a class="panel-title__subtitle" data-toggle="collapse" href="#7-1"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, Help_Topic_Corporate_Question_TaxInvoices%>"/></a>
                                                </h4>
                                            </div>

                                            <div id="7-1" class="panel-collapse collapse">
                                                <div class="panel-body mt-5 mb-5">
                                                    <asp:Literal runat="server" Text="<%$ Resources:LocalizedText, Help_Topic_Corporate_Question_TaxInvoices_Answer%>"/>
                                                    <br />
                                                </div>
                                            </div>
                                        </div>
                                        <div class="panel panel-default">
                                            <div class="panel-heading">
                                                <h4 class="panel-title">
                                                    <a class="panel-title__subtitle" data-toggle="collapse" href="#7-2"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, Help_Topic_Corporate_Question_TotalSpending%>"/></a>
                                                </h4>
                                            </div>

                                            <div id="7-2" class="panel-collapse collapse">
                                                <div class="panel-body mt-5 mb-5">
                                                    <asp:Literal runat="server" Text="<%$ Resources:LocalizedText, Help_Topic_Corporate_Question_TotalSpending_Answer%>"/>
                                                    <br />
                                                </div>
                                            </div>
                                        </div>
                                        <div class="panel panel-default">
                                            <div class="panel-heading">
                                                <h4 class="panel-title">
                                                    <a class="panel-title__subtitle" data-toggle="collapse" href="#7-3"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, Help_Topic_Corporate_Question_CorporatePricing%>"/></a>
                                                </h4>
                                            </div>

                                            <div id="7-3" class="panel-collapse collapse">
                                                <div class="panel-body mt-5 mb-5">
                                                    <asp:Literal runat="server" Text="<%$ Resources:LocalizedText, Help_Topic_Corporate_Question_CorporatePricing_Answer%>"/>
                                                    <br />
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- End of Topic Corporate -->

                                    <!-- Topic Partners -->
                                    <div class="panel-group <%= localData.SelectedTopic == "Partners" ? "panel-group__show" : "" %>">
                                        <div class="panel panel-default">
                                            <div class="panel-heading">
                                                <h4 class="panel-title">
                                                    <a class="panel-title__subtitle" data-toggle="collapse" href="#8-1"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, Help_Topic_Partners_Question_PartnerProgram%>"/></a>
                                                </h4>
                                            </div>

                                            <div id="8-1" class="panel-collapse collapse">
                                                <div class="panel-body mt-5 mb-5">
                                                    <asp:Literal runat="server" Text="<%$ Resources:LocalizedText, Help_Topic_Partners_Question_PartnerProgram_Answer%>"/>
                                                    <br />
                                                </div>
                                            </div>
                                        </div>
                                        <div class="panel panel-default">
                                            <div class="panel-heading">
                                                <h4 class="panel-title">
                                                    <a class="panel-title__subtitle" data-toggle="collapse" href="#8-2"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, Help_Topic_Partners_Question_HowTo%>"/></a>
                                                </h4>
                                            </div>

                                            <div id="8-2" class="panel-collapse collapse">
                                                <div class="panel-body mt-5 mb-5">
                                                    <asp:Literal runat="server" Text="<%$ Resources:LocalizedText, Help_Topic_Partners_Question_HowTo_Answer%>"/>
                                                    <br />
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- End of Topic Partners -->

                                    <!-- Topic Careers -->
                                    <div class="panel-group <%= localData.SelectedTopic == "Careers" ? "panel-group__show" : "" %>">
                                        <div class="panel panel-default">
                                            <div class="panel-heading">
                                                <h4 class="panel-title">
                                                    <a class="panel-title__subtitle" data-toggle="collapse" href="#9-1"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, Help_Topic_Careers_Question_HowTo%>"/></a>
                                                </h4>
                                            </div>

                                            <div id="9-1" class="panel-collapse collapse">
                                                <div class="panel-body mt-5 mb-5">
                                                    <asp:Literal runat="server" Text="<%$ Resources:LocalizedText, Help_Topic_Careers_Question_HowTo_Answer%>"/>
                                                    <br />
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- End of Topic Careers -->

                                </div>
                            </div>
                            <div class="help__separator mb-5 mt-5"></div>
            
                            <div class="row justify-content-center mb-5 align-items-center mt-5">
                                <div class="invitefriends__any-question mr-5"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, Help_CantFind%>"/></div>
                                <a OnClick="javascript:$.blockUI()" href="/Pages/Contact" class="btn btn-default static-page__question-btn static-page__question-btn--white" tabindex="-1" ><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, Help_CantFind_ContactUs%>"/></a>
                            </div>
                        </asp:PlaceHolder>

                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>
    </div>

</asp:Content>