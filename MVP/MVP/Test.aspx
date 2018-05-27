<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Test.aspx.cs" Inherits="MVP.Test" %>

<%@ Register src="Controls/DropdownMenuButton.ascx" tagname="DropdownMenuButton" tagprefix="uc1" %>
<%@ Register Src="~/Controls/DropdownMenuButton.ascx" TagPrefix="uc2" TagName="DropdownMenuButton" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Yoyoloop</title>

    <!-- Bootstrap core CSS -->
    <link href="../css/bootstrap.min.css" rel="stylesheet">
    <link href="../css/styles.min.css" rel="stylesheet">

    <!-- Custom fonts for this template -->
    <link href="../css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href='https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Merriweather:400,300,300italic,400italic,700,700italic,900,900italic' rel='stylesheet' type='text/css'>
  </head>
<body>
    <form id="form1" runat="server">
        <uc1:DropdownMenuButton ID="DropdownMenuButton1" runat="server" SelectedText="Boo" SelectionPrompt="Escolha" OnItemSelected="DropdownMenuButton1_ItemSelected" />
        <uc2:DropdownMenuButton ID="DropdownMenuButton2" runat="server" SelectedText="Ube" SelectionPrompt="Seleccione" OnItemSelected="DropdownMenuButton2_ItemSelected" />
    </form>

    <!-- Bootstrap core JavaScript -->
    <script src="../vendor/jquery/jquery.min.js"></script>
    <script src="../vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script>
      $(window).scroll(function(){
        $('nav').toggleClass('scrolled', $(this).scrollTop() > 50);
      });
    </script>
</body>
</html>
