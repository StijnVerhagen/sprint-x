<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Sprint_x._Default" EnableSessionState="true"%>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <system.web>
        <pages enableSessionState="true" /> 
    </system.web>

    <div class="jumbotron">
        <h1>Hi there</h1>
        <p class="lead">Welkom op mijn MQTT test omgeving.</p>
        <asp:Label ID="lblSubscribe" runat="server" Text="Succesfully subscribed!" Visible="false"></asp:Label>
        <br/>
        <asp:TextBox ID="tbMessageSend" runat="server"></asp:TextBox>
        <asp:Button ID="btnSubscribe" runat="server" Text="Subscribe" OnClick="btnSubscribe_Click" />
        <asp:Button ID="btnPublish" runat="server" Text="Publish" OnClick="btnPublish_Click" />
        <br />
        <br />
        <asp:TextBox ID="tbMessageReceived" runat="server" Height="75px" Width="160px"></asp:TextBox>
    </div>


</asp:Content>
