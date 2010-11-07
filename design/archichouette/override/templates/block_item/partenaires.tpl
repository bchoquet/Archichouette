{* Partenaires - Full View *}
<ul class="listePartenaires">
{def $parts = fetch('content', 'list', hash(
	'parent_node_id', $node.node_id,
	'class_filter_type', 'include',
	'class_filter_array', array('partenaire'),
	'sort_by', array('priority', true()) 
))}
{foreach $parts as $part}
	<li>{node_view_gui content_node=$part view='line'}
{/foreach}
{undef $parts}
</ul>