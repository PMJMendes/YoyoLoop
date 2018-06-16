<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Popover.ascx.cs" Inherits="MVP.Calendar.Popover" %>

<asp:HiddenField ID="PopupAnchor" runat="server" />

<asp:Panel ID="Popup" runat="server" style="display:none">
    <div id="destinationPopover">
        <asp:Repeater ID="APGroupRepeater" runat="server" OnItemDataBound="APGroupRepeater_ItemDataBound">
            <ItemTemplate>
                <div class="row pt-0 pr-4 pb-3 pl-4 accordion">
                    <div class="col-12 text-uppercase text-nowrap access-point"><asp:Label runat="server" ID="APGroup"/></div>
                </div>
                <div class="panel">
                    <asp:Repeater ID="RowRepeater" runat="server" OnItemDataBound="RowRepeater_ItemDatabound">
                        <ItemTemplate>
                            <div class="row pt-2 pr-4 pb-2 pl-4">
                                <asp:Repeater ID="TimeRepeater" runat="server" OnItemDataBound="TimeRepeater_ItemDataBound">
                                    <ItemTemplate>
                                            <div class="col-6"><asp:LinkButton runat="server" ID="BtnTime" class="btn btn-select" /></div>
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
    </div>
</asp:Panel>

<ajaxToolkit:ModalPopupExtender ID="PopupControl" runat="server" TargetControlID="PopupAnchor" PopupControlID="Popup" RepositionMode="None"></ajaxToolkit:ModalPopupExtender>

<script>
    $(function(){
        var acc = document.getElementsByClassName("accordion");
        var i;
      
        for (i = 0; i < acc.length; i++) {
        $(acc[i]).click(function() {
            this.classList.toggle("active");
            var panel = this.nextElementSibling;

            if (panel.style.display === "block") {
            panel.style.display = "none";
            } else {
            panel.style.display = "block";
            }
        });
        }
    });

    var handle = null;
    var refRect = null;
    function positionPopover(refElement) {
        refRect = refElement.getBoundingClientRect();
        handle = setTimeout("_doPosition();", 1);
    }
    function _doPosition() {
        var panel = document.getElementById('<%= Popup.ClientID%>');
        var panelRect = panel.getBoundingClientRect();
        panel.style.left = refRect.right + "px";
        panel.style.top = ((refRect.top + refRect.bottom + panelRect.top - panelRect.bottom) / 2) + "px";
        clearTimeout(handle);
    }
</script>
