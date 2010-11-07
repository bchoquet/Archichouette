{def $valid_nodes = $block.valid_nodes}

<!-- BLOCK: START -->
{if $block.name}
    <h1>{$block.name|wash()}</h1>
{/if}
<div class="slideshow">
	<div class="slideshow-contents">
	{foreach $valid_nodes as $valid_node}
		{node_view_gui content_node=$valid_node view='block_item'}
	{/foreach}
	<!-- BLOCK: END -->
	</div>
</div>
{undef $valid_nodes}