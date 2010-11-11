{* Jeu - Block Item View *}
<article class="block-item-jeu">
<a href={$node.url_alias|ezurl()} class="clearfix">
{if $node.object.data_map.visuels.content.relation_list.0}
	<div class="visuel">
	{def $visuelObj = fetch('content', 'object', hash('object_id', $node.object.data_map.visuels.content.relation_list.0.contentobject_id))}
	{content_view_gui content_object=$visuelObj view=embed object_parameters=hash('size', 'block_item_home')}
	{undef $visuelObj}
	</div>
{/if}
	<div class="jeu-infos">
		<h1>{$node.name|wash()}</h1>
		<p class="intro">{attribute_view_gui attribute=$node.data_map.intro}</p>
		<p class="caract">
		{if $node.object.data_map.age.has_content}
			{attribute_view_gui attribute=$node.object.data_map.age}<br/>
		{/if}
		{if $node.object.data_map.nb_joueurs.has_content}
			{attribute_view_gui attribute=$node.object.data_map.nb_joueurs}<br/>
		{/if}
		{if $node.object.data_map.duree.has_content}
			{attribute_view_gui attribute=$node.object.data_map.duree}<br/>
		{/if}
		</p>
	</div>
</a>
</article>