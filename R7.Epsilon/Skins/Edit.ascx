﻿<%@ Control Language="C#" AutoEventWireup="true" Inherits="R7.Epsilon.Skins.EpsilonSkinBase" %>
<%@ Register TagPrefix="skin" TagName="START" Src="~/Portals/_default/Skins/R7.Epsilon/Blocks/Start.ascx" %>
<%@ Register TagPrefix="skin" TagName="HEADER" Src="~/Portals/_default/Skins/R7.Epsilon/Blocks/Header.ascx" %>
<%@ Register TagPrefix="skin" TagName="SECONDARYHEADER" Src="~/Portals/_default/Skins/R7.Epsilon/Blocks/SecondaryHeader.ascx" %>
<%@ Register TagPrefix="skin" TagName="SUBHEADER" Src="~/Portals/_default/Skins/R7.Epsilon/Blocks/SubHeader.ascx" %>
<%@ Register TagPrefix="skin" TagName="SUPFOOTER" Src="~/Portals/_default/Skins/R7.Epsilon/Blocks/SupFooter.ascx" %>
<%@ Register TagPrefix="skin" TagName="FOOTER" Src="~/Portals/_default/Skins/R7.Epsilon/Blocks/Footer.ascx" %>
<%@ Register TagPrefix="skin" TagName="END" Src="~/Portals/_default/Skins/R7.Epsilon/Blocks/End.ascx" %>
<%
Options.DisableSocialShare = true;
Options.DisablePageTags = true;
Options.DisablePageAudit = true;
%>
<skin:START runat="server" />
<div class="skin skin-edit">
	<header class="skin-header">
		<skin:HEADER runat="server" />
		<!--#include file="~/Portals/_default/Skins/R7.Epsilon/Layouts/_header.ascx"-->
		<skin:SECONDARYHEADER runat="server" />
	</header>
	<skin:SUBHEADER runat="server" />
	<!--#include file="~/Portals/_default/Skins/R7.Epsilon/Layouts/_main-only.ascx"-->
	<skin:SUPFOOTER runat="server" />
	<footer class="footer skin-footer">
		<skin:FOOTER runat="server" />
	</footer>
	<skin:END runat="server" />
</div>
