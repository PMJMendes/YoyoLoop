<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Message.ascx.cs" Inherits="MVP.Controls.Message" %>

<asp:UpdatePanel runat="server" ID="upMessage" UpdateMode="Conditional">
    <ContentTemplate>
        <div class="message modal fade" id="messageModal" tabindex="-1" role="dialog" aria-labelledby="messageModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-body">
                        <div class="message__message">
                            <div class="message__message-text text-center"><%= MessageText %></div>
                        </div>
                        <div class="text-center">
                            <button ID="btnOK" onclick="javascript:$('#messageModal').modal('hide')" class="message__button btn btn-primary">OK</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </ContentTemplate>
</asp:UpdatePanel>
