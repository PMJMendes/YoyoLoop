<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="DropdownMenuButton.ascx.cs" Inherits="MVP.Controls.DropdownMenuButton" %>
<div class="dropdown">
    <button class="btn btn-secondary dropdown-toggle text-left destination" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
    <%= SelectedText %>
    </button>
    <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
        <div class="dropdown-item">
            <div class="pl-1 d-flex flex-row">
            <div class="p-0"><img src="../img/pin@2x.png" alt="" class="img-responsive"/></div>
            <div class="col-lg-8 col-md-8"><%= SelectionPrompt %></div>
            </div>
        </div>
        <div class="dropdown-divider"></div>
        <asp:Repeater ID="ItemRepeater" runat="server" OnItemCommand="ItemRepeater_ItemCommand">
            <ItemTemplate>
                <asp:LinkButton ID="Item" runat="server" class="dropdown-item" CommandArgument="<%# ((ListItem)Container.DataItem).Value %>" CommandName="<%# ((ListItem)Container.DataItem).Text %>">&rarr; <%# ((ListItem)Container.DataItem).Text %></asp:LinkButton>
            </ItemTemplate>
        </asp:Repeater>
    </div>
</div>
