<%@ Page Title="MqttTest" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Sprint_x._Default" EnableSessionState="true"%>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <link rel="stylesheet" href="/BootstrapTemplate/css/now-ui-dashboard.css">

    <div class="jumbotron">
        <h1>Welkom op mijn MQTT test omgeving.</h1>
        <asp:Label ID="lblSubscribe" runat="server" Text="Succesfully subscribed!" Visible="false"></asp:Label>
        <br/>
        <asp:TextBox ID="tbMessageSend" placeholder="Publish message" runat="server" Height="28px" Width="238px"></asp:TextBox>
        <br /> 
        <asp:Button ID="btnSubscribe" runat="server" class="btn btn-light" Text="Subscribe" />
        <asp:Button ID="btnPublish" runat="server" class="btn btn-light" Text="Publish" />
        <br />
        <br /> <%--Ja ik weet het Breaks zijn niet goed, sorry :)--%>
        <br />
        <asp:TextBox ID="tbMessageReceived" runat="server" Height="75px" Width="237px" placeholder="Received message"></asp:TextBox>
    </div>


</asp:Content>
