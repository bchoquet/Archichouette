{def $valid_nodes = $block.valid_nodes}

<!-- BLOCK: START -->
{if $block.name}
    <h1 class="title rounded-trb">{$block.name|wash()}</h1>
{/if}
<div class="block-contents slideshow rounded-bl">
	<div class="slideshow-contents">
	{foreach $valid_nodes as $valid_node}
		{node_view_gui content_node=$valid_node view='block_item'}
	{/foreach}
	<!-- BLOCK: END -->
	</div>
	<span class="infos rounded-trb">+ d'infos</span>
</div>
{undef $valid_nodes}