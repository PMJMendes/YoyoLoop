<%@ Page Title="Yoyoloop"  Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Invite.aspx.cs" Inherits="MVP.Profile.Invite" %>

<asp:Content ID="CssOverrides" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .homepage__navbar {
            background: none
        }
            .homepage__navbar a {
                color: #fbfbfb !important
            }
     </style>
</asp:Content>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <header class="head text-center d-flex pb-5 invitefriends--image">
        <div class="container-fluid">
            <div class="row">
                <div class="invitefriends__main-title"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, Profile_Invite_MainTitle%>"/></div>
            </div>
        </div>
    </header>

    <div class="invitefriends">

        <div class="invitefriends__container invitefriends__container--second">

            <div class="container-fluid d-flex flex-column justify-content-center pt-5 pb-5">
                <div class="row justify-content-center mt-5 mb-5 <%= string.IsNullOrEmpty(pageData.UserMGMCode) ? "hide" : "" %>">
                    <div class="invitefriends__why-catch-ride text-center">
                        <asp:Literal runat="server" Text="<%$ Resources:LocalizedText, Profile_Invite_Saved%>"/> <%= pageData.AmountSaved.ToString() %>€! <br/>
                        <asp:Literal runat="server" Text="<%$ Resources:LocalizedText, Profile_Invite_MGMTrips1%>"/> <%= pageData.MGMTrips.ToString() %> <asp:Literal runat="server" Text="<%$ Resources:LocalizedText, Profile_Invite_MGMTrips2%>"/>
                    </div>
                </div>
                <div class="row row-no-padding">
                    <div class="invitefriends__why-card col-md-4 d-flex flex-column align-items-center">
                        <div class="invitefriends__why-card__image mb-4">
                            <img src="/img/recommend.png" srcset="/img/recommend@2x.png 2x, /img/recommend@3x.png 3x">
                        </div>
                        <div class="invitefriends__why-card__title mb-3"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, Profile_Invite_Why_Recommend_Title%>"/></div>
                        <div class="invitefriends__why-card__separator mb-3"></div>
                        <div class="invitefriends__why-card__content mb-3"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, Profile_Invite_Why_Recommend_Description%>"/></div>
                    </div>

                    <div class="invitefriends__why-card col-md-4 d-flex flex-column align-items-center">
                        <div class="invitefriends__why-card__image mb-4">
                            <img src="/img/friends.png" srcset="/img/friends@2x.png 2x, /img/friends@3x.png 3x">
                        </div>
                        <div class="invitefriends__why-card__title mb-3"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, Profile_Invite_Why_Offer_Title%>"/></div>
                        <div class="invitefriends__why-card__separator mb-3"></div>
                        <div class="invitefriends__why-card__content mb-3"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, Profile_Invite_Why_Offer_Description%>"/></div>
                    </div>

                    <div class="invitefriends__why-card col-md-4 d-flex flex-column align-items-center">
                        <div class="invitefriends__why-card__image mb-4">
                            <img src="/img/transfer.png" srcset="/img/transfer@2x.png 2x, /img/transfer@3x.png 3x">
                        </div>
                        <div class="invitefriends__why-card__title mb-3"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, Profile_Invite_Why_Travel_Title%>"/></div>
                        <div class="invitefriends__why-card__separator mb-3"></div>
                        <div class="invitefriends__why-card__content mb-3"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, Profile_Invite_Why_Travel_Description%>"/></div>
                    </div>
                </div>
            </div>

        </div>

        <asp:UpdatePanel runat="server" ID="upPromoshare" UpdateMode="Conditional">
            <ContentTemplate>
                <div class="invitefriends__container invitefriends__container--third">

                    <textarea class="clipboard hide"><%= pageData.UserMGMCode %></textarea>
                    <script type="text/javascript">
                        var FacebookShareUrl = 'https://www.facebook.com/sharer/sharer.php?u=' + '<%= Request.Url.Authority %>?promocode=<%= pageData.UserMGMCode %>';
                        var TwitterShareUrl = 'https://twitter.com/home?status=<%= Resources.LocalizedText.Profile_Invite_Promoshare_ShareMessage1 + " " + pageData.UserMGMCode + " " + Resources.LocalizedText.Profile_Invite_Promoshare_ShareMessage2%> ' + '<%= Request.Url.Scheme + "://" + Request.Url.Authority + "?promocode=" + pageData.UserMGMCode %>' + ' <%= Resources.LocalizedText.Profile_Invite_Promoshare_ShareMessage3%>';
                        var LinkedInShareUrl = 'https://www.linkedin.com/sharing/share-offsite/?url=' + '<%= Request.Url.Authority %>?promocode=<%= pageData.UserMGMCode %>';
                        var EmailShareUrl = ('mailto:?&subject=&body=' + '<%= Resources.LocalizedText.Profile_Invite_Promoshare_ShareMessage1%> ' + '<%= pageData.UserMGMCode %>' + ' <%= Resources.LocalizedText.Profile_Invite_Promoshare_ShareMessage2%> ' + '<%= Request.Url.Scheme + "://" + Request.Url.Authority + "?promocode=" + pageData.UserMGMCode %>' + ' <%= Resources.LocalizedText.Profile_Invite_Promoshare_ShareMessage3%>').replace(' ', '%20');
                    </script>

                    <asp:PlaceHolder ID="phPromoShareEligible" runat="server" Visible="true">
                        <div class="container-fluid d-flex flex-column align-items-center justify-content-center p-4 invitefriends__promocode">
                            <p class="invitefriends__promocode__text mb-5 text-center"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, Profile_Invite_Promoshare_Title%>"/></p>

                            <asp:PlaceHolder runat="server" ID="phCopyLink" Visible="true">
                                <div id="copy-link-1" class="d-flex align-items-center justify-content-center invitefriends__copy-link row">
                                    <div class="invitefriends__promocode__input mr-5">
                                        <div class="invitefriends__promocode__label"><%= pageData.UserMGMCode %></div>
                                    </div>
                                    <asp:LinkButton runat="server" ID="btnCopyLink" OnClientClick="javascript:clipboardCopy('.clipboard')" OnClick="btnCopyLink_Click" CssClass="invitefriends__promocode__reserve d-flex align-items-center justify-content-center" Text="<%$ Resources:LocalizedText, Profile_Invite_Promoshare_btnCopyLink_Text%>" />
                                </div>
                            </asp:PlaceHolder>

                            <asp:PlaceHolder runat="server" ID="phLinkCopied" Visible="false">
                                <div id="copy-link-2" class="d-flex align-items-center justify-content-center invitefriends__copy-link row">

                                    <!-- Copied popover -->
                                    <div class="invitefriends__popover invitefriends__popover--copied">
                                        <div class="check">

                                        </div>
                                        <asp:Literal runat="server" Text="<%$ Resources:LocalizedText, Profile_Invite_Promoshare_CopiedPopover%>"/>
                                    </div>
                                    <!-- End of copied popover -->

                                    <div runat="server" id="PromocodeInput" class="invitefriends__promocode__input mr-5">
                                        <div class="invitefriends__promocode__label"><%= pageData.UserMGMCode %></div>
                                        <div class="invitefriends__promocode__copy"><asp:LinkButton ID="btnInlineCopyLink" runat="server" OnClientClick="javascript:clipboardCopy('.clipboard')" OnClick="btnInlineCopyLink_Click" Text="<%$ Resources:LocalizedText, Profile_Invite_Promoshare_btnCopyLink_Text%>"/></div>
                                    </div>
                                    <asp:LinkButton runat="server" ID="btnShare" OnClick="btnShare_Click" class="invitefriends__promocode__reserve d-flex align-items-center justify-content-center" Text="Partilhar" />

                                    <asp:PlaceHolder runat="server" ID="phSharePopover" Visible="false">
                                        <!-- Share Popover -->
                                        <div class="invitefriends__popover invitefriends__popover--register">
                                            <div class="invitefriends__popover__link">
                                                <img src="/img/face.png" srcset="/img/face@2x.png 2x, /img/face@3x.png 3x" class="face">
                                                <asp:LinkButton runat="server" ID="btnShareFacebook" OnClick="btnShareTarget_Click" OnClientClick="window.open(FacebookShareUrl, '', 'width=100, height=100, left=24, top=24, scrollbars, resizable');">
                                                    <asp:Literal runat="server" Text="<%$ Resources:LocalizedText, Profile_Invite_Promoshare_ShareMenu_facebook%>"/>
                                                </asp:LinkButton>
                                            </div>
                    
                                            <div class="invitefriends__popover__separator"></div>

                                            <div class="invitefriends__popover__link">
                                                <img src="/img/twitter.png" srcset="/img/twitter@2x.png 2x, /img/twitter@3x.png 3x">
                                                <asp:LinkButton runat="server" ID="btnShareTwitter" OnClick="btnShareTarget_Click" OnClientClick="window.open(TwitterShareUrl, '', 'width=500, height=250, left=24, top=24, scrollbars, resizable');">
                                                    <asp:Literal runat="server" Text="<%$ Resources:LocalizedText, Profile_Invite_Promoshare_ShareMenu_twitter%>"/>
                                                </asp:LinkButton>
                                            </div>

                                            <div class="invitefriends__popover__separator"></div>

                                            <div class="invitefriends__popover__link">
                                                <img src="/img/linkedin.png" srcset="/img/linkedin@2x.png 2x, /img/linkedin@3x.png 3x">
                                                <asp:LinkButton runat="server" ID="btnShareLinkedin" OnClick="btnShareTarget_Click" OnClientClick="window.open(LinkedInShareUrl, '', 'width=600, height=400, left=24, top=24, scrollbars, resizable');">
                                                    <asp:Literal runat="server" Text="<%$ Resources:LocalizedText, Profile_Invite_Promoshare_ShareMenu_linkedin%>"/>
                                                </asp:LinkButton>
                                            </div>

                                            <div class="invitefriends__popover__separator"></div>

                                            <div class="invitefriends__popover__link">
                                                <img src="/img/email.png" srcset="/img/email@2x.png 2x, /img/email@3x.png 3x">
                                                <asp:LinkButton runat="server" ID="btnShareEmail" OnClientClick="location.href=EmailShareUrl" OnClick="btnShareTarget_Click">
                                                    <asp:Literal runat="server" Text="<%$ Resources:LocalizedText, Profile_Invite_Promoshare_ShareMenu_email%>"/>
                                                </asp:LinkButton>
                                            </div>
                                        </div>
                                        <!-- End of Share Popover -->
                                    </asp:PlaceHolder>
                                </div>
                            </asp:PlaceHolder>
                        </div>
                    </asp:PlaceHolder>
                    <asp:PlaceHolder ID="phPromoShareNotEligible" runat="server" Visible="false">
                        <div class="container-fluid d-flex flex-column align-items-center justify-content-center p-4 invitefriends__promocode">
                            <p class="invitefriends__promocode__text mb-5 text-center"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, Profile_Invite_Promoshare_NotEligible%>"/></p>
                        </div>
                    </asp:PlaceHolder>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>

        <div class="invitefriends__container invitefriends__container--forth">
            <div class="container-fluid d-flex flex-column justify-content-center">    
                <div class="row justify-content-center mb-5">
                    <div class="invitefriends__yoyoloop-main-description"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, Profile_Invite_YoyoloopWhy_Title%>"/></div>
                </div>
    
                <div class="row justify-content-center mb-5">
                    <img src="/img/loopico.png" srcset="/img/loopico@2x.png 2x, /img/loopico@3x.png 3x">
                </div>
            
                <div class="row justify-content-center mb-5">
                    <div class="invitefriends__yoyoloop-sub-description"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, Profile_Invite_YoyoloopWhy_Description%>"/></div>
                </div>
    
                <div class="invitefriends__separator mt-5 mb-5"></div>

                <div class="row justify-content-center mb-5 align-items-center">
                    <div class="static-page__any-question mr-5"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_FAQ_Questions%>"/></div>
                    <a OnClick="javascript:$.blockUI()" href="/Help/Help" class="btn btn-default static-page__question-btn static-page__question-btn--white" tabindex="-1" ><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, StaticPages_FAQ_Questions_HelpLink%>"/></a>
                </div>
            </div>
        </div>

    </div>

</asp:Content>