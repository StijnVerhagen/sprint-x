<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Sprint_x._Default" EnableSessionState="true"%>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <system.web>
        <pages enableSessionState="true" /> 
    </system.web>

    <div class="jumbotron">
        <h1>Hi there</h1>
        <p class="lead">Welkom op mijn MQTT test omgeving.</p>
        <asp:Label ID="lblSubscribe" runat="server" Text="Succesfully subscribed!" Visible="false"></asp:Label>
        <asp:Label ID="lblValue" runat="server" Text="Value" Visible="false"></asp:Label>
        <br/>
        <asp:Button ID="btnLoad" runat="server" Text="Load" OnClick="btnLoad_Click" />
        <asp:Button ID="btnDisplay" runat="server" Text="Display" OnClick="btnDisplay_Click" />
    </div>


</asp:Content>
