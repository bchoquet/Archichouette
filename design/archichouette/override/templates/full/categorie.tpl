{* Categorie - Full view *}
<article class="content-view-full class-categorie cat-{ezini('CategoriesJeu', $node.node_id, 'archichouette.ini')} clearfix">

	<div class="categorie-contents">
		{include uri="design:includes/breadcrumbs.tpl" node=$node}
		<h1 class="categorie rounded-trb">{$node.data_map.name.content|wash}</h1>
		<h2>{$node.data_map.sous_titre.content|wash()}</h2>
		{if $node.object.data_map.description.has_content}
			<div class="attribute-description">{attribute_view_gui attribute=$node.object.data_map.description}</div>
		{/if}
	</div>
	{if and($node.data_map.jeu_exemple.has_content, $node.data_map.jeu_exemple.content.data_map.visuels.content.relation_list|count())}
	<div class="categorie-exemple rounded-bl block-contents">
		<h3 class="rounded">Exemple</h3>
   		{def $visuelObj = fetch('content', 'object', hash('object_id', $node.data_map.jeu_exemple.content.data_map.visuels.content.relation_list.0.contentobject_id))}
		{content_view_gui content_object=$visuelObj view=embed object_parameters=hash('size', 'medium')}
		{undef $visuelObj}
	</div>
	{/if}

	{if $node.data_map.show_children}
		{def $jeux = fetch('content', 'list', hash(
			'parent_node_id', $node.node_id,
			'class_filter_type', 'include',
			'class_filter_array', array('jeu')
		))}
		{if $jeux}
		<ul class="listeJeux">
			{foreach $jeux as $jeu}
			<li>{node_view_gui content_node=$jeu view='line'}</li>
			{/foreach}
		</ul>
		{/if}
	{/if}
</article>