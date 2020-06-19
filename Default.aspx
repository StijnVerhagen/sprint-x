<%@ Page Title="MqttTest" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Sprint_x._Default" EnableSessionState="true"%>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <link rel="stylesheet" href="/BootstrapTemplate/css/theme.css">

    <div class="jumbotron">
        <h1>Welkom op mijn MQTT test omgeving.</h1>
        <br />
        
        <asp:Label ID="lblPublish" runat="server" Text="Publiceer huidige tijd."></asp:Label>
        <br/>
        <asp:Button ID="btnPublish" runat="server" Text="Go!" class="mqtt-button" OnClick="btnPublish_Click" CausesValidation="false" UseSubmitBehavior="False" />

        <br />
        <br />
        
        <asp:UpdatePanel runat="server" ID="UpdatePanel" UpdateMode="Conditional">
            <ContentTemplate>
                <asp:Timer runat="server" ID="Timer" Interval="1000" OnTick="Timer_Tick"></asp:Timer>
                <asp:Label ID="lblReceived" runat="server" Text="Hier onder is het laatst ontvangen bericht te zien."></asp:Label>
                <br/>
                <asp:TextBox ID="tbMessageReceived" runat="server" Height="75px" Width="300px" Border="2px solid black" placeholder="Received message" AutoPostBack="True"></asp:TextBox>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>


</asp:Content>
