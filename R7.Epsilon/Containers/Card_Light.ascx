﻿<%@ Control Language="C#" AutoEventWireup="false" Inherits="R7.Zeta.Containers.EpsilonContainerBase" %>
<%@ Register TagPrefix="dnn" TagName="TITLE" Src="~/Admin/Containers/Title.ascx" %>
<div class="card card-body bg-light text-body cnt cnt-card">
	<h4 class="card-title"><dnn:TITLE ID="dnnTITLE" runat="server" CssClass="h4" /></h4>
	<div id="ContentPane" runat="server"></div>
</div>
