<%@ Page Title="MqttTest" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Sprint_x._Default" EnableSessionState="true"%>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <link rel="stylesheet" href="/Bootstrap Template/assets/css/now-ui-dashboard.css">

    <div class="jumbotron">
        <h1>Hi there</h1>
        <p class="lead">Welkom op mijn MQTT test omgeving.</p>
        <asp:Label ID="lblSubscribe" runat="server" Text="Succesfully subscribed!" Visible="false"></asp:Label>
        <br/>
        <asp:TextBox ID="tbMessageSend" placeholder="Publish message" runat="server"></asp:TextBox>
        <asp:Button ID="btnPublish" runat="server" Text="Publish" OnClick="btnPublish_Click" />
        <br />
        <br />
        <asp:UpdatePanel runat="server" ID="UpdatePanel" UpdateMode="Conditional">
            <ContentTemplate>
                <asp:Timer runat="server" ID="Timer" Interval="1000" OnTick="Timer_Tick"></asp:Timer>
                
                <asp:TextBox ID="tbMessageReceived" runat="server" Height="75px" Width="300px" placeholder="Received message" AutoPostBack="True"></asp:TextBox>
                <asp:Button ID="btnGetMessage" runat="server" Text="Get last message" OnClick="btnLastMessage_Click" />

            </ContentTemplate>
        </asp:UpdatePanel>
    </div>

</asp:Content>
