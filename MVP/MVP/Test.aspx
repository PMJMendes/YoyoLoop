<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Test.aspx.cs" Inherits="MVP.Test" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <!-- Bootstrap core JavaScript -->
    <script src="/vendor/jquery/jquery.min.js"></script>
    <script src="/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="/Scripts/jquery.blockUI.js"></script>
    <script src="/Scripts/Custom/blockUI-extension.js"></script>


    <form id="form1" runat="server">
        <asp:ScriptManager runat="server" EnablePartialRendering="true">
        </asp:ScriptManager>

        <!-- BLOCKUI DIV -->
        <div id="divBlockUI" style="display:none;"> 
            <h1>We are processing your request.  Please be patient.</h1> 
        </div> 

        <asp:UpdatePanel runat="server" ID="panel">
            <ContentTemplate>
                <div>
                    <asp:button runat="server" id="btnTest" OnClick="btnTest_Click" text="Test" />
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </form>

</body>
</html>
