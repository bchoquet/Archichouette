{* Jeu - Full view *}
{def $cat = fetch('content', 'node', hash('node_id', $node.parent_node_id))}
<article class="content-view-full class-jeu cat-{ezini('CategoriesJeu', $cat.node_id, 'archichouette.ini')}">
	{include uri="design:includes/breadcrumbs.tpl" node=$node}

	{if $node.object.data_map.visuels.content.relation_list|count()}
    <div class="attribute-visuels slideshow">
    	<div class="slideshow-contents">
    	{foreach $node.object.data_map.visuels.content.relation_list as $visuel}
    		{def $visuelObj = fetch('content', 'object', hash('object_id', $visuel.contentobject_id))}
    		{content_view_gui content_object=$visuelObj view=embed object_parameters=hash('size', 'medium')}
			{undef $visuelObj}
		{/foreach}
		</div>
    </div>
    {/if}

 	<div class="jeu-contents">
 		<div class="categorie rounded-trb">{$cat.name|wash}</div>

    {if $node.data_map.title.has_content}
        <h1>{$node.data_map.title.content|wash()}</h1>
    {else}
        <h1>{$node.name|wash()}</h1>
    {/if}

	{if $node.object.data_map.description.has_content}
		<div class="attribute-description">{attribute_view_gui attribute=$node.object.data_map.description}</div>
	{/if}


	<div class="caracteristiques rounded">
		{if $node.object.data_map.age.has_content}
		<p class="caract">
			<span class="titre">{$node.object.data_map.age.contentclass_attribute_name|wash()} :</span>
			{attribute_view_gui attribute=$node.object.data_map.age}
		</p>
		{/if}
		{if $node.object.data_map.nb_joueurs.has_content}
		<p class="caract">
			<span class="titre">{$node.object.data_map.nb_joueurs.contentclass_attribute_name|wash()} :</span>
			{attribute_view_gui attribute=$node.object.data_map.nb_joueurs}
		</p>
		{/if}
		{if $node.object.data_map.duree.has_content}
		<p class="caract">
			<span class="titre">{$node.object.data_map.duree.contentclass_attribute_name|wash()} :</span>
			{attribute_view_gui attribute=$node.object.data_map.duree}
		</p>
		{/if}
		{if $node.object.data_map.auteur.has_content}
		<p class="caract">
			<span class="titre">{$node.object.data_map.auteur.contentclass_attribute_name|wash()} :</span>
			{attribute_view_gui attribute=$node.object.data_map.auteur}
		</p>
		{/if}
		{if $node.object.data_map.editeur.has_content}
		<p class="caract">
			<span class="titre">{$node.object.data_map.editeur.contentclass_attribute_name|wash()} :</span>
			{attribute_view_gui attribute=$node.object.data_map.editeur}
		</p>
		{/if}
	</div>
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
{undef}