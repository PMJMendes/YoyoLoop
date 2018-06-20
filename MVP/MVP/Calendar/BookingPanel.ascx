<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="BookingPanel.ascx.cs" Inherits="MVP.Calendar.BookingPanel" %>

<div class="row next-trip">
<div class="col-lg-12 p-0">
<div class="row time pt-3">
<div class="col-1 pl-4">
<img src="../img/calendar-grey.png"
srcset="../img/calendar-grey@2x.png 2x,
../img/calendar-grey@3x.png 3x"
class="calendar-grey">
</div>
<div class="col-8">15 de Março, Quarta</div>
<div class="col-2 text-right text-uppercase direction">Ida</div>
</div>
<hr class="divider">
<div class="row time">
<div class="col-8">

<!-- LUGARES -->
<div class="row p-1">
<div class="col-1 pl-4">
<img src="../img/users.png"
srcset="../img/users@2x.png 2x,
../img/users@3x.png 3x"
class="users">
</div>
<div class="col-8"><strong>2 Lugares</strong></div>
</div>

<!--HORA-->
<div class="row p-1">
<div class="col-1 pl-4">
<img src="../img/clock.png"
srcset="../img/clock@2x.png 2x,
../img/clock@3x.png 3x"
class="clock">
</div>
<div class="col-8"><strong>19:30</strong></div>
</div>

<!--PREÇO-->
<div class="row p-1 price">
<div class="col-1 pl-4">
<img src="../img/cart.png"
srcset="../img/cart@2x.png 2x,
../img/cart@3x.png 3x"
class="clock">
</div>
<div class="col-8"><strong>20,00€</strong></div>
</div>
</div>
</div>

<hr class="divider">

<div class="row trip">
<div class="col-8">
<div class="row p-1 text-uppercase start-end">
<div class="col-12 pl-4">Origem</div>
</div>

<div class="row p-1 text-uppercase city-name">
<div class="col-12 pl-4">Lisboa</div>
</div>

<div class="row p-1 pt-0 access-point">
<div class="col-12 pl-4">Marques de Pombal</div>
</div>
</div>
</div>

<div class="row pt-3 trip">
<div class="col-8">
<div class="row p-1 text-uppercase start-end">
<div class="col-12 pl-4">Destino</div>
</div>

<div class="row p-1 text-uppercase city-name">
<div class="col-12 pl-4">Cascais</div>
</div>

<div class="row p-1 pt-0 access-point">
<div class="col-12 pl-4">Cascais shopping</div>
</div>
</div>
</div>

<hr class="divider w-100">

<div class="row pricing">
<div class="col-4 pl-4 text-uppercase total">Total</div>
<div class="col-8 pr-4 text-right">
<div class="row">
<div class="col-12">2 Lugares <span class="times">x</span> <span class="price">25,00€</span></div>
</div>
<div class="row">
<div class="col-12 total-price">50,00€</div>
</div>
</div>
</div>

<hr class="divider">

<div class="row pricing">
<div class="col-12">
<div class="row">
<div class="col-12 text-center promocode">Tenho um código promocional</div>
</div>

<div class="row p-4">
<div class="col-12 text-center">
<button class="btn btn-light btn-xl text-uppercase" >Reservar</button>
</div>
</div>
</div>
</div>

<hr class="divider">

<div class="row pricing">
<div class="col-12">
<div class="row">
<div class="col-12 text-center promocode promocode--active">Nao tenho código promocional</div>
</div>

<div class="row p-3">
<div class="col-12 text-center promocode promocode--active">
<div class="input-group mb-3">
<input type="text" class="form-control" placeholder="Inserir codigo promocional" aria-label="Inserir codigo promocional" aria-describedby="basic-addon2">
<div class="input-group-append">
<span class="input-group-text" id="basic-addon2">
<img src="../img/check.png"
srcset="../img/check@2x.png 2x,
../img/check@3x.png 3x"
class="check">
</span>
</div>
</div>
</div>
</div>

<div class="row pb-3">
<div class="col-12 text-center">
<button class="btn btn-light btn-xl text-uppercase" >Reservar</button>
</div>
</div>
</div>
</div>
</div>
</div>