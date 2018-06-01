<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="DropdownFixed.ascx.cs" Inherits="MVP.Controls.DropdownFixed" %>

<div class="dropdown">
    <button class="btn btn-secondary dropdown-toggle text-left destination" type="button" id="DropdownFixed" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
    <%= SelectedText %>
    </button>
    <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
        <div class="dropdown-item">
            <div class="pl-1 d-flex flex-row">
            </div>
        </div>
        <asp:Repeater ID="ItemRepeater" runat="server" OnItemCommand="ItemRepeater_ItemCommand">
            <ItemTemplate>
                <asp:LinkButton ID="Item" runat="server" class="dropdown-item" CommandArgument="<%# (string)(Container.DataItem) %>"><%# (string)(Container.DataItem) %></asp:LinkButton>
            </ItemTemplate>
        </asp:Repeater>
    </div>
</div>

