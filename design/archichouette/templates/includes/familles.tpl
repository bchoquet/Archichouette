<!-- Liste des familles -->
{def $cats = fetch('content', 'list', hash(
	'parent_node_id', ezini('Nodes', 'Etals', 'archichouette.ini'),
	'class_filter_type', 'include',
	'class_filter_array', array('categorie'),
	'sort_by', array('priority', true())
))}
{if $cats|count()}
<ul class="listeFamilles">
	{foreach $cats as $cat}
		<li class="cat-{ezini('CategoriesJeu', $cat.node_id, 'archichouette.ini')}">{node_view_gui content_node=$cat view='pastille'}</li>
	{/foreach}
</ul>
{/if}