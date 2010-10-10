{def
	$main_level_nodes = fetch( 'content', 'list', hash(
			'parent_node_id', $front_page.node_id,
			'depth',1
			)
		)
}

<a href={$front_page.url_alias|ezurl}><img src={'images/logo.png'|ezdesign} alt="logo" class="logo" id="logo" /></a>

<nav>
<ul>
<li><a href={$front_page.url_alias|ezurl}{if eq($current_node, $front_page)} class="active"{/if}>{$front_page.name}</a></li>
{foreach $main_level_nodes as $main_level_node}
{if ne($main_level_node.node_id, ezini('Nodes', 'Evenements', 'archichouette.ini'))}
<li><a href={$main_level_node.url_alias|ezurl}{if $current_node.path_array|contains($main_level_node.node_id)} class="active"{/if}>{$main_level_node.name}</a></li>
{/if}
{/foreach}
</ul>
</nav>
