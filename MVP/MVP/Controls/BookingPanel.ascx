<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="BookingPanel.ascx.cs" Inherits="MVP.Controls.BookingPanel" %>

<asp:UpdatePanel runat="server" ID="upBookingPanel">
    <ContentTemplate>
        <div class="row next-trip">
            <div class="col-lg-12 p-0">
                <div class="row time pt-3">
                    <div class="col-1 pl-4">
                        <img src="/img/calendar-grey.png"
                            srcset="/img/calendar-grey@2x.png 2x,
                            /img/calendar-grey@3x.png 3x"
                            class="calendar-grey">
                    </div>
                    <div class="col-8"><asp:label runat="server" ID="LbDate"><%= PanelData.StartTime.ToString("dd MMMM").ToUpper() %>, <%= PanelData.StartTime.ToString("dddd").ToUpper() %></asp:label></div>
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
                                <div class="col-8"><strong><asp:label runat="server" ID="LbSeats"><%= PanelData.Seats.ToString() %><%= PanelData.Seats == 1 ? " Lugar" : " Lugares" %></asp:label></strong></div>
                            </div>

                            <!--HORA-->
                            <div class="row p-1">
                                <div class="col-1 pl-4">
                                    <img src="/img/clock.png"
                                        srcset="/img/clock@2x.png 2x,
                                        /img/clock@3x.png 3x"
                                        class="clock">
                                </div>
                                <div class="col-8"><strong><asp:label runat="server" ID="LbTime"><%= PanelData.StartTime.ToString("HH\\:mm") %></asp:label></strong></div>
                            </div>

                            <!--PREÇO-->
                            <div class="row p-1 price">
                                <div class="col-1 pl-4">
                                    <img src="/img/cart.png"
                                    srcset="/img/cart@2x.png 2x,
                                    /img/cart@3x.png 3x"
                                    class="clock">
                                </div>
                                <div class="col-8"><strong><asp:label runat="server" ID="LbCost"><%= PanelData.StandardCost.ToString("C") %></asp:label></strong></div>
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
                            <div class="col-12 pl-4"><asp:label runat="server" ID="LbStartRegion"><%= PanelData.StartRegionName %></asp:label></div>
                        </div>
                        <div class="row p-1 pt-0 access-point">
                            <div class="col-12 pl-4"><asp:label runat="server" ID="LbStartAP"><%= PanelData.StartAPName %></asp:label></div>
                        </div>
                    </div>
                </div>

                <div class="row pt-3 trip">
                    <div class="col-8">
                        <div class="row p-1 text-uppercase start-end">
                            <div class="col-12 pl-4">Destino</div>
                        </div>
                        <div class="row p-1 text-uppercase city-name">
                            <div class="col-12 pl-4"><asp:label runat="server" ID="LbEndRegion"><%= PanelData.EndRegionName %></asp:label></div>
                        </div>
                        <div class="row p-1 pt-0 access-point">
                            <div class="col-12 pl-4"><asp:label runat="server" ID="LbEndAP"><%= PanelData.EndAPName %></asp:label></div>
                        </div>
                    </div>
                </div>

                <hr class="divider w-100">

                <!-- RESUMO -->
                <div class="row pricing">
                    <div class="col-4 pl-4 text-uppercase total">Resumo</div>
                    <div class="col-8 pr-4 text-right">
                        <div class="row <%= PanelData.PromoValid ? "" : "hide" %>">
                            <div class="col-12"><s><%= PanelData.Seats.ToString() %> <%= PanelData.Seats == 1 ? "Lugar" : "Lugares" %><span class="times"> x</span> <span class="price"><%= PanelData.StandardPrice.ToString("C") %></span></s></div>
                        </div>
                        <div class="row">
                            <div class="col-12"><%= PanelData.Seats.ToString() %> <%= PanelData.Seats == 1 ? "Lugar" : "Lugares" %><span class="times"> x</span> <span class="price"><%= PanelData.Price.ToString("C") %></span></div>
                        </div>
                        <!-- PriceItem Styles -->
                        <div class="hide">
                            <div class="row pb-1">
                                <div class="col-12">Promocode <span class="price pl-1"><%= PanelData.Price.ToString("C") %></span></div>
                            </div>
                            <div class="row">
                                <div class="col-12">Promocode <span class="price-green pl-1">-<%= PanelData.Price.ToString("C") %></span></div>
                            </div>
                            <div class="row">
                                <div class="col-12">Promocode <span class="price-green pl-1">-<%= PanelData.Price.ToString("C") %></span></div>
                            </div>
                            <div class="row">
                                <div class="col-12">Promocode <span class="pl-1">-<%= PanelData.Price.ToString("C") %></span></div>
                            </div>
                        </div>
                        <!-- End of PriceItemStyles -->
                    </div>
                </div>
                <!-- END OF RESUMO -->
                
                <!-- PREÇO FINAL -->
                <div class="row pricing">
                    <div class="col-6 pl-4 align-self-end text-uppercase total">Preço Final</div>
                    <div class="col-6 pr-4 text-right">
                        <div class="row <%= PanelData.PromoValid ? "" : "hide" %>">
                            <div class="col-12 total-price"><s><%= PanelData.StandardCost.ToString("C") %></s></div>
                        </div>
                        <div class="row">
                            <div class="col-12 total-price"><%= PanelData.Cost.ToString("C") %></div>
                        </div>
                    </div>
                </div>
                <!-- END OF PREÇO FINAL -->

                <div id="Booking" class="<%= BookingActive ? "" : "hide" %>">
                    <hr class="divider">

                    <div class="row pricing">
                        <div class="col-12">
                            <div id="divNoPromocode" class="<%= pnPromocode.Visible ? "hide" : "" %>">
                                <div class="row">
                                    <div class="col-12 text-center promocode">
                                        <a runat="server" id="lkPromo" OnServerClick="lkPromo_ServerClick">Tenho um código promocional</a>
                                    </div>
                                </div>
                            </div>
                            <asp:Panel runat="server" ID="pnPromocode" Visible="false">
                                <div class="row">
                                    <div class="col-12 text-center promocode promocode--active">
                                        <a runat="server" id="lkNoPromo" OnServerClick="lkPromo_ServerClick">Não tenho código promocional</a>
                                    </div>
                                </div>
                                <div class="row p-3">
                                    <div class="d-flex justify-content-center col-12 text-center promocode promocode--active">
                                        <div class="input-group mb-3 d-flex justify-content-center">
                                            <asp:panel runat="server" ID="pnPromoError" class="input-group-append" Visible="false">
                                                <span class="input-group-text">
                                                    <img src="/img/alert.png"
                                                        srcset="/img/alert@2x.png 2x,
                                                        /img/alert@3x.png 3x">
                                                </span>
                                            </asp:panel>
                                            <asp:panel runat="server" ID="pnPromoCheck" CssClass="input-group-append" Visible="false">
                                                <span class="input-group-text">
                                                    <img src="/img/check.png"
                                                        srcset="/img/check@2x.png 2x,
                                                        /img/check@3x.png 3x"
                                                        class="check">
                                                </span>
                                            </asp:panel>

                                            <%-- tem que ficar antes do input senao nao funciona %>

                                            <%-- Bola vermelha default do lado direito, aparecer so enquanto nao foi validado 
                                            <span class="input-group-text promocode-default">
                                                <img src="/img/check.png"
                                                    srcset="/img/check@2x.png 2x,
                                                    /img/check@3x.png 3x"
                                                    class="check">
                                            </span> --%>
                                            
                                             <%-- Quando promocode é approved, tem que se mudar o texto para o que estiver dentro do input 
                                            <span class="input-group-text text-center promocode-approved">
                                                YOYOLOOP12345
                                            </span>--%>

                                             <%-- Quando promocode ja foi usado, tem que se mudar o texto para o que estiver dentro do input --%>
                                            <span class="input-group-text text-center promocode-error">
                                                YOYOLOOP12345
                                            </span>
                                            <span class="input-group-text promocode-clean">
                                                <img src="/img/closebtn.png"
                                                     srcset="/img/closebtn@2x.png 2x,
                                                             /img/closebtn@3x.png 3x"
                                                     class="closebtn">
                                            </span>
                                            <asp:Textbox runat="server" ID="tbPromo" OnTextChanged="tbPromo_TextChanged" type="text" AutoComplete="promocode" AutoPostback="true" CssClass="form-control" placeholder="Inserir codigo promocional" aria-label="Inserir codigo promocional" aria-describedby="basic-addon2" />
                                        </div>
                                    </div>
                                </div>
                            </asp:Panel>
                            <div class="row p-4">
                                <div class="col-12 text-center">
                                    <asp:button runat="server" ID="BtnBook" OnClick="BtnBook_Click" CssClass="btn btn-light btn-xl text-uppercase" Text="Reservar" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </ContentTemplate>
</asp:UpdatePanel>