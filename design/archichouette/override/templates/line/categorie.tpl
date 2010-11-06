{* Categorie - Line View *}
<a href={$node.url_alias|ezurl()} class="pastille rounded">
	<p class="title rounded-trb">{$node.name|wash()}</p>
	{if and($node.data_map.jeu_exemple.has_content, $node.data_map.jeu_exemple.content.data_map.visuels.content.relation_list|count())}
		{def $visuelObj = fetch('content', 'object', hash('object_id', $node.data_map.jeu_exemple.content.data_map.visuels.content.relation_list.0.contentobject_id))}
		{content_view_gui content_object=$visuelObj view=embed object_parameters=hash('size', 'small')}
		{undef $visuelObj}
	{/if}
</a>