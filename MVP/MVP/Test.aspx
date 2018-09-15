<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Test.aspx.cs" Inherits="MVP.Test" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">

        <div id="socialLoginList">
            <h4>Use another service to log in.</h4>
            <hr />
            <asp:ListView runat="server" ID="providerDetails" ItemType="System.String"
                SelectMethod="GetProviderNames" ViewStateMode="Disabled">
                <ItemTemplate>
                    <p>
                        <button type="submit" class="btn btn-default" name="provider" value="<%#: Item %>"
                            title="Log in using your <%#: Item %> account.">
                            <%#: Item %>
                        </button>
                    </p>
                </ItemTemplate>
                <EmptyDataTemplate>
                    <div>
                        <p>There are no external authentication services configured. See <a href="https://go.microsoft.com/fwlink/?LinkId=252803">this article</a> for details on setting up this ASP.NET application to support logging in via external services.</p>
                    </div>
                </EmptyDataTemplate>
            </asp:ListView>
        </div>

    </form>
</body>
</html>
