<%@ Page Title="Yoyoloop" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Calendar.aspx.cs" Inherits="MVP.Calendar.Calendar" %>
<%@ MasterType virtualpath="~/Site.Master" %>

<%@ Register Src="~/Controls/DropdownMenuButton.ascx" TagPrefix="yoyo" TagName="DropdownMenuButton" %>
<%@ Register Src="~/Controls/DropdownFixed.ascx" TagPrefix="yoyo" TagName="DropdownFixed" %>
<%@ Register Src="~/Controls/BookingPanel.ascx" TagPrefix="yoyo" TagName="BookingPanel" %>
<%@ Register Src="CalendarTable.ascx" TagPrefix="yoyo" TagName="CalendarTable" %>

<asp:Content ID="CssOverrides" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .homepage__navbar {
            background: unset
        }
            .homepage__navbar a {
                color: #fbfbfb !important
            }
     </style>
</asp:Content>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <header class="head text-center d-flex pb-5">
        <div class="container-fluid">
            <div class="row p-5 dropdown-menus">

                <div class="d-none d-sm-block col-lg-1 col-md-1 startend">
                    <div class="start">
                        <img src="/img/red-dot.png" alt="" class="img-responsive">
                    </div>
                    <div class="switch">
                        <img src="/img/switch@2x.png" alt="" class="img-responsive">
                    </div>
                    <div class="path">
                        <img src="/img/path@2x.png" alt="" class="img-responsive">
                    </div>
                    <div class="end">
                        <img src="/img/end@2x.png" alt="" class="img-responsive">
                    </div>
                </div>

                <div class="col-lg-9 col-md-9">
                    <div class="row">
                        <!-- DESTINO -->
                        <div class="col-lg-4 col-md-4 text-left">
                            <span class="text-uppercase">Destino</span>
                            <yoyo:DropdownMenuButton runat="server" ID="DdlEndRegion" SelectionPrompt="Escolher destino" OnItemSelected="DdlEndRegion_ItemSelected" />
                        </div>
                        <!-- PARAGENS -->
                        <div class="col-lg-8 col-md-8 mx-auto text-left">
                            <span class="text-uppercase">Paragem</span>
                            <yoyo:DropdownMenuButton runat="server" ID="DdlEndAP" SelectionPrompt="Escolher paragem" OnItemSelected="DdlEndAP_ItemSelected" />
                        </div>
                    </div>

                    <div class="row mt-3">
                        <!-- ORIGEM -->
                        <div class="col-lg-4 col-md-4 text-left">
                            <span class="text-uppercase">Origem</span>
                            <yoyo:DropdownMenuButton runat="server" ID="DdlStartRegion" SelectionPrompt="Escolher origem" OnItemSelected="DdlStartRegion_ItemSelected" />
                        </div>      
                        <!-- PARAGENS -->
                        <div class="col-lg-8 col-md-8 mx-auto text-left">
                            <span class="text-uppercase">Paragem</span>
                            <yoyo:DropdownMenuButton runat="server" ID="DdlStartAP" SelectionPrompt="Escolher paragem" OnItemSelected="DdlStartAP_ItemSelected" />
                        </div>
                    </div>
                </div>

                <div class="n-seats col-lg-2 col-md-2 mx-auto text-left">
                    <!-- LUGARES -->
                    <div class="row">
                        <div class="col col-xs-6">
                            <span class="text-uppercase">Lugares</span>
                            <yoyo:DropdownFixed runat="server" ID="DdlSeats" OnItemSelected="DdlSeats_ItemSelected" />
                        </div>
                    </div>
                    <div class="row">
                        <!-- IDA E VOLTA -->
                        <div class="return col col-xs-6 mt-3">
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" value="" id="cbReturnTrip">
                                <label class="form-check-label text-uppercase" for="cbReturnTrip">
                                    Ida e volta
                                </label>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>      
    </header>

    <section class="pt-5" id="book">
        <div class="container-fluid">
            <div class="row">

                <!-- PLACEHOLDER DIV -->
                <div ID="Placeholder" Class="<%= pnCalendar.Visible ? "hide" : "d-flex align-items-center justify-content-center mb-5" %>">
                    <div class="col-md-12 text-center">
                        <h6 class="calendar-placeholder-text text-uppercase pt-4 pb-4">Escolhe o Destino e Origem da viagem</h6>
                        <img class="img-responsive illustration" src="/img/illustration.png"  style="max-width: 1200px;">
                    </div>
                </div>

                <!-- CALENDAR -->
                <asp:panel runat="server" ID="pnCalendar" CssClass="col-lg-8 col-md-8 calendar-background" Visible="false">
                    
                    <!-- CALENDAR HEADER -->
                    <div class="row" id="calendar-header">

                        <!-- calendar-list buttons -->
                        <div class="col my-auto d-none d-sm-block">
                            <button class="btn btn-calendar btn--selected">
                                <img src="/img/calendar.png" srcset="/img/calendar@2x.png 2x, /img/calendar@3x.png 3x" class="btn-calendar">
                            </button>
                            <button class="btn btn-list">
                                <img src="/img/list.png" srcset="/img/list@2x.png 2x, /img/list@3x.png 3x" class="btn-calendar">
                            </button>
                        </div>

                        <!-- Month selector -->
                        <div class="col">
                            <div class="d-flex flex-row">
                                <div class="my-auto col-lg-3 col-md-3 text-right">
                                    <asp:ImageButton id="BtnMonthBack" runat="server" class="btn-calendar" OnClick="CalBtnMonthControl" ImageUrl="/img/arr-left.png" />
                                </div>
                                <div class="col-lg-6 col-md-6">
                                    <p class=" month m-0"><%= localData.Values.CalVisibleDate.ToString("MMMM").ToUpper() %></p>
                                    <p class="d-none d-md-block year m-0"><%= localData.Values.CalVisibleDate.Year %></p>
                                </div>
                                <div class="my-auto col-lg-3 col-md-3 text-left">
                                    <asp:ImageButton id="BtnMonthFwd" runat="server" class="btn-calendar" OnClick="CalBtnMonthControl" ImageUrl="/img/arr-right.png"/>
                                </div>
                            </div>
                        </div>

                        <!-- Today button -->
                        <div class="my-auto col text-right">
                            <asp:button id="BtnMonthToday" runat="server" OnClick="CalBtnMonthToday" CssClass=" btn btn-today text-uppercase" Text="Hoje" />
                        </div>
                    </div>
                    <!-- END OF CALENDAR HEADER -->

                    <!-- VIAGEM DE IDA HIDDEN FOR NOW -->
                    <div class="hide container-fluid mt-3 mb-3">
                        <div class="row departure-date">
                            <div class="col">
                                <div class="row p-2">
                                    <div class="col">
                                        Viagem de ida
                                    </div>
                                </div>
                                <div class="row p-2 text-uppercase">
                                    <div class="col">
                                        14 de Março, Quarta
                                    </div>
                                </div>
                                <div class="row p-2">
                                    <div class="col">
                                        <button class="btn btn-time text-uppercase">09:15</button>
                                    </div>
                                    <div class="col d-flex justify-content-end align-items-center">
                                        25,00€
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
            
                    <!-- CALENDAR TABLE -->
                    <div class="container-fluid calendar-container" id="CalendarContainer">
                        <hr class="d-block d-sm-none">
                        <header>
                            <div class="row p-1 text-uppercase">
                                <h5 class="col p-1 m-0 text-center d-flex align-items-center justify-content-center">Seg</h5>
                                <h5 class="col p-1 m-0 text-center d-flex align-items-center justify-content-center">Ter</h5>
                                <h5 class="col p-1 m-0 text-center d-flex align-items-center justify-content-center">Qua</h5>
                                <h5 class="col p-1 m-0 text-center d-flex align-items-center justify-content-center">Qui</h5>
                                <h5 class="col p-1 m-0 text-center d-flex align-items-center justify-content-center">Sex</h5>
                                <h5 class="col p-1 m-0 text-center d-flex align-items-center justify-content-center">Sab</h5>
                                <h5 class="col p-1 m-0 text-center d-flex align-items-center justify-content-center">Dom</h5>
                            </div>
                        </header>
                        <hr class="d-block d-sm-none">
                        <div class="row border border-bottom-0">
                            <yoyo:CalendarTable runat="server" id="CalDate" PopoverWrapper="destinationPopover" OnDaySelected="CalDate_DaySelected" OnTimeSelected="CalDate_TimeSelected" />
                        </div>
                        <hr class="d-block d-sm-none">
                    </div>

                    <!-- VIAGEM DE VOLTA - HIDDEN FOR NOW -->
                    <div class="container-fluid mt-3 mb-3 hide">
                        <div class="row return-date">
                            <div class="col">
                                <div class="row p-2">
                                    <div class="col">
                                        Viagem de Volta
                                    </div>
                                </div>
                                <div class="row p-2 text-uppercase">
                                    <div class="col">
                                        Escolher
                                    </div>
                                </div>
                                <div class="row p-2">
                                    <div class="col d-flex justify-content-end align-items-center">
                                        00,00€
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- CALENDAR FOOTER -->
                    <div class="row p-3" id="calendar-footer">
                        <div class="col-6 text-nowrap">
                            Ocupação:
                            <span class="pl-2">
                                <img src="/img/ellipse-red.png"
                                    srcset="/img/ellipse-red@2x.png 2x,
                                        /img/ellipse-red@3x.png 3x"
                                    class="EllipseRed">
                                Alta
                            </span>
                            <span class="pl-2">
                                <img src="/img/ellipse-yellow.png"
                                    srcset="/img/ellipse-yellow@2x.png 2x,
                                    /img/ellipse-yellow@3x.png 3x"
                                    class="EllipseRed">
                                Média
                            </span>
                            <span class="pl-2">
                                <img src="/img/ellipse-green.png"
                                    srcset="/img/ellipse-green@2x.png 2x,
                                    /img/ellipse-green@3x.png 3x"
                                    class="EllipseRed">
                                Baixa
                            </span>
                        </div>
                    </div> 
                </asp:panel>
                <!-- END OF CALENDAR -->
            
                <!-- LATERAL -->
                <div ID="Lateral" class="col-lg-4 col-md-4 <%= pnCalendar.Visible ? "" : "hide" %>">

                    <!--PROXIMA VIAGEM-->
                    <div ID="NextTrip" class="<%= BookingPanel.Visible ? "hide" : "" %>">
                        <div class="row p-3 text-uppercase">
                            <div class="col-lg-12 d-flex justify-content-center align-self-center">
                                Proxima Viagem
                            </div>
                        </div>
            
                        <!-- PROXIMA DATA -->
                        <div class="row next-trip">
                            <div class="col-lg-12">
                                <div class="row date">
                                    <div class="col-lg-12 d-flex justify-content-center">13 de Março, Hoje</div>
                                </div>
                                <hr class="divider">
                                <div class="row time">
                                    <div class="col-10">
                                        <!--HORA-->
                                        <div class="row">
                                            <div class="col-1">
                                                <img src="/img/clock.png"
                                                    srcset="/img/clock@2x.png 2x,
                                                    /img/clock@3x.png 3x"
                                                    class="clock">
                                            </div>
                                            <div class="col-8">
                                                <strong>7:30</strong>
                                            </div>
                                        </div>
                                        <!--PREÇO-->
                                        <div class="row price price--limited-availability">
                                            <div class="col-1">
                                                <img src="/img/cart.png"
                                                    srcset="/img/cart@2x.png 2x,
                                                    /img/cart@3x.png 3x"
                                                    class="clock">
                                            </div>
                                            <div class="col-8">
                                                <strong>20,00€</strong>
                                                <span class="ml-1">Quase cheio</span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-2 d-flex justify-content-end">
                                        <button class="btn btn-light btn-xl d-flex justify-content-center btn-cart">  
                                            <img src="/img/cart-light.png"
                                                srcset="/img/cart-light@2x.png 2x,
                                                /img/cart-light@3x.png 3x"
                                                class="cart-light">
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- PROXIMA DATA -->
                        <div class="row next-trip">
                            <div class="col-lg-12">
                                <div class="row date">
                                    <div class="col-lg-12 d-flex justify-content-center">15 de Março, Quarta</div>
                                </div>
                                <hr class="divider">
                                <div class="row time">
                                    <div class="col-8">
                                        <!--HORA-->
                                        <div class="row">
                                            <div class="col-1">
                                                <img src="/img/clock.png"
                                                    srcset="/img/clock@2x.png 2x,
                                                    /img/clock@3x.png 3x"
                                                    class="clock">
                                            </div>
                                            <div class="col-8"><strong>19:30</strong></div>
                                        </div>
                                        <!--PREÇO-->
                                        <div class="row price">
                                            <div class="col-1">
                                                <img src="/img/cart.png"
                                                    srcset="/img/cart@2x.png 2x,
                                                    /img/cart@3x.png 3x"
                                                    class="clock">
                                            </div>
                                            <div class="col-8"><strong>20,00€</strong></div>
                                        </div>
                                    </div>
                                    <div class="col-4 d-flex justify-content-end">
                                        <button class="btn btn-light btn-xl d-flex justify-content-center btn-cart">  
                                            <img src="/img/cart-light.png"
                                                srcset="/img/cart-light@2x.png 2x,
                                                /img/cart-light@3x.png 3x"
                                                class="cart-light">
                                        </button>
                                    </div>
                                </div>
                                <hr class="divider">
                                <div class="row time">
                                    <div class="col-8">
                                        <!--HORA-->
                                        <div class="row">
                                            <div class="col-1">
                                                <img src="/img/clock.png"
                                                    srcset="/img/clock@2x.png 2x,
                                                    /img/clock@3x.png 3x"
                                                    class="clock">
                                            </div>
                                            <div class="col-8"><strong>13:30</strong></div>
                                        </div>
                                        <!--PREÇO-->
                                        <div class="row price price--fully-available">
                                            <div class="col-1">
                                                <img src="/img/cart.png"
                                                    srcset="/img/cart@2x.png 2x,
                                                    /img/cart@3x.png 3x"
                                                    class="clock">
                                            </div>
                                            <div class="col-8"><strong>20,00€</strong></div>
                                        </div>
                                    </div>
                                    <div class="col-4 d-flex justify-content-end">
                                        <button class="btn btn-light btn-xl d-flex justify-content-center btn-cart">  
                                            <img src="/img/cart-light.png"
                                                srcset="/img/cart-light@2x.png 2x,
                                                /img/cart-light@3x.png 3x"
                                                class="cart-light">
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- END OF PROXIMA VIAGEM -->

                    <!-- BOOKING PANEL -->
                    <yoyo:BookingPanel runat="server" ID="BookingPanel" BookingActive="true" OnBookingSelected="BookingPanel_BookingSelected" OnPromoEntered="BookingPanel_PromoEntered" Visible="false" />

                </div>
                <!-- END OF LATERAL -->
            </div>
        </div>
    </section>
</asp:Content>