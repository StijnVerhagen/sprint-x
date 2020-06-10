<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Sprint_x._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron">
        <h1>Hi there</h1>
        <p class="lead">Welkom op mijn MQTT test omgeving.</p>
        <asp:Label ID="lblSubscribe" runat="server" Text="Succesfully subscribed!" Visible="false"></asp:Label>
        <br/>
        <asp:TextBox ID="tbValue" runat="server"></asp:TextBox>
    </div>


</asp:Content>
