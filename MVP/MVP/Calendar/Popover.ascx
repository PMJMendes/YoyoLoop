<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Popover.ascx.cs" Inherits="MVP.Calendar.Popover" %>

<asp:UpdatePanel runat="server" ID="upPopover" UpdateMode="Conditional">
    <ContentTemplate>
        <div class="row pt-3 pr-4 pb-3 pl-4" />
        <asp:Repeater ID="APGroupRepeater" runat="server" OnItemDataBound="APGroupRepeater_ItemDataBound">
            <ItemTemplate>
                <asp:Panel runat="server" ID="pnAccordionHeader" CssClass="row pt-0 pr-4 pl-4 accordion">
                    <div class="col-6 d-flex align-items-end text-uppercase text-nowrap header-label header-label--destination mb-1">Destino</div>
                    <div class="col-12 text-nowrap access-point mb-2">
                        <asp:Label runat="server" ID="EndAP"/>
                    </div>
                    <div class="col-6 d-flex align-items-end text-uppercase text-nowrap header-label header-label--start mb-1">Origem</div>
                    <div class="col-12 text-nowrap access-point mb-2">
                        <asp:Label runat="server" ID="StartAP"/>
                    </div>
                </asp:Panel>                
                <asp:Panel runat="server" ID="pnAccordionPanel" CssClass="panel">
                    <hr class="divider w-75">
                    <asp:Repeater ID="RowRepeater" runat="server" OnItemDataBound="RowRepeater_ItemDatabound">
                        <ItemTemplate>
                            <div class="row pt-2 pr-4 pb-2 pl-4">
                                <asp:Repeater ID="TimeRepeater" runat="server" OnItemDataBound="TimeRepeater_ItemDataBound" OnItemCreated="TimeRepeater_ItemCreated" OnItemCommand="TimeRepeater_ItemCommand">
                                    <ItemTemplate>
                                            <div class="col-6"><asp:LinkButton runat="server" ID="BtnTime" CssClass="btn btn-select" /></div>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                    <br />
                </asp:Panel>
            </ItemTemplate>
            <SeparatorTemplate>
                <hr class="divider w-100">
            </SeparatorTemplate>
        </asp:Repeater>
    </ContentTemplate>
</asp:UpdatePanel>
