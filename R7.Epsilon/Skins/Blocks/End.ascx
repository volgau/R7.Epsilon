﻿<%@ Control Language="C#" AutoEventWireup="false" EnableViewState="false" Inherits="R7.Epsilon.Skins.SkinObjects.EpsilonSkinObjectBase" %>
<%@ Register TagPrefix="skin" TagName="SEARCHMODAL" Src="~/Portals/_default/Skins/R7.Epsilon/SkinObjects/SearchModal.ascx" %>
<%@ Register TagPrefix="skin" TagName="PERMALINKSMODAL" Src="~/Portals/_default/Skins/R7.Epsilon/SkinObjects/PermalinksModal.ascx" %>
<%@ Register TagPrefix="skin" TagName="SHAREDSCRIPTS" Src="~/Portals/_default/Skins/R7.Epsilon/SkinObjects/SharedScripts.ascx" %>
<%@ Register TagPrefix="skin" TagName="BLUEIMPGALLERY" Src="~/Portals/_default/Skins/R7.Epsilon/SkinObjects/BlueimpGallery.ascx" %>
<%@ Register TagPrefix="skin" TagName="FLOATBUTTONS" Src="~/Portals/_default/Skins/R7.Epsilon/SkinObjects/FloatButtons.ascx" %>
<%@ Register TagPrefix="skin" TagName="TOASTS" Src="~/Portals/_default/Skins/R7.Epsilon/SkinObjects/Toasts.ascx" %>
<skin:FLOATBUTTONS runat="server" />
<skin:TOASTS runat="server" />
<skin:SEARCHMODAL runat="server" />
<skin:PERMALINKSMODAL runat="server" />
<skin:BLUEIMPGALLERY runat="server" />
<skin:SHAREDSCRIPTS runat="server" />
<%= T.GetString ("CustomMarkup_End.Text") %>
