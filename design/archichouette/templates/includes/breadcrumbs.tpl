	<ul id="breadcrumbs">
	{foreach $node.path as $path_elem}
		{if $path_elem.node_id|ne(2)}
		<li><a href={$path_elem.url_alias|ezurl()}>&gt; {$path_elem.name|wash()}</a>
		{/if}
	{/foreach}
		<li class="active">&gt; {$node.name|wash()}</li>
	</ul>
