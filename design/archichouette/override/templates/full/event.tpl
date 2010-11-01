{set-block scope=root variable=cache_ttl}600{/set-block}
{* Event - Full view *}
<article class="content-view-full class-event clearfix">

	{if not(empty($node.object.data_map.visuels.content.relation_list))}
    <div class="attribute-visuels">
    	{foreach $node.object.data_map.visuels.content.relation_list as $visuel}
    		{def $visuelObj = fetch('content', 'object', hash('object_id', $visuel.contentobject_id))}
    		{content_view_gui content_object=$visuelObj view=embed object_parameters=hash('size', 'medium')}
			{*attribute_view_gui attribute=$node.object.data_map.visuels*}
			{undef}
		{/foreach}
    </div>
    {/if}


	<div class="event-contents">
    {if $node.data_map.title.has_content}
        <h1>{$node.data_map.title.content|wash()}</h1>
    {else}
        <h1>{$node.name|wash()}</h1>
    {/if}

    <p class="attribute-infos vert">
	    {if $node.object.data_map.category.has_content}
	    <span class="ezagenda_keyword">
	    {"Category"|i18n("design/ezwebin/full/event")}:
	    {attribute_view_gui attribute=$node.object.data_map.category}
	    </span>
	    {/if}

	    <span class="ezagenda_date">{$node.object.data_map.from_time.content.timestamp|datetime(custom,"%j %M %H:%i")}
	    {if $node.object.data_map.to_time.has_content}
	          - {$node.object.data_map.to_time.content.timestamp|datetime(custom,"%j %M %H:%i")}
	    {/if}
	    </span>

	    {if $node.object.data_map.lieu.has_content}
	    <br/>
	    <span class="ezagenda_lieu">{$node.object.data_map.lieu.content|wash()}</span>
	    {/if}
    </p>


    {if $node.object.data_map.text.has_content}
        <div class="attribute-text">{attribute_view_gui attribute=$node.object.data_map.text}</div>
    {/if}


    {* if $node.object.data_map.url.has_content}
        <p style="text-align:center;">
        <a href={$node.object.data_map.url.content|ezurl}>{$node.object.data_map.url.data_text|wash()}</a>
        </p>
    {/if *}

	</div>


	{if and( is_unset( $versionview_mode ), is_set( $node.data_map.enable_comments ), $node.data_map.enable_comments.data_int )}
		<section class="comments">
            <h1>{"Comments"|i18n("design/ezwebin/full/article")}</h1>
			<div class="content-view-children">
				{foreach fetch_alias( comments, hash( parent_node_id, $node.node_id ) ) as $comment}
					{node_view_gui view='line' content_node=$comment}
				{/foreach}
			</div>

			{if fetch( 'content', 'access', hash( 'access', 'create',
												  'contentobject', $node,
												  'contentclass_id', 'comment' ) )}
				<form method="post" action={"content/action"|ezurl}>
				<input type="hidden" name="ClassIdentifier" value="comment" />
				<input type="hidden" name="NodeID" value="{$node.object.main_node.node_id}" />
				<input type="hidden" name="ContentLanguageCode" value="{ezini( 'RegionalSettings', 'ContentObjectLocale', 'site.ini')}" />
				<input class="button new_comment rounded10" type="submit" name="NewButton" value="{'New comment'|i18n( 'design/ezwebin/full/article' )}" />
				</form>
			{else}
				{if ezmodule( 'user/register' )}
					<p>{'%login_link_startLog in%login_link_end or %create_link_startcreate a user account%create_link_end to comment.'|i18n( 'design/ezwebin/full/article', , hash( '%login_link_start', concat( '<a href="', '/user/login'|ezurl(no), '">' ), '%login_link_end', '</a>', '%create_link_start', concat( '<a href="', "/user/register"|ezurl(no), '">' ), '%create_link_end', '</a>' ) )}</p>
				{else}
					<p>{'%login_link_startLog in%login_link_end to comment.'|i18n( 'design/ezwebin/article/comments', , hash( '%login_link_start', concat( '<a href="', '/user/login'|ezurl(no), '">' ), '%login_link_end', '</a>' ) )}</p>
				{/if}
			{/if}
		</section>
	{/if}
</article>
