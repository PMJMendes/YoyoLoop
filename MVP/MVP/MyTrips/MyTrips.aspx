<%@ Page Title="Yoyoloop" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MyTrips.aspx.cs" Inherits="MVP.MyTrips.MyTrips" %>

<%@ Register Src="Ticket.ascx" TagPrefix="yoyo" TagName="Ticket" %>
<%@ Register Src="PastTicket.ascx" TagPrefix="yoyo" TagName="PastTicket" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    
    <div class="travel">
        <div class="travel__container">
            <div class="container-fluid">
                <h1 class="travel__main-title">As Minhas Viagens</h1>
                <br />

                <!-- CONTA CORRENTE HIDDEN FOR NOW -->
                <div class="row travel__current mt-4 mb-4 text-center hide">
                    <div class="col-md-4 p-3 d-flex align-items-center justify-content-center">
                        <p class="travel__current--title text-uppercase">conta corrente</p>
                    </div>
                    <div class="col-md-4 p-3 d-flex align-items-center justify-content-center">
                        <p class="travel__current--amount">Tens <span class="travel__current--amount-red">35€</span> na tua conta</p>
                    </div>
                    <div class="col-md-4 p-3 d-flex align-items-center justify-content-center">
                        <button type="button" class="travel__current--book btn btn-primary text-uppercase">
                            Reservar uma viagem
                        </button>
                    </div>
                </div>
                <!-- END OF CONTA CORRENT -->

                <div id="ActiveBookings" Class="<%= RepActiveBookings.Visible ? "hide" : "" %>">
                    <h5>Não tem viagens</h5>
                </div>
                <asp:Repeater runat="server" ID="RepActiveBookings" OnItemDataBound="RepActiveBookings_ItemDataBound" Visible="false">
                    <ItemTemplate>
                        <yoyo:Ticket runat="server" ID="Ticket"/>
                        <br />
                    </ItemTemplate>
                </asp:Repeater>

                <h1 class="travel__main-title-past pt-5 pb-5">Viagens anteriores</h1>

                <div id="PastBookings" Class="<%= RepActiveBookings.Visible ? "hide" : "" %>">
                    <h5>Não tem viagens anteriores</h5>
                </div>
                <asp:Repeater runat="server" ID="RepPastBookings" OnItemDataBound="RepPastBookings_ItemDataBound" Visible="false">
                    <ItemTemplate>
                        <yoyo:PastTicket runat="server" ID="Ticket" />
                        <br />
                    </ItemTemplate>
                </asp:Repeater>

            </div>
        </div>
    </div>

</asp:Content>
