{def $valid_nodes = $block.valid_nodes}

<!-- BLOCK CONTENT: START -->
{if $block.name}
<h1 class="title rounded-trb">{$block.name|wash()}</h1>
{/if}
<ul class="block-contents rounded-bl">
{foreach $valid_nodes as $valid_node}
	<li>{node_view_gui view='block_item' image_class='block2items1' content_node=$valid_node}</li>
{/foreach}
</ul>
<!-- BLOCK CONTENT: END -->

{undef $valid_nodes}