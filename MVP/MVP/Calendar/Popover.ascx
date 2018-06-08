<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Popover.ascx.cs" Inherits="MVP.Calendar.Popover" %>
<%@ Register Src="~/Calendar/PopoverAPGroup.ascx" TagPrefix="yoyo" TagName="PopoverAPGroup" %>

<div class="row pt-3 pr-4 pb-3 pl-4" />
<asp:Repeater ID="APGroupRepeater" runat="server" OnItemDataBound="APGroupRepeater_ItemDataBound">
    <ItemTemplate>
        <yoyo:PopoverAPGroup runat="server" ID="PopoverAPGroup" />
        <hr class="divider w-75">
    </ItemTemplate>
</asp:Repeater>
