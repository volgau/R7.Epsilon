﻿<%@ Control Language="C#" AutoEventWireup="false" EnableViewState="false" Inherits="R7.Epsilon.Skins.SkinObjects.SecondaryMenu" %>
<%@ Register TagPrefix="dnn" TagName="MENU" Src="~/DesktopModules/DDRMenu/Menu.ascx" %>
<%@ Register TagPrefix="dnn" Namespace="DotNetNuke.Web.DDRMenu.TemplateEngine" Assembly="DotNetNuke.Web.DDRMenu" %>
<div id="<%: menuSecondary.ClientID %>" class="skin-main-nav skin-secondary-menu">
    <dnn:MENU id="menuSecondary" runat="server" MenuStyle="Mega2Epsilon" />
</div>
