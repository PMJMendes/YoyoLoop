<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="BookingPanel.ascx.cs" Inherits="MVP.Calendar.BookingPanel" %>

<div class="row next-trip">
    <div class="col-lg-12 p-0">
        <div class="row time pt-3">
            <div class="col-1 pl-4">
                <img src="/img/calendar-grey.png"
                    srcset="/img/calendar-grey@2x.png 2x,
                    /img/calendar-grey@3x.png 3x"
                    class="calendar-grey">
            </div>
            <div class="col-8"><%= bookingData.StartTime.ToString("dd") %> de <%= bookingData.StartTime.ToString("MMMM") %>, <%= bookingData.StartTime.ToString("dddd") %></div>
                <div class="col-2 text-right text-uppercase direction">Ida</div>
            </div>

            <hr class="divider">
            <div class="row time">
                <div class="col-8">

                    <!-- LUGARES -->
                    <div class="row p-1">
                        <div class="col-1 pl-4">
                            <img src="/img/users.png"
                                srcset="/img/users@2x.png 2x,
                                /img/users@3x.png 3x"
                                class="users">
                        </div>
                        <div class="col-8"><strong><%= bookingData.Seats.ToString() %> <%= bookingData.Seats == 1 ? "Lugar" : "Lugares" %></strong></div>
                    </div>

                    <!--HORA-->
                    <div class="row p-1">
                        <div class="col-1 pl-4">
                            <img src="/img/clock.png"
                                srcset="/img/clock@2x.png 2x,
                                /img/clock@3x.png 3x"
                                class="clock">
                        </div>
                        <div class="col-8"><strong><%= bookingData.StartTime.ToString("HH\\:mm") %></strong></div>
                    </div>

                    <!--PREÇO-->
                    <div class="row p-1 price">
                        <div class="col-1 pl-4">
                            <img src="/img/cart.png"
                            srcset="/img/cart@2x.png 2x,
                            /img/cart@3x.png 3x"
                            class="clock">
                        </div>
                        <div class="col-8"><strong><%= bookingData.Cost.ToString("C") %></strong></div>
                    </div>

            </div>
        </div>

        <hr class="divider">

        <div class="row trip">
            <div class="col-8">
                <div class="row p-1 text-uppercase start-end">
                    <div class="col-12 pl-4">Origem</div>
                </div>
                <div class="row p-1 text-uppercase city-name">
                    <div class="col-12 pl-4"><%= bookingData.StartRegionName %></div>
                </div>
                <div class="row p-1 pt-0 access-point">
                    <div class="col-12 pl-4"><%= bookingData.StartAPName %></div>
                </div>
            </div>
        </div>

        <div class="row pt-3 trip">
            <div class="col-8">
                <div class="row p-1 text-uppercase start-end">
                    <div class="col-12 pl-4">Destino</div>
                </div>
                <div class="row p-1 text-uppercase city-name">
                    <div class="col-12 pl-4"><%= bookingData.EndRegionName %></div>
                </div>
                <div class="row p-1 pt-0 access-point">
                    <div class="col-12 pl-4"><%= bookingData.EndAPName %></div>
                </div>
            </div>
        </div>

        <hr class="divider w-100">

        <div class="row pricing">
            <div class="col-4 pl-4 text-uppercase total">Total</div>
            <div class="col-8 pr-4 text-right">
                <div class="row">
                    <div class="col-12"><%= bookingData.Seats.ToString() %> <%= bookingData.Seats == 1 ? "Lugar" : "Lugares" %><span class="times"> x</span> <span class="price"><%= (bookingData.Seats != 0 ? (bookingData.Cost / bookingData.Seats) : 0).ToString("C") %></span></div>
                </div>
                <div class="row">
                    <div class="col-12 total-price"><%= bookingData.Cost.ToString("C") %></div>
                </div>
            </div>
        </div>

        <hr class="divider">

        <div class="row pricing">
            <div class="col-12">
                <div class="row">
                    <div class="col-12 text-center promocode">Tenho um código promocional</div>
                </div>
                <div class="row p-4">
                    <div class="col-12 text-center">
                        <button class="btn btn-light btn-xl text-uppercase" >Reservar</button>
                    </div>
                </div>
            </div>
        </div>

        <!-- EXTENDED PROMO CODE -->
        <div class="hide">
            <hr class="divider">

            <div class="row pricing">
                <div class="col-12">
                    <div class="row">
                        <div class="col-12 text-center promocode promocode--active">Nao tenho código promocional</div>
                    </div>
                    <div class="row p-3">
                        <div class="col-12 text-center promocode promocode--active">
                            <div class="input-group mb-3">
                                <input type="text" class="form-control" placeholder="Inserir codigo promocional" aria-label="Inserir codigo promocional" aria-describedby="basic-addon2">
                                <div class="input-group-append">
                                    <span class="input-group-text" id="basic-addon2">
                                        <img src="/img/check.png"
                                            srcset="/img/check@2x.png 2x,
                                            /img/check@3x.png 3x"
                                            class="check">
                                    </span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row pb-3">
                        <div class="col-12 text-center">
                            <button class="btn btn-light btn-xl text-uppercase" >Reservar</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- END OF EXTENDED PROMO CODE -->
    </div>
</div>