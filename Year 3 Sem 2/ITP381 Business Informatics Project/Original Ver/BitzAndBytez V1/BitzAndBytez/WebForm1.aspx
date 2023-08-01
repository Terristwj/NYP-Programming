<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="BitzAndBytez.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="https://cdn.jsdelivr.net/npm/@widgetbot/crate@3" async defer>
      new Crate({
        server: '668469579474927626',
        channel: '668469579474927629',
        shard: 'https://disweb.dashflo.net'
      })
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <iframe src="https://disweb.dashflo.net/channels/668469579474927626/668469579474927629" height="600" width="800"></iframe>

    <widgetbot
      server="668469579474927626"
      channel="668469579474927629"
      width="800"
      height="600"
      shard="https://disweb.dashflo.net"
    ></widgetbot>
    <script src="https://cdn.jsdelivr.net/npm/@widgetbot/html-embed"></script>

</asp:Content>
