<%@ Control Language="C#" AutoEventWireup="true" Inherits="MVP.Controls.Register" %>

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