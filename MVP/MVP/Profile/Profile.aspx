<%@ Page Title="Yoyoloop" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="MVP.Profile.Profile" %>

<asp:Content ID="HeadContent" ContentPlaceHolderID="HeadContent" runat="server">
    <meta name="robots" content="noindex, follow">
</asp:Content>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="profile">
        <div class="profile__container profile__container--first">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-8">
                        <h1 class="profile__main-title"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, Profile_MainTitle%>"/></h1>

                        <h2 class="profile__sub-title"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, Profile_PersonalDetails_Title%>"/></h2>

                        <asp:UpdatePanel runat="server" ID="upProfileData" UpdateMode="Conditional">
                            <ContentTemplate>
                                <div class="profile__label"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, Profile_PersonalDetails_ProfileDataForm_tbName_Label%>"/></div>
                                <asp:TextBox runat="server" ID="txtName" AutoPostBack="false" CssClass="profile__input profile__input--name" type="text" autocomplete="name" Tabindex="0" />
                                <div class="profile__input--validator"><asp:RequiredFieldValidator runat="server" ValidationGroup="PersonalDetails" ControlToValidate="txtName" CssClass="text-danger" Display="Dynamic" ErrorMessage="<%$ Resources:LocalizedText, Profile_PersonalDetails_ProfileDataForm_tbName_Validator_ErrorMessage%>" /></div>

                                <div class="profile__label"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, Profile_PersonalDetails_ProfileDataForm_tbBirthDate_Label%>"/></div>
                                <asp:TextBox runat="server" ID="txtBirthDate" AutoPostBack="false" CssClass="profile__input profile__input--birthday" type="text" autocomplete="bday" Tabindex="0" placeholder="<%$ Resources:LocalizedText, Profile_PersonalDetails_ProfileDataForm_tbBirthDate_placeholder%>" />
                                <div class="profile__input--validator"><asp:CompareValidator runat="server" Type="Date" CultureInvariantValues="true" Operator="DataTypeCheck" ValidationGroup="PersonalDetails" ControlToValidate="txtBirthDate" CssClass="profile__input--validator text-danger" Display="Dynamic" ErrorMessage="<%$ Resources:LocalizedText, Profile_PersonalDetails_ProfileDataForm_tbBirthDate_CompareValidator_ErrorMessage%>"/></div>
                
                                <div class="profile__label"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, Profile_PersonalDetails_ProfileDataForm_tbEmail_Label%>"/></div>
                                <div class="row ml-0">
                                    <asp:Label runat="server" ID="lbEmail" class="profile__input profile__input--email" />
                                    <div class="<%= pageData.EmailConfirmed ? "row ml-0 align-items-center justify-content-center" : "hide" %>">
                                        <div class="ml-3 mr-3 confirm-check"></div>
                                        <div class="profile__confirm-check"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, Profile_PersonalDetails_ProfileDataForm_tbEmail_Confirmed%>"/></div>
                                    </div>
                                    <div class="<%= pageData.EmailConfirmed ? "hide" : "row ml-0 align-items-center justify-content-center" %>"">
                                        <div class="ml-3 mr-3 confirm-notcheck"></div>
                                        <div class="profile__confirm-check"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, Profile_PersonalDetails_ProfileDataForm_tbEmail_NotConfirmed%>"/></div>
                                        &nbsp;&nbsp;&nbsp;&nbsp;
                                        <asp:LinkButton runat="server" ID="btnConfirmEmail" OnClick="btnConfirmEmail_Click" CssClass="profile__white-btn text-uppercase"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, Profile_PersonalDetails_ProfileDataForm_btnConfirmEmail_Text%>"/></asp:LinkButton>
                                    </div>
                                </div>

                                <div class="profile__label"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, Profile_PersonalDetails_ProfileDataForm_tbPhoneNumber_Label%>"/></div>
                                <div class="row ml-0">
                                    <select class="profile__input profile__input--country" tabindex="-1">
                                        <option value="351">+351</option>
                                    </select>
                                    <asp:TextBox runat="server" ID="txtPhoneNumber" AutoPostBack="false" CssClass="ml-2 profile__input profile__input--phone" type="text" autocomplete="tel-national" Tabindex="0" placeholder="000 000 000" />
                                    <div class="<%= pageData.PhoneNumberConfirmed ? "row ml-0 align-items-center justify-content-center" : "hide" %>">
                                        <div class="ml-3 mr-3 confirm-check"></div>
                                        <div class="profile__confirm-check"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, Profile_PersonalDetails_ProfileDataForm_tbPhoneNumber_Confirmed%>"/></div>
                                    </div>
                                    <div class="<%= pageData.PhoneNumberConfirmed ? "hide" : "row ml-0 align-items-center justify-content-center" %>"">
                                        <div class="ml-3 mr-3 confirm-notcheck"></div>
                                        <div class="profile__confirm-check"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, Profile_PersonalDetails_ProfileDataForm_tbPhoneNumber_NotConfirmed%>"/></div>
                                    </div>
                                </div>
                                <div class="profile__input--validator"><asp:CompareValidator runat="server" Type="Integer" Operator="DataTypeCheck" ValidationGroup="PersonalDetails" ControlToValidate="txtPhoneNumber" CssClass="profile__input--validator text-danger" Display="Dynamic" ErrorMessage="<%$ Resources:LocalizedText, Profile_PersonalDetails_ProfileDataForm_tbPhoneNumber_CompareValidator_ErrorMessage%>"/></div>
                            </ContentTemplate>
                        </asp:UpdatePanel>

                        <div class="mt-5 mb-5 profile__separator"></div>
                        <asp:button runat="server" ID="btnProfileSave" CausesValidation="true" ValidationGroup="PersonalDetails" OnClick="btnProfileSave_Click" CssClass="mb-5 profile__btn" Text="<%$ Resources:LocalizedText, Profile_PersonalDetails_ProfileDataForm_btnProfileSave_Text%>" Tabindex="0" />

                        <asp:UpdatePanel runat="server" ID="upEmailChange" UpdateMode="Conditional">
                            <ContentTemplate>
                                <h2 class="profile__sub-title"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, Profile_PersonalDetails_ChangeEmail_Title%>"/></h2>
                                <div class="profile__label"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, Profile_PersonalDetails_ChangeEmail_tbChangeEmailPassword_Label%>"/></div>
                                <asp:TextBox runat="server" id="tbChangeEmailPassword" TextMode="Password" AutoPostBack="false" CssClass="profile__input profile__input--password" placeholder="<%$ Resources:LocalizedText, Profile_PersonalDetails_ChangeEmail_tbChangeEmailPassword_placeholder%>" Tabindex="1" />
                                <div class="profile__input--validator"><asp:RequiredFieldValidator runat="server" ValidationGroup="ChangeEmail" ControlToValidate="tbChangeEmailPassword" CssClass="text-danger" Display="Dynamic" ErrorMessage="<%$ Resources:LocalizedText, Profile_PersonalDetails_ChangeEmail_tbChangeEmailPassword_Validator_ErrorMessage%>" /></div>
                                <div class="profile__label"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, Profile_PersonalDetails_ChangeEmail_tbChangeEmail_Label%>"/></div>
                                <asp:TextBox runat="server" ID="txtChangeEmail" TextMode="Email" AutoPostBack="false" class="profile__input profile__input--email" Tabindex="1" />
                                <div class="profile__input--validator"><asp:RequiredFieldValidator runat="server" ValidationGroup="ChangeEmail" ControlToValidate="txtChangeEmail" CssClass="text-danger" Display="Dynamic" ErrorMessage="<%$ Resources:LocalizedText, Profile_PersonalDetails_ChangeEmail_tbChangeEmail_Label_Validator_ErrorMessage%>" /></div>
                                <div class="profile__label"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, Profile_PersonalDetails_ChangeEmail_tbConfirmChangeEmail_Label%>"/></div>
                                <asp:TextBox runat="server" ID="txtConfirmChangeEmail" TextMode="Email" OnPaste="return false" AutoPostBack="false" class="profile__input profile__input--email" Tabindex="1" />
                                <div class="profile__input--validator">
                                    <asp:RequiredFieldValidator runat="server" ValidationGroup="ChangeEmail" ControlToValidate="txtConfirmChangeEmail" CssClass="text-danger" Display="Dynamic" ErrorMessage="<%$ Resources:LocalizedText, Profile_PersonalDetails_ChangeEmail_tbConfirmEmail_Label_Validator_ErrorMessage%>" />
                                    <asp:CompareValidator runat="server" ValidationGroup="ChangeEmail" ControlToCompare="txtChangeEmail" ControlToValidate="txtConfirmChangeEmail" CssClass="text-danger" Display="Dynamic" ErrorMessage="<%$ Resources:LocalizedText, Profile_PersonalDetails_ChangeEmail_tbConfirmEmail_Label_CompareValidator_ErrorMessage%>" />
                                </div>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                
                        <div class="mt-5 mb-5 profile__separator"></div>
                        <asp:button runat="server" ID="btnEmailSave" CausesValidation="true" ValidationGroup="ChangeEmail" OnClick="btnEmailSave_Click" CssClass="mb-5 profile__btn" Text="<%$ Resources:LocalizedText, Profile_PersonalDetails_ChangeEmail_btnEmailSave_Text%>" Tabindex="1" />

                        <h2 class="profile__sub-title"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, Profile_PersonalDetails_ChangePassword_Title%>"/></h2>
                        <div class="profile__label"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, Profile_PersonalDetails_ChangePassword_tbCurrentPassword_Label%>"/></div>
                        <asp:TextBox runat="server" id="tbChangePasswordCurrentPassword" TextMode="Password" AutoPostBack="false" CssClass="profile__input profile__input--password" placeholder="<%$ Resources:LocalizedText, Profile_PersonalDetails_ChangePassword_tbCurrentPassword_placeholder%>" Tabindex="2" />
                        <div class="profile__input--validator"><asp:RequiredFieldValidator runat="server" ValidationGroup="ChangePassword" ControlToValidate="tbChangePasswordCurrentPassword" CssClass="text-danger" Display="Dynamic" ErrorMessage="<%$ Resources:LocalizedText, Profile_PersonalDetails_ChangePassword_tbCurrentPassword_Validator_ErrorMessage%>" /></div>

                        <div class="row ml-0">
                            <div class="row ml-0">
                                <div class="profile__label"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, Profile_PersonalDetails_ChangePassword_tbNewPassword_Label%>"/></div>
                                <asp:TextBox runat="server" id="tbChangePasswordNewPassword" TextMode="Password" AutoPostBack="false" CssClass="profile__input profile__input--password" placeholder="<%$ Resources:LocalizedText, Profile_PersonalDetails_ChangePassword_tbCurrentPassword_placeholder%>" Tabindex="2" />
                            </div>
                            <div class="row ml-0">
                                <div class="profile__label"><asp:Literal runat="server" Text="<%$ Resources:LocalizedText, Profile_PersonalDetails_ChangePassword_tbConfirmPassword_Label%>"/></div>
                                <asp:TextBox runat="server" id="tbChangePasswordConfirmPassword" TextMode="Password" OnPaste="return false" AutoPostBack="false" CssClass="profile__input profile__input--password" placeholder="<%$ Resources:LocalizedText, Profile_PersonalDetails_ChangePassword_tbCurrentPassword_placeholder%>" Tabindex="2" />
                            </div>
                        </div>
                        <div class="profile__input--validator">
                            <asp:RequiredFieldValidator runat="server" ValidationGroup="ChangePassword" ControlToValidate="tbChangePasswordNewPassword" CssClass="text-danger" Display="Dynamic" ErrorMessage="<%$ Resources:LocalizedText, Profile_PersonalDetails_ChangePassword_tbNewPassword_Validator_ErrorMessage%>" />
                            <asp:RequiredFieldValidator runat="server" ValidationGroup="ChangePassword" ControlToValidate="tbChangePasswordConfirmPassword" CssClass="text-danger" Display="Dynamic" ErrorMessage="<%$ Resources:LocalizedText, Profile_PersonalDetails_ChangePassword_tbConfirmPassword_Validator_ErrorMessage%>" />
                            <asp:CompareValidator runat="server" ValidationGroup="ChangePassword" ControlToCompare="tbChangePasswordNewPassword" ControlToValidate="tbChangePasswordConfirmPassword" CssClass="text-danger" Display="Dynamic" ErrorMessage="<%$ Resources:LocalizedText, Profile_PersonalDetails_ChangePassword_tbConfirmPassword_CompareValidator_ErrorMessage%>" />
                        </div>
                
                        <div class="mt-5 mb-5 profile__separator"></div>
                        <asp:button runat="server" ID="btnPasswordSave" CausesValidation="true" ValidationGroup="ChangePassword" OnClick="btnPasswordSave_Click" CssClass="mb-5 profile__btn" Text="<%$ Resources:LocalizedText, Profile_PersonalDetails_ChangePassword_btnPasswordSave_Text%>" Tabindex="2" />
                    </div>

                    <div class="col-md-4 left-menu">
                        <div class="d-flex flex-column align-items-center text-left profile__menu sticky">
                            <a OnClick="javascript:$.blockUI()" href="/Profile/Profile" class="profile__menu__link profile__menu__link--selected">
                                <img class="mr-2" src="/img/profile-selected.png" srcset="/img/profile-selected@2x.png 2x, /img/profile-selected@3x.png 3x">
                                <asp:Literal runat="server" Text="<%$ Resources:LocalizedText, Profile_Menu_PersonalDetails%>"/>
                            </a>
                            <div class="mt-3 mb-3 profile__menu__separator"></div>
                            <a OnClick="javascript:$.blockUI()" href="/Profile/Billing" class="profile__menu__link">
                                <img class="mr-2" src="/img/billing.png" srcset="/img/billing@2x.png 2x, /img/billing@3x.png 3x">
                                <asp:Literal runat="server" Text="<%$ Resources:LocalizedText, Profile_Menu_BillingDetails%>"/>
                            </a>
                            <div class="mt-3 mb-3 profile__menu__separator"></div>
                            <a OnClick="javascript:$.blockUI()" href="/Profile/Invite" class="profile__menu__link">
                                <img class="mr-2" src="/img/invitefriends.png" srcset="/img/invitefriends@2x.png 2x, /img/invitefriends@3x.png 3x">
                                <asp:Literal runat="server" Text="<%$ Resources:LocalizedText, Profile_Menu_Invite%>"/>
                            </a>
                            <div class="mt-3 mb-3 profile__menu__separator"></div>
                            <asp:LinkButton runat="server" ID="btnLogout" OnClientClick="javascript:$.blockUI()" OnClick="btnLogout_Click" CssClass="profile__menu__link">
                                <img class='mr-2' src='/img/logout.png' srcset='/img/logout@2x.png 2x, /img/logout@3x.png 3x'>
                                <asp:Literal runat="server" Text="<%$ Resources:LocalizedText, Profile_Menu_Logout%>"/>
                            </asp:LinkButton>
                        </div>
                    </div>
                </div>
            </div>
        </div>  
    </div>
</asp:Content>