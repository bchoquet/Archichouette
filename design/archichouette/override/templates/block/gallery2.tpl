{def $valid_nodes = $block.valid_nodes}
<!-- BLOCK: START -->
<h1>{$block.name|wash()}</h1>
<!-- BLOCK CONTENT: START -->
<div class="slideshow">
	<div class="slideshow-contents">
	{foreach $valid_nodes as $valid_node}
   		{def $visuelObj = fetch('content', 'object', hash('object_id', $valid_node.contentobject_id))}
   		{content_view_gui content_object=$visuelObj view=embed object_parameters=hash('size', 'block_home')}
		{undef $visuelObj}
	{/foreach}
	</div>
</div>
{def $boutique = fetch('content', 'node', hash('node_id', ezini('Nodes', 'Boutique', 'archichouette.ini')))}
<a class="boutique rounded-tlb" href={$boutique.url_alias|ezurl()}>Entrez dans la boutique</a>
<!-- BLOCK CONTENT: END -->
<!-- BLOCK: END -->
{undef $valid_nodes}