<%@ Control Language="C#" AutoEventWireup="false" EnableViewState="false" Inherits="R7.Epsilon.Skins.SkinObjects.PageInfo" %>
<%@ Register TagPrefix="dnn" TagName="TAGS" Src="~/Admin/Skins/Tags.ascx" %>
<% if (!Skin.Options.DisablePageTags || !Skin.Options.DisablePageAudit || !Skin.Options.DisablePermalinks) { %>
<div class="skin-page-info text-muted">
	<% if (!Skin.Options.DisablePageTags && ActiveTab.Terms != null && ActiveTab.Terms.Count > 0) { %>
		<div class="skin-tags">
			<dnn:TAGS runat="server" CssClass="test" ShowCategories="true" ShowTags="false" AllowTagging="false" Separator=" " />
		</div>
		<hr />
	<% } %>
	<ul class="list-inline">
		<% if (!Skin.Options.DisablePageAudit) { %>
			<li class="list-inline-item skin-page-info-item" title='<%: T.GetString ("PublishedDate_Tooltip.Text") %>'>
				<span class="fas fa-calendar-alt"></span> <%: T.GetString ("PublishedDate.Text") %> <%: PublishedOnDateString %>
			</li>
			<li class="list-inline-item skin-page-info-item" title='<%: T.GetString ("LastModifiedDate_Tooltip.Text") %>'>
				<span class="fas fa-calendar-alt"></span> <%: T.GetString ("LastModifiedDate.Text") %> <%: LastModifiedOnDateString %>
			</li>
			<li class="list-inline-item skin-page-info-item" title='<%: T.GetString ("LastModifiedByUser_Tooltip.Text") %>'>
				<span class="fas fa-user"></span> <%: LastContentModifiedByUserName %>
			</li>
		<% } %>
		<% if (!Skin.Options.DisablePermalinks) { %>
			<li class="list-inline-item">
				<button type="button" id="btnPermalinks" class="btn skin-btn-unstyled text-muted skin-btn-permalinks"
						title='<%: T.GetString ("Permalinks_Tooltip.Text") %>'
						data-toggle="modal" data-target="#skinPermalinksModal">
					<i class="fas fa-globe"></i> <%: T.GetString ("Permalinks.Text") %>
				</button>
			</li>
		<% } %>
	</ul>
</div>
<% } %>
