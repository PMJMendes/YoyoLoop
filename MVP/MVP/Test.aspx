<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Test.aspx.cs" Inherits="MVP.Test" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Panel runat="server" Height="500px">
    </asp:Panel>
    <asp:Button runat="server" ID="btn" OnClick="btn_Click" Text="Mail" />
    <asp:Panel runat="server" Height="200px">
    </asp:Panel>

</asp:Content>
