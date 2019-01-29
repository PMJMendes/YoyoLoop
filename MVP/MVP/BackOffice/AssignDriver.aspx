<%@ Page Title="ADMIN CP" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AssignDriver.aspx.cs" Inherits="MVP.BackOffice.AssignDriver" %>

<asp:Content ID="HeadContent" ContentPlaceHolderID="HeadContent" runat="server">
    <meta name="robots" content="noindex, nofollow">

    <style type="text/css">
        th, td {
            border: 1px solid black;
            border-collapse: collapse;
            padding: 5px 15px 5px 15px;
        }
        td {
            padding: 10px 15px 10px 15px;
        }
        th {
            text-align: center;
            min-width: 200px;
        }
     </style>

</asp:Content>

<asp:Content ID="MainContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="profile">
        <div class="profile__container profile__container--first">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-10">
                        <h1 class="profile__main-title"><asp:Literal runat="server" Text="YOYOLOOP ADMIN CP"/></h1>

                        <h2 class="profile__sub-title"><asp:Literal runat="server" Text="Driver Assignment"/></h2>

                        <asp:UpdatePanel runat="server" ID="upDrivers" UpdateMode="Always">
                            <ContentTemplate>
                                <div style="min-height:300px">
                                    <asp:Repeater runat="server" ID="RepTrips" OnItemDataBound="RepTrips_ItemDataBound" OnItemCreated="RepTrips_ItemCreated">
                                        <HeaderTemplate>
                                            <table style="width:90%">
                                                <tr>
                                                    <th style="min-width:0px;border:0px"></th>
                                                    <th>Time</th>
                                                    <th>Start</th>
                                                    <th>End</th>
                                                    <th>Driver</th>
                                                </tr>
                                        </HeaderTemplate>

                                        <ItemTemplate>
                                            <tr>
                                                <td>
                                                    <asp:ImageButton runat="server" ID="btnShowBookings" OnClick="btnShowBookings_Click" ImageUrl="~/img/arr-down@2x.png" Style="transform:rotate(-90deg)" tabindex="-1"/>
                                                    <asp:ImageButton runat="server" ID="btnHideBookings" OnClick="btnHideBookings_Click" ImageUrl="~/img/arr-down@2x.png" tabindex="-1"/>
                                                </td>
                                                <td>
                                                    <asp:Label runat="server" ID="lbTripID" Visible="false" />
                                                    <asp:Label runat="server" ID="lbTime" />
                                                </td>
                                                <td><asp:Label runat="server" ID="lbStart" /></td>
                                                <td><asp:Label runat="server" ID="lbEnd" /></td>
                                                <td><asp:DropDownList runat="server" ID="ddlDriver" AutoPostBack="true" DataTextField="Text" DataValueField="Value" OnSelectedIndexChanged="ddlDriver_SelectedIndexChanged" Style="padding: 5px 10px 5px 10px;width:100%"/></td>
                                            </tr>
                                            <asp:PlaceHolder runat="server" ID="phBookings">
                                                <tr style="padding:5px 0 5px 0">
                                                    <td colspan="5" style="text-align:left;padding:10px 10px 10px 50px">
                                                        <asp:Repeater runat="server" ID="RepBookings" OnItemDataBound="RepBookings_ItemDataBound">
                                                            <HeaderTemplate>
                                                                <table style="display:inline-block">
                                                                    <tr>
                                                                        <th style="padding:5px 5px 5px 20px;border:0px;border-bottom:1px solid black;text-align:left;min-width:300px">User</th>
                                                                        <th style="padding:5px 5px 5px 5px;border:0px;border-bottom:1px solid black;min-width:50px">Seats</th>
                                                                        <th style="padding:5px 5px 5px 5px;border:0px;border-bottom:1px solid black;min-width:50px">Cost</th>
                                                                    </tr>
                                                            </HeaderTemplate>
                                                            <ItemTemplate>
                                                                <tr>
                                                                    <td style="padding:5px 5px 5px 20px;border:0px;text-align:left"><asp:Label runat="server" ID="lbUser" /></td>
                                                                    <td style="padding:5px 5px 5px 5px;border:0px;text-align:center"><asp:Label runat="server" ID="lbSeats" /></td>
                                                                    <td style="padding:5px 5px 5px 5px;border:0px;text-align:center"><asp:Label runat="server" ID="lbCost" /></td>
                                                                </tr>
                                                            </ItemTemplate>
                                                            <FooterTemplate>
                                                                </table>
                                                            </FooterTemplate>
                                                        </asp:Repeater>
                                                    </td>
                                                </tr>
                                            </asp:PlaceHolder>
                                        </ItemTemplate>

                                        <FooterTemplate>
                                            </table>
                                        </FooterTemplate>
                                    </asp:Repeater>
                                    <asp:button runat="server" ID="btnSave" OnClick="btnSave_Click" CssClass="mt-4 mb-5 profile__btn" Text="SAVE" />
                                </div>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>

                    <div class="col-md-2 left-menu">
                        <div class="d-flex flex-column align-items-center text-left profile__menu sticky">
                            <a OnClick="javascript:$.blockUI()" href="/BackOffice/Office" class="profile__menu__link">
                                <asp:Literal runat="server" Text="Admin CP"/>
                            </a>
                            <div class="mt-3 mb-3 profile__menu__separator"></div>
                            <a OnClick="return false" href="/BackOffice/Routes" class="profile__menu__link">
                                <asp:Literal runat="server" Text="Routes"/>
                            </a>
                            <div class="mt-3 mb-3 profile__menu__separator"></div>
                            <a OnClick="return false" href="/BackOffice/AccessPoints" class="profile__menu__link">
                                <asp:Literal runat="server" Text="Access Points"/>
                            </a>
                            <div class="mt-3 mb-3 profile__menu__separator"></div>
                            <a OnClick="javascript:$.blockUI()" href="/BackOffice/AssignDriver" class="profile__menu__link profile__menu__link--selected">
                                <asp:Literal runat="server" Text="Assign Drivers"/>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>  
    </div>
</asp:Content>
