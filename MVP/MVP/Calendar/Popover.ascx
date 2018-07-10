<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Popover.ascx.cs" Inherits="MVP.Calendar.Popover" %>

<asp:ScriptManagerProxy runat="server">
    <Scripts>
        <asp:ScriptReference Path="./Scripts/init-popover.js" /> 
    </Scripts>
</asp:ScriptManagerProxy>

<div class="row pt-3 pr-4 pb-3 pl-4" />
<asp:Repeater ID="APGroupRepeater" runat="server" OnItemDataBound="APGroupRepeater_ItemDataBound">
    <ItemTemplate>
        <div class="row pt-0 pr-4 pb-3 pl-4 accordion">
            <div class="col-6 d-flex align-items-end text-uppercase text-nowrap header-label">Origem</div>
                <div class="col-12 text-uppercase text-nowrap access-point">
                    <asp:Label runat="server" ID="StartAP"/>
                </div>
            <div class="col-6 d-flex align-items-end text-uppercase text-nowrap header-label">Destino</div>
                <div class="col-12 text-uppercase text-nowrap access-point">
                    <asp:Label runat="server" ID="EndAP"/>
                </div>
        </div>
        <div class="panel">
            <asp:Repeater ID="RowRepeater" runat="server" OnItemDataBound="RowRepeater_ItemDatabound">
                <ItemTemplate>
                    <div class="row pt-2 pr-4 pb-2 pl-4">
                        <asp:Repeater ID="TimeRepeater" runat="server" OnItemDataBound="TimeRepeater_ItemDataBound" OnItemCommand="TimeRepeater_ItemCommand">
                            <ItemTemplate>
                                    <div class="col-6"><asp:LinkButton runat="server" ID="BtnTime" OnClientClick="javascript:$.blockUI({ message: $('#divBlockUI'), baseZ: 20000 })" CssClass="btn btn-select" /></div>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
            <br />
        </div>
    </ItemTemplate>
    <SeparatorTemplate>
        <hr class="divider w-75">
    </SeparatorTemplate>
</asp:Repeater>
