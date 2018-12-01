<%@ Page Title="Yoyoloop" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="MVP._Default" %>
<%@ MasterType virtualpath="~/Site.Master" %>

<asp:Content ID="HeadContent" ContentPlaceHolderID="HeadContent" runat="server">
    <title>
        <asp:Literal runat="server" Text="<%$ Resources:LocalizedText, Meta_Homepage_Title%>"/>
    </title>
    <meta name="description" content="<%= Resources.LocalizedText.Meta_Homepage_Description%>">
    <meta name="robots" content="index, follow">
</asp:Content>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <!-- SUGGEST TRIP -->
    <div class="login modal fade" ID="modalSuggestLoop" tabindex="-1" role="dialog" aria-labelledby="cityModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-body">
                    <div class="row text-center">
                        <div class="login__main-title text-uppercase col-12">
                            <asp:Literal runat="server" Text="<%$ Resources:LocalizedText, HomePage_SuggestLoop_MainTitle%>"/>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-12">
                            <hr class="login__separator">
                        </div>
                    </div>
                    <div class="d-flex flex-row align-items-center pt-3 pb-3">
                        <div class="homepage homepage__ suggest homepage__suggest--text d-flex align-items-center justify-content-center text-center col-12 p-0">
                            <asp:Literal runat="server" Text="<%$ Resources:LocalizedText, HomePage_SuggestLoop_Text%>"/>
                        </div>
                    </div>
                    <div class="login__form d-flex flex-row align-items-center pt-3 pb-3">
                        <div class="col-12">
                            <div class="form-group">
                                <asp:TextBox runat="server" ID="tbSuggestEmail" TextMode="Email" CssClass="homepage homepage__suggest homepage__suggest--input form-control" aria-describedby="emailHelp" placeholder="<%$ Resources:LocalizedText, HomePage_SuggestLoop_tbSuggestEmail_placeholder%>" />
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <asp:TextBox runat="server" ID="tbSuggestBody" TextMode="MultiLine" Rows="6" CssClass="form-control"  placeholder="<%$ Resources:LocalizedText, HomePage_SuggestLoop_tbSuggestBody_placeholder%>" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="login__forgot-password col-md-6"></div>
                        <div class="login__log-in col-md-6">
                            <asp:Button runat="server" ID="btnSuggestSend" OnClientClick="javascript:$('#modalSuggestLoop').modal('hide')" OnClick="btnSuggestSend_Click" CssClass="login__login btn btn-primary" Text="<%$ Resources:LocalizedText, HomePage_SuggestLoop_btnSuggestSend%>" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- END SUGGEST TRIP -->

    <div class="homepage">
      <div class="homepage__container homepage__container--first">
        <div class="container-fluid">
          <div class="row">
            <h1 class="homepage__main-title"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, HomePage_MainTitle%>"/></h1>
            <h2 class="homepage__sub-title"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, HomePage_SubTitle%>"/></h2>
          </div>
  
          <div class="row row-no-padding justify-content-between mt-5">
            <div class="homepage__where-to-go"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, HomePage_WhereToGo%>"/></div>
            <a href="#" class="homepage__find-city" data-toggle="modal" data-target="#modalSuggestLoop" tabindex="-1"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, HomePage_SuggestLink%>"/></a>
          </div>
  
          <div class="row row-no-padding mt-3 mb-5">
            <div class="col-md-6 col-lg-3 pl-0">
              <div class="homepage__where-to-card homepage__where-to-card--lisboa mb-2 d-flex flex-column align-items-center">
                <div class="homepage__where-to-card__header pt-3 pb-3 w-100 d-flex justify-content-between align-items-center">
                  <div class="homepage__where-to-card__header__city">Lisboa</div>
                  <div class="homepage__where-to-card__header__price d-flex align-items-center">
                    <div class="flex-column">
                      <div class="homepage__where-to-card__header__price__from"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, HomePage_WhereToCard_Price_From%>"/></div>
                      <div class="homepage__where-to-card__header__price__symbol">€</div>
                    </div>
                    <div class="homepage__where-to-card__header__price__amount"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, General_LoopData_Price_Lisboa%>"/></div>
                  </div>
                </div>
                
                <div class="homepage__where-to-card__separator mb-3"></div>

                <div class="homepage__where-to-card__from mb-2"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, HomePage_WhereToCard_Location_From%>"/> leiria, porto <asp:Literal runat="server" Text="<%$ Resources:LocalizedText, HomePage_WhereToCard_Location_And%>"/> coimbra</div>
                <div class="homepage__where-to-card__when mb-4"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, HomePage_WhereToCard_When_Everyday%>"/></div>
                <a OnClick="javascript:$.blockUI()" href="/Calendar/Calendar?Dest=Lisboa" class="homepage__where-to-card__reserve mb-5 d-flex align-items-center justify-content-center"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, HomePage_WhereToCard_ReserveLink%>"/></a>
              </div>
            </div>
            
            <div class="col-md-6 col-lg-3 pl-0">
              <div class="homepage__where-to-card homepage__where-to-card--leiria mb-2 d-flex flex-column align-items-center">
                <div class="homepage__where-to-card__header pt-3 pb-3 w-100 d-flex justify-content-between align-items-center">
                  <div class="homepage__where-to-card__header__city">Leiria</div>
                  <div class="homepage__where-to-card__header__price d-flex align-items-center">
                    <div class="flex-column">
                      <div class="homepage__where-to-card__header__price__from"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, HomePage_WhereToCard_Price_From%>"/></div>
                      <div class="homepage__where-to-card__header__price__symbol">€</div>
                    </div>
                    <div class="homepage__where-to-card__header__price__amount"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, General_LoopData_Price_Leiria%>"/></div>
                  </div>
                </div>
                
                <div class="homepage__where-to-card__separator mb-3"></div>

                <div class="homepage__where-to-card__from mb-2"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, HomePage_WhereToCard_Location_From%>"/> lisboa</div>
                <div class="homepage__where-to-card__when mb-4"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, HomePage_WhereToCard_When_Everyday%>"/></div>
                <a OnClick="javascript:$.blockUI()" href="/Calendar/Calendar?Dest=Leiria" class="homepage__where-to-card__reserve mb-5 d-flex align-items-center justify-content-center"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, HomePage_WhereToCard_ReserveLink%>"/></a>
              </div>
            </div>

            <div class="col-md-6 col-lg-3 pl-0">
              <div class="homepage__where-to-card homepage__where-to-card--coimbra mb-2 d-flex flex-column align-items-center">
                <div class="homepage__where-to-card__header pt-3 pb-3 w-100 d-flex justify-content-between align-items-center">
                  <div class="homepage__where-to-card__header__city">Coimbra</div>
                  <div class="homepage__where-to-card__header__price d-flex align-items-center">
                    <div class="flex-column">
                      <div class="homepage__where-to-card__header__price__from"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, HomePage_WhereToCard_Price_From%>"/></div>
                      <div class="homepage__where-to-card__header__price__symbol">€</div>
                    </div>
                    <div class="homepage__where-to-card__header__price__amount"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, General_LoopData_Price_Coimbra%>"/></div>
                  </div>
                </div>
                
                <div class="homepage__where-to-card__separator mb-3"></div>

                <div class="homepage__where-to-card__from mb-2"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, HomePage_WhereToCard_Location_From%>"/> Lisboa</div>
                <div class="homepage__where-to-card__when mb-4"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, HomePage_WhereToCard_When_Everyday%>"/></div>
                <a OnClick="javascript:$.blockUI()" href="/Calendar/Calendar?Dest=Coimbra" class="homepage__where-to-card__reserve mb-5 d-flex align-items-center justify-content-center"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, HomePage_WhereToCard_ReserveLink%>"/></a>
              </div>
            </div>

            <div class="col-md-6 col-lg-3 pl-0">
              <div class="homepage__where-to-card homepage__where-to-card--porto mb-2 d-flex flex-column align-items-center">
                <div class="homepage__where-to-card__header pt-3 pb-3 w-100 d-flex justify-content-between align-items-center">
                  <div class="homepage__where-to-card__header__city">Porto</div>
                  <div class="homepage__where-to-card__header__price d-flex align-items-center">
                    <div class="flex-column">
                      <div class="homepage__where-to-card__header__price__from"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, HomePage_WhereToCard_Price_From%>"/></div>
                      <div class="homepage__where-to-card__header__price__symbol">€</div>
                    </div>
                    <div class="homepage__where-to-card__header__price__amount"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, General_LoopData_Price_Porto%>"/></div>
                  </div>
                </div>
                
                <div class="homepage__where-to-card__separator mb-3"></div>

                <div class="homepage__where-to-card__from mb-2"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, HomePage_WhereToCard_Location_From%>"/> Lisboa</div>
                <div class="homepage__where-to-card__when mb-4"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, HomePage_WhereToCard_When_Everyday%>"/></div>
                <a OnClick="javascript:$.blockUI()" href="/Calendar/Calendar?Dest=Porto" class="homepage__where-to-card__reserve mb-5 d-flex align-items-center justify-content-center"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, HomePage_WhereToCard_ReserveLink%>"/></a>
              </div>
            </div>
          </div>
        </div>
      </div>

      <div class="homepage__container homepage__container--second">
        <div class="container-fluid d-flex flex-column justify-content-center">
          <div class="row justify-content-center mb-5">
            <div class="homepage__yoyoloop">YOYOLOOP</div>
          </div>

          <div class="row justify-content-center mb-5">
            <div class="homepage__yoyoloop-main-description"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, HomePage_Yoyoloop_MainDescription%>"/></div>
          </div>

          <div class="row justify-content-center mb-5">
              <img src="/img/loopico.png" srcset="/img/loopico@2x.png 2x, /img/loopico@3x.png 3x">
          </div>
          
          <div class="row justify-content-center mb-5">
            <div class="homepage__yoyoloop-sub-description"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, HomePage_Yoyoloop_SubDescription%>"/></div>
          </div>

          <div class="row justify-content-center mb-5">
            <img class="img-responsive illustration <%= Master.CurrentLanguage == Resources.LocalizedText.SiteMaster_Footer_Language_Portuguese ? "" : "hide" %>" src="/img/infografia_pt.png">
            <img class="img-responsive illustration <%= Master.CurrentLanguage == Resources.LocalizedText.SiteMaster_Footer_Language_Portuguese ? "hide" : "" %>" src="/img/infografia_en.png">
          </div>
        </div>
      </div>

      <div class="homepage__container homepage__container--third">
        <div class="container-fluid">
          <div class="row row-no-padding justify-content-between align-items-center mb-4">
            <div class="homepage__popular-loops__title"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, HomePage_PopularLoops_Title%>"/></div>
            <a OnClick="javascript:$.blockUI()" href="/Pages/Loops" class="homepage__see-all"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, HomePage_PopularLoops_SeeAll_Link%>"/></a>
          </div>

          <div class="row row-no-padding pb-5">
            <div class="col-lg-6 col-md-12 pl-0 mt-2">
              <div class="homepage__popular-loops homepage__popular-loops--image1">
                  <div class="row align-items-center pt-4">
                    <div class="col-sm-4 col-xs-12 d-flex justify-content-center align-items-center flex-column">
                        <img src="/img/stopred.png" srcset="/img/stopred@2x.png 2x, /img/stopred@3x.png 3x">
                        <span class="homepage__popular-loops__city">Porto</span>
                    </div>
                    <div class="col-sm-4 col-xs-12 d-flex justify-content-center">
                        <img src="/img/arrows.png" srcset="/img/arrows@2x.png 2x, /img/arrows@3x.png 3x">
                    </div>
                    <div class="col-sm-4 col-xs-12 d-flex justify-content-center align-items-center flex-column">
                        <img src="/img/stopyellow.png" srcset="/img/stopyellow@2x.png 2x, /img/stopyellow@3x.png 3x">
                        <span class="homepage__popular-loops__city">Lisboa</span>
                    </div>
                  </div>
                  
                  <div class="homepage__popular-loops__separator mt-4 mb-4"></div>

                  <div class="row align-items-center pb-4 ml-5 mr-5">
                    <div class="col-md-8">
                      <div class="row">
                          <div class="col d-flex align-items-center justify-content-center flex-column">
                            <img src="/img/duracao.png" srcset="/img/duracao@2x.png 2x, /img/duracao@3x.png 3x">
                            <span class="homepage__popular-loops__features__main-title"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, HomePage_PopularLoops_Features_Duration%>"/></span>
                            <span class="homepage__popular-loops__features__sub-title"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, General_LoopData_Duration_Porto%>"/></span>
                          </div>
                          
                          <div class="col d-flex align-items-center justify-content-center flex-column">
                            <img src="/img/capacidade.png" srcset="/img/capacidade@2x.png 2x, /img/capacidade@3x.png 3x">
                            <span class="homepage__popular-loops__features__main-title"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, HomePage_PopularLoops_Features_Capacity%>"/></span>
                            <span class="homepage__popular-loops__features__sub-title"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, General_LoopData_Capacity_Porto%>"/> <asp:Literal runat="server" Text="<%$ Resources:LocalizedText, HomePage_PopularLoops_Features_Seats%>"/></span>
                          </div>
    
                          <div class="col d-flex align-items-center justify-content-center flex-column">
                            <img src="/img/wifi.png" srcset="/img/wifi@2x.png 2x, /img/wifi@3x.png 3x">
                            <span class="homepage__popular-loops__features__main-title">Wi-fi</span>
                            <span class="homepage__popular-loops__features__sub-title"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, HomePage_PopularLoops_Features_Free%>"/></span>
                          </div>
    
                          <div class="col d-flex align-items-center justify-content-center flex-column">
                            <img src="/img/preco.png" srcset="/img/preco@2x.png 2x, /img/preco@3x.png 3x">
                            <span class="homepage__popular-loops__features__main-title"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, HomePage_PopularLoops_Features_Price%>"/></span>
                            <span class="homepage__popular-loops__features__sub-title"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, HomePage_PopularLoops_Features_Price_From%>"/> <asp:Literal runat="server" Text="<%$ Resources:LocalizedText, General_LoopData_Price_Porto%>"/>€</span>
                          </div>
                      </div>
                    </div>

                    <div class="col-md-4">
                        <a OnClick="javascript:$.blockUI()" href="/Calendar/Calendar?Dest=Lisboa&Ori=Porto" class="homepage__popular-loops__footer__reserve d-flex align-items-center justify-content-center"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, HomePage_PopularLoops_ReserveLink%>"/></a>
                    </div>
                  </div>
              </div>
            </div>

            <div class="col-lg-6 col-md-12 pl-0 mt-2">
              <div class="homepage__popular-loops homepage__popular-loops--image2">
                  <div class="row align-items-center pt-4">
                    <div class="col-sm-4 col-xs-12 d-flex justify-content-center align-items-center flex-column">
                        <img src="/img/stopred.png" srcset="/img/stopred@2x.png 2x, /img/stopred@3x.png 3x">
                        <span class="homepage__popular-loops__city">Leiria</span>
                    </div>
                    <div class="col-sm-4 col-xs-12 d-flex justify-content-center">
                        <img src="/img/arrows.png" srcset="/img/arrows@2x.png 2x, /img/arrows@3x.png 3x">
                    </div>
                    <div class="col-sm-4 col-xs-12 d-flex justify-content-center align-items-center flex-column">
                        <img src="/img/stopyellow.png" srcset="/img/stopyellow@2x.png 2x, /img/stopyellow@3x.png 3x">
                        <span class="homepage__popular-loops__city">Lisboa</span>
                    </div>
                  </div>
                  
                  <div class="homepage__popular-loops__separator mt-4 mb-4"></div>

                  <div class="row align-items-center pb-4 ml-5 mr-5">
                    <div class="col-md-8">
                      <div class="row">
                          <div class="col d-flex align-items-center justify-content-center flex-column">
                            <img src="/img/duracao.png" srcset="/img/duracao@2x.png 2x, /img/duracao@3x.png 3x">
                            <span class="homepage__popular-loops__features__main-title"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, HomePage_PopularLoops_Features_Duration%>"/></span>
                            <span class="homepage__popular-loops__features__sub-title"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, General_LoopData_Duration_Leiria%>"/></span>
                          </div>
                          
                          <div class="col d-flex align-items-center justify-content-center flex-column">
                            <img src="/img/capacidade.png" srcset="/img/capacidade@2x.png 2x, /img/capacidade@3x.png 3x">
                            <span class="homepage__popular-loops__features__main-title"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, HomePage_PopularLoops_Features_Capacity%>"/></span>
                            <span class="homepage__popular-loops__features__sub-title"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, General_LoopData_Capacity_Leiria%>"/> <asp:Literal runat="server" Text="<%$ Resources:LocalizedText, HomePage_PopularLoops_Features_Seats%>"/></span>
                          </div>
    
                          <div class="col d-flex align-items-center justify-content-center flex-column">
                            <img src="/img/wifi.png" srcset="/img/wifi@2x.png 2x, /img/wifi@3x.png 3x">
                            <span class="homepage__popular-loops__features__main-title">Wi-fi</span>
                            <span class="homepage__popular-loops__features__sub-title"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, HomePage_PopularLoops_Features_Free%>"/></span>
                          </div>
    
                          <div class="col d-flex align-items-center justify-content-center flex-column">
                            <img src="/img/preco.png" srcset="/img/preco@2x.png 2x, /img/preco@3x.png 3x">
                            <span class="homepage__popular-loops__features__main-title"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, HomePage_PopularLoops_Features_Price%>"/></span>
                            <span class="homepage__popular-loops__features__sub-title"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, HomePage_PopularLoops_Features_Price_From%>"/> <asp:Literal runat="server" Text="<%$ Resources:LocalizedText, General_LoopData_Price_Leiria%>"/>€</span>
                          </div>
                      </div>
                    </div>

                    <div class="col-md-4">
                        <a OnClick="javascript:$.blockUI()" href="/Calendar/Calendar?Dest=Lisboa&Ori=Leiria" class="homepage__popular-loops__footer__reserve d-flex align-items-center justify-content-center"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, HomePage_PopularLoops_ReserveLink%>"/></a>
                    </div>
                  </div>
              </div>
            </div>

            <div class="col-lg-6 col-md-12 pl-0 mt-2">
              <div class="homepage__popular-loops homepage__popular-loops--image3">
                <div class="row align-items-center pt-4">
                  <div class="col-sm-4 col-xs-12 d-flex justify-content-center align-items-center flex-column">
                      <img src="/img/stopred.png" srcset="/img/stopred@2x.png 2x, /img/stopred@3x.png 3x">
                      <span class="homepage__popular-loops__city">Coimbra</span>
                  </div>
                  <div class="col-sm-4 col-xs-12 d-flex justify-content-center">
                      <img src="/img/arrows.png" srcset="/img/arrows@2x.png 2x, /img/arrows@3x.png 3x">
                  </div>
                  <div class="col-sm-4 col-xs-12 d-flex justify-content-center align-items-center flex-column">
                      <img src="/img/stopyellow.png" srcset="/img/stopyellow@2x.png 2x, /img/stopyellow@3x.png 3x">
                      <span class="homepage__popular-loops__city">Lisboa</span>
                  </div>
                </div>
                
                <div class="homepage__popular-loops__separator mt-4 mb-4"></div>

                <div class="row align-items-center pb-4 ml-5 mr-5">
                  <div class="col-md-8">
                    <div class="row">
                        <div class="col d-flex align-items-center justify-content-center flex-column">
                          <img src="/img/duracao.png" srcset="/img/duracao@2x.png 2x, /img/duracao@3x.png 3x">
                          <span class="homepage__popular-loops__features__main-title"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, HomePage_PopularLoops_Features_Duration%>"/></span>
                          <span class="homepage__popular-loops__features__sub-title"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, General_LoopData_Duration_Coimbra%>"/></span>
                        </div>
                        
                        <div class="col d-flex align-items-center justify-content-center flex-column">
                          <img src="/img/capacidade.png" srcset="/img/capacidade@2x.png 2x, /img/capacidade@3x.png 3x">
                          <span class="homepage__popular-loops__features__main-title"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, HomePage_PopularLoops_Features_Capacity%>"/></span>
                          <span class="homepage__popular-loops__features__sub-title"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, General_LoopData_Capacity_Coimbra%>"/> <asp:Literal runat="server" Text="<%$ Resources:LocalizedText, HomePage_PopularLoops_Features_Seats%>"/></span>
                        </div>
  
                        <div class="col d-flex align-items-center justify-content-center flex-column">
                          <img src="/img/wifi.png" srcset="/img/wifi@2x.png 2x, /img/wifi@3x.png 3x">
                          <span class="homepage__popular-loops__features__main-title">Wi-fi</span>
                          <span class="homepage__popular-loops__features__sub-title"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, HomePage_PopularLoops_Features_Free%>"/></span>
                        </div>
  
                        <div class="col d-flex align-items-center justify-content-center flex-column">
                          <img src="/img/preco.png" srcset="/img/preco@2x.png 2x, /img/preco@3x.png 3x">
                          <span class="homepage__popular-loops__features__main-title"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, HomePage_PopularLoops_Features_Price%>"/></span>
                          <span class="homepage__popular-loops__features__sub-title"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, HomePage_PopularLoops_Features_Price_From%>"/> <asp:Literal runat="server" Text="<%$ Resources:LocalizedText, General_LoopData_Price_Coimbra%>"/>€</span>
                        </div>
                    </div>
                  </div>

                  <div class="col-md-4">
                      <a OnClick="javascript:$.blockUI()" href="/Calendar/Calendar?Dest=Lisboa&Ori=Coimbra" class="homepage__popular-loops__footer__reserve d-flex align-items-center justify-content-center"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, HomePage_PopularLoops_ReserveLink%>"/></a>
                  </div>
                </div>
              </div>
            </div>
          
            <div class="col-lg-6 col-md-12 pl-0 mt-2">
              <div class="homepage__popular-loops__search w-100 h-100 d-flex flex-column align-items-center justify-content-center">
                <img class="mt-4" src="/img/search.png" srcset="/img/search@2x.png 2x, /img/search@3x.png 3x">
                <div class="mt-3 mb-3 homepage__popular-loops__search__title"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, HomePage_PopularLoops_CantFind%>"/></div>
                <a href="#" class="mb-4 homepage__popular-loops__search__btn d-flex align-items-center justify-content-center" data-toggle="modal" data-target="#modalSuggestLoop" tabindex="-1"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, HomePage_PopularLoops_SuggestLink%>"/></a>
              </div>
            </div>
          </div>
        </div>
      </div>

      <div class="homepage__container homepage__container--forth">
          <div class="container-fluid d-flex flex-column justify-content-center">
              <div class="row justify-content-center mb-5">
                <div class="homepage__why-catch-ride"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, HomePage_Why_Title%>"/></div>
              </div>
              <div class="row row-no-padding">
                <div class="homepage__why-card col-md-3 d-flex flex-column align-items-center">
                  <div class="homepage__why-card__image mb-4">
                    <img src="/img/acessivel.png" srcset="/img/acessivel@2x.png 2x, /img/acessivel@3x.png 3x">
                  </div>
                  <div class="homepage__why-card__title mb-3"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, HomePage_Why_Card_Accessible_Title%>"/></div>
                  <div class="homepage__why-card__sub-title mb-3"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, HomePage_Why_Card_Accessible_SubTitle%>"/></div>
                  <div class="homepage__why-card__separator mb-3"></div>
                  <div class="homepage__why-card__content mb-3"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, HomePage_Why_Card_Accessible_Content%>"/></div>
                </div>

                <div class="homepage__why-card col-md-3 d-flex flex-column align-items-center">
                  <div class="homepage__why-card__image mb-4">
                    <img src="/img/conveniente.png" srcset="/img/conveniente@2x.png 2x, /img/conveniente@3x.png 3x">
                  </div>
                  <div class="homepage__why-card__title mb-3"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, HomePage_Why_Card_Convenient_Title%>"/></div>
                  <div class="homepage__why-card__sub-title mb-3"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, HomePage_Why_Card_Convenient_SubTitle%>"/></div>
                  <div class="homepage__why-card__separator mb-3"></div>
                  <div class="homepage__why-card__content mb-3"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, HomePage_Why_Card_Convenient_Content%>"/></div>
                </div>

                <div class="homepage__why-card col-md-3 d-flex flex-column align-items-center">
                  <div class="homepage__why-card__image mb-4">
                    <img src="/img/fiavel.png" srcset="/img/fiavel@2x.png 2x, /img/fiavel@3x.png 3x">
                  </div>
                  <div class="homepage__why-card__title mb-3"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, HomePage_Why_Card_Reliable_Title%>"/></div>
                  <div class="homepage__why-card__sub-title mb-3"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, HomePage_Why_Card_Reliable_SubTitle%>"/></div>
                  <div class="homepage__why-card__separator mb-3"></div>
                  <div class="homepage__why-card__content mb-3"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, HomePage_Why_Card_Reliable_Content%>"/></div>
                </div>

                <div class="homepage__why-card col-md-3 d-flex flex-column align-items-center">
                  <div class="homepage__why-card__image mb-4">
                    <img src="/img/sustentavel.png" srcset="/img/sustentavel@2x.png 2x, /img/sustentavel@3x.png 3x">
                  </div>
                  <div class="homepage__why-card__title mb-3"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, HomePage_Why_Card_Sustainable_Title%>"/></div>
                  <div class="homepage__why-card__sub-title mb-3"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, HomePage_Why_Card_Sustainable_SubTitle%>"/></div>
                  <div class="homepage__why-card__separator mb-3"></div>
                  <div class="homepage__why-card__content mb-3"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, HomePage_Why_Card_Sustainable_Content%>"/></div>
                </div>
              </div>
          </div>
        </div>
      </div>  
    
</asp:Content>
