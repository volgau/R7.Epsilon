﻿<%@ Control Language="C#" AutoEventWireup="true" Inherits="R7.Zeta.Skins.EpsilonSkinBase" %>
<%@ Register TagPrefix="skin" TagName="START" Src="~/Portals/_default/Skins/R7.Zeta/Blocks/Start.ascx" %>
<%@ Register TagPrefix="skin" TagName="POPUPEND" Src="~/Portals/_default/Skins/R7.Zeta/Blocks/PopupEnd.ascx" %>
<%
Options.DisableSocialShare = true;
Options.DisableLazyAds = true;
Options.DisableRangy = true;
%>
<skin:START runat="server" />
<div class="skin skin-popup">
	<div id="ContentPane" runat="server" />
</div>
<skin:POPUPEND runat="server" />
