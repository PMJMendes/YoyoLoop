<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="MVP._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron">
        <p class="lead">Where do you want to go?</p>
        <Table><tr>
            <td>
            <a href="/TripExplorer/Explore?Dest=Lisboa" class="btn btn-primary btn-lg">Lisboa &raquo;</a>
            </td>
            <td style="width:20px"></td>
            <td>
            <a href="/TripExplorer/Explore?Dest=Linha%20de%20Cascais" class="btn btn-primary btn-lg">Cascais &raquo;</a>
            </td>
            <td style="width:20px"></td>
            <td>
            <a href="/TripExplorer/Explore?Dest=Leiria" class="btn btn-primary btn-lg">Leiria &raquo;</a>
            </td>
            <td style="width:20px"></td>
            <td>
            <a href="/TripExplorer/Explore?Dest=Fátima" class="btn btn-primary btn-lg">Fátima &raquo;</a>
            </td>
        </tr></Table>
    </div>

    
</asp:Content>
