﻿<%@ Control Language="C#" AutoEventWireup="false" EnableViewState="false" Inherits="R7.Zeta.Skins.SkinObjects.JsVariables" %>

<script type="text/javascript">
var epsilon = {
    tabId:<%= PortalSettings.ActiveTab.TabID %>,
    tabName:'<%= PortalSettings.ActiveTab.TabName %>',
    portalId:<%= PortalSettings.Current.PortalId %>,
	portalAlias:'<%= PortalSettings.Current.PortalAlias.HTTPAlias %>',
    localization:{<%= LocalizationResources %>},
    queryParams:{<%= QueryParams %>},
	enablePopups:<%= PortalSettings.EnablePopUps.ToString ().ToLowerInvariant() %>,
	inPopup:<%= DotNetNuke.Common.Utilities.UrlUtils.InPopUp ().ToString ().ToLowerInvariant () %>,
	cookiePrefix: '<%= R7.Zeta.Components.Const.COOKIE_PREFIX %>',
	isEditMode:<%= (PortalSettings.UserMode == PortalSettings.Mode.Edit).ToString().ToLowerInvariant () %>
};
</script>
