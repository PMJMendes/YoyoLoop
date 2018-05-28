<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Test.aspx.cs" Inherits="MVP.Test" %>

<%@ Register src="Controls/DropdownMenuButton.ascx" tagname="DropdownMenuButton" tagprefix="uc1" %>
<%@ Register Src="Calendar/CalendarDay.ascx" TagPrefix="uc1" TagName="CalendarDay" %>
<%@ Register Src="~/Calendar/CalendarTable.ascx" TagPrefix="uc1" TagName="CalendarTable" %>



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
        <uc1:DropdownMenuButton ID="DropdownMenuButton2" runat="server" SelectedText="Ube" SelectionPrompt="Seleccione" OnItemSelected="DropdownMenuButton2_ItemSelected" />

    <section class="pt-5" id="book">
      <div class="container-fluid">
        <div class="row">
          <div class="col-lg-8 col-md-8 calendar-background">
            <div class="container-fluid calendar-container">

              <div class="hide p-3" id="selectPopover">
                <div class="row pt-2 pb-2">
                  <div class="col-6"><button type="button" class="btn btn-select">12:00</button></div>
                  <div class="col-6"><button type="button" class="btn btn-select">15:00</button></div>
                </div>
                <div class="row pt-2 pb-2">
                  <div class="col-6"><button type="button" class="btn btn-select btn-select--disabled">12:00</button></div>
                  <div class="col-6"><button type="button" class="btn btn-select">15:00</button></div>
                </div>
                <div class="row pt-2 pb-2">
                  <div class="col-6"><button type="button" class="btn btn-select">12:00</button></div>
                  <div class="col-6"><button type="button" class="btn btn-select">15:00</button></div>
                </div>
                <div class="row pt-2 pb-2">
                  <div class="col-6"><button type="button" class="btn btn-select">12:00</button></div>
                  <div class="col-6"><button type="button" class="btn btn-select">15:00</button></div>
                </div>
              </div>

              <div class="hide" id="destinationPopover">
                <div class="row pt-3 pr-4 pb-0 pl-4">
                  <div class="col-6 d-flex align-items-end text-uppercase text-nowrap header-label">Destino</div>
                  <div class="col-6 d-flex align-items-end justify-content-end text-uppercase text-nowrap header-city">Cascais</div>
                </div>
                <hr class="divider w-100">
                <div class="row pt-0 pr-4 pb-3 pl-4">
                  <div class="col-12 text-uppercase text-nowrap access-point">&rarr; Cascais shopping</div>
                </div>
                <div class="row pt-2 pr-4 pb-2 pl-4">
                  <div class="col-6"><button type="button" class="btn btn-select">12:00</button></div>
                  <div class="col-6"><button type="button" class="btn btn-select">15:00</button></div>
                </div>
                <div class="row pt-2 pr-4 pb-2 pl-4">
                  <div class="col-6"><button type="button" class="btn btn-select">12:00</button></div>
                  <div class="col-6"><button type="button" class="btn btn-select">15:00</button></div>
                </div>
                <hr class="divider w-75">

                <div class="row pt-0 pr-4 pb-0 pl-4">
                  <div class="col-12 text-uppercase text-nowrap access-point">&rarr; Hospital de Cascais</div>
                </div>
                <hr class="divider w-75">
                <div class="row pt-0 pr-4 pb-0 pl-4">
                  <div class="col-12 text-uppercase text-nowrap access-point">&rarr; Lagoas Parque</div>
                </div>
                <hr class="divider w-100">
                <div class="row pt-0 pr-4 pb-0 pl-4">
                  <div class="col-6 d-flex align-items-end text-uppercase text-nowrap header-label">Origem</div>
                  <div class="col-6 d-flex align-items-end justify-content-end text-uppercase text-nowrap header-city header-city--departure">Lisboa</div>
                </div>
                <hr class="divider w-100">

                <div class="row pt-0 pr-4 pb-0 pl-4">
                  <div class="col-12 text-uppercase text-nowrap access-point">&rarr; Gare do Oriente</div>
                </div>
                <hr class="divider w-75">
                <div class="row pt-0 pr-4 pb-0 pl-4">
                  <div class="col-12 text-uppercase text-nowrap access-point">&rarr; Marques de Pombal</div>
                </div>
              </div>

              <hr class="d-block d-sm-none">
              <header>
                <div class="row p-1 text-uppercase">
                  <h5 class="col p-1 m-0 text-center d-flex align-items-center justify-content-center">Seg</h5>
                  <h5 class="col p-1 m-0 text-center d-flex align-items-center justify-content-center">Ter</h5>
                  <h5 class="col p-1 m-0 text-center d-flex align-items-center justify-content-center">Qua</h5>
                  <h5 class="col p-1 m-0 text-center d-flex align-items-center justify-content-center">Qui</h5>
                  <h5 class="col p-1 m-0 text-center d-flex align-items-center justify-content-center">Sex</h5>
                  <h5 class="col p-1 m-0 text-center d-flex align-items-center justify-content-center">Sab</h5>
                  <h5 class="col p-1 m-0 text-center d-flex align-items-center justify-content-center">Dom</h5>
                </div>
              </header>
              <hr class="d-block d-sm-none">
              <div class="row border border-bottom-0">
                <uc1:CalendarTable runat="server" id="CalendarTable" />
              </div>
              <hr class="d-block d-sm-none">
            </div>
          </div>
        </div>
      </div>
    </section>
    </form>

    <!-- Bootstrap core JavaScript -->
    <script src="../vendor/jquery/jquery.min.js"></script>
    <script src="../vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script>
      $(window).scroll(function(){
        $('nav').toggleClass('scrolled', $(this).scrollTop() > 50);
      });
    </script>
    <script>
      $(function(){
        $('[rel="popover"]').popover({
            container: 'body',
            html: true,
            content: function () {
                var clone = $($(this).data('popover-content')).clone(true).removeClass('hide');
                return clone;
            }
          }).click(function(e) {
              e.preventDefault();
          });
      });
    </script>
</body>
</html>
