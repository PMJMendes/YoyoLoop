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
          </div>
          <div class="row">
            <h2 class="homepage__sub-title"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, HomePage_SubTitle%>"/></h2>
          </div>
        </div>
      </div>

    <div class="container-fluid homepage__container homepage__container--second">
        <div class="row homepage__popular-loops">
            <div class="col-lg-6 col-md-12 mb-4">
                <div class="homepage__popular-loops__item homepage__popular-loops__item--image1">
                    <div class="row align-items-center homepage__popular-loops__item__row">
                        <div class="col-4 d-flex justify-content-center align-items-center flex-column">
                            <img src="/img/stopred.png" srcset="/img/stopred@2x.png 2x, /img/stopred@3x.png 3x" class="img-responsive">
                            <span class="homepage__popular-loops__item__city">Porto</span>
                        </div>
                        <div class="col-4  d-flex justify-content-center">
                            <img src="/img/arrows.png" srcset="/img/arrows@2x.png 2x, /img/arrows@3x.png 3x" class="img-responsive">
                        </div>
                        <div class="col-4 d-flex justify-content-center align-items-center flex-column">
                            <img src="/img/stopyellow.png" srcset="/img/stopyellow@2x.png 2x, /img/stopyellow@3x.png 3x" class="img-responsive">
                            <span class="homepage__popular-loops__item__city">Lisboa</span>
                        </div>
                    </div>
                  
                    <div class="homepage__popular-loops__item__separator"></div>

                    <div class="row align-items-center homepage__popular-loops__item__row">
                        <div class="col-1"></div>
                        <div class="col-6 homepage__popular-loops__item__price d-flex align-items-end justify-content-left">
                            <span class="homepage__popular-loops__item__price__from">
                                <asp:Literal runat="server" Text="<%$ Resources:LocalizedText, HomePage_WhereToCard_Price_From%>"/>
                            </span>
                            <span class="homepage__popular-loops__item__price__amount mr-1 ml-1">
                                <asp:Literal runat="server" Text="<%$ Resources:LocalizedText, General_LoopData_Price_Lisboa%>"/>
                            </span>
                            <span class="homepage__popular-loops__item__price__symbol">€</span>
                        </div>
                        <div class="col-4">
                            <a OnClick="javascript:$.blockUI()" href="/Calendar/Calendar?Dest=Lisboa&Ori=Porto" class="homepage__popular-loops__item__reserve-btn d-flex align-items-center justify-content-center">
                                <asp:Literal runat="server" Text="<%$ Resources:LocalizedText, HomePage_PopularLoops_ReserveLink%>"/>
                            </a>
                        </div>
                        <div class="col-1"></div>
                    </div>
                </div>
            </div>

            <div class="col-lg-6 col-md-12 mb-4">
                <div class="homepage__popular-loops__item homepage__popular-loops__item--image2">
                    <div class="row align-items-center homepage__popular-loops__item__row">
                        <div class="col-4 d-flex justify-content-center align-items-center flex-column">
                            <img src="/img/stopred.png" srcset="/img/stopred@2x.png 2x, /img/stopred@3x.png 3x">
                            <span class="homepage__popular-loops__item__city">Braga</span>
                        </div>
                        <div class="col-4 d-flex justify-content-center">
                            <img src="/img/arrows.png" srcset="/img/arrows@2x.png 2x, /img/arrows@3x.png 3x">
                        </div>
                        <div class="col-4 d-flex justify-content-center align-items-center flex-column">
                            <img src="/img/stopyellow.png" srcset="/img/stopyellow@2x.png 2x, /img/stopyellow@3x.png 3x">
                            <span class="homepage__popular-loops__item__city">Lisboa</span>
                        </div>
                    </div>
                  
                    <div class="homepage__popular-loops__item__separator"></div>

                    <div class="row align-items-center homepage__popular-loops__item__row">
                        <div class="col-8 homepage__popular-loops__item__price d-flex align-items-end justify-content-left">
                            <span class="homepage__popular-loops__item__price__from">
                                <asp:Literal runat="server" Text="<%$ Resources:LocalizedText, HomePage_WhereToCard_Price_From%>"/>
                            </span>
                            <span class="homepage__popular-loops__item__price__amount mr-1 ml-1">
                                <asp:Literal runat="server" Text="<%$ Resources:LocalizedText, General_LoopData_Price_Leiria%>"/>
                            </span>
                            <span class="homepage__popular-loops__item__price__symbol">€</span>
                        </div>
                        <div class="col-4">
                            <a OnClick="javascript:$.blockUI()" href="/Calendar/Calendar?Dest=Lisboa&Ori=Braga" class="homepage__popular-loops__item__reserve-btn d-flex align-items-center justify-content-center">
                                <asp:Literal runat="server" Text="<%$ Resources:LocalizedText, HomePage_PopularLoops_ReserveLink%>"/>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row  homepage__popular-loops">
            <div class="col-lg-6 col-md-12 mb-4">
                <div class="homepage__popular-loops__item homepage__popular-loops__item--image3">
                    <div class="row align-items-center homepage__popular-loops__item__row">
                        <div class="col-4 d-flex justify-content-center align-items-center flex-column">
                            <img src="/img/stopred.png" srcset="/img/stopred@2x.png 2x, /img/stopred@3x.png 3x">
                            <span class="homepage__popular-loops__item__city">Coimbra</span>
                        </div>
                        <div class="col-4 d-flex justify-content-center">
                            <img src="/img/arrows.png" srcset="/img/arrows@2x.png 2x, /img/arrows@3x.png 3x">
                        </div>
                        <div class="col-4 d-flex justify-content-center align-items-center flex-column">
                            <img src="/img/stopyellow.png" srcset="/img/stopyellow@2x.png 2x, /img/stopyellow@3x.png 3x">
                            <span class="homepage__popular-loops__item__city">Lisboa</span>
                        </div>
                    </div>
                  
                    <div class="homepage__popular-loops__item__separator"></div>

                    <div class="row align-items-center homepage__popular-loops__item__row">
                        <div class="col-8 homepage__popular-loops__item__price d-flex align-items-end justify-content-left">
                            <span class="homepage__popular-loops__item__price__from">
                                <asp:Literal runat="server" Text="<%$ Resources:LocalizedText, HomePage_WhereToCard_Price_From%>"/>
                            </span>
                            <span class="homepage__popular-loops__item__price__amount mr-1 ml-1">
                                <asp:Literal runat="server" Text="<%$ Resources:LocalizedText, General_LoopData_Price_Coimbra%>"/>
                            </span>
                            <span class="homepage__popular-loops__item__price__symbol">€</span>
                        </div>
                        <div class="col-4">
                            <a OnClick="javascript:$.blockUI()" href="/Calendar/Calendar?Dest=Lisboa&Ori=Coimbra" class="homepage__popular-loops__item__reserve-btn d-flex align-items-center justify-content-center">
                                <asp:Literal runat="server" Text="<%$ Resources:LocalizedText, HomePage_PopularLoops_ReserveLink%>"/>
                            </a>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-lg-6 col-md-12 mb-4">
                <div class="homepage__popular-loops__item homepage__popular-loops__item__search w-100 h-100 d-flex flex-column align-items-center justify-content-center">
                <img class="mt-4" src="/img/search.png" srcset="/img/search@2x.png 2x, /img/search@3x.png 3x">
                <div class="mt-3 mb-3 homepage__popular-loops__item__search__title"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, HomePage_PopularLoops_CantFind%>"/></div>
                <a href="#" class="mb-4 homepage__popular-loops__item__search__btn d-flex align-items-center justify-content-center" data-toggle="modal" data-target="#modalSuggestLoop" tabindex="-1"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, HomePage_PopularLoops_SuggestLink%>"/></a>
                </div>
            </div>
        </div>
    </div>

      <div class="homepage__container homepage__container--third">
        <div class="container-fluid">
          <div class="row homepage__yoyoloop-title">YOYOLOOP</div>

          <div class="row homepage__yoyoloop-main-description">
              <asp:Literal runat="server" Text="<%$ Resources:LocalizedText, HomePage_Yoyoloop_MainDescription%>"/>
          </div>

          <div class="row homepage__yoyoloop-loopico">
              <img src="/img/loopico.png" srcset="/img/loopico@2x.png 2x, /img/loopico@3x.png 3x">
          </div>
          
          <div class="row homepage__yoyoloop-illustration">
            <img class="img-responsive illustration <%= Master.CurrentLanguage == Resources.LocalizedText.SiteMaster_Footer_Language_Portuguese ? "" : "hide" %>" src="/img/infografia_pt.png">
            <img class="img-responsive illustration <%= Master.CurrentLanguage == Resources.LocalizedText.SiteMaster_Footer_Language_Portuguese ? "hide" : "" %>" src="/img/infografia_en.png">
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
