{def
	$main_level_nodes = fetch( 'content', 'list', hash(
			'parent_node_id', $front_page.node_id,
			'depth',1,
			'class_filter_type', 'include',
			'class_filter_array', array('folder', 'frontpage')
			)
		)
}

<a href={$front_page.url_alias|ezurl} id="logo"><img src={'images/logo_noel.png'|ezdesign} alt="Archichouette" class="logo" /></a>

<nav id="mainNav">
<ul>
<li><a href={$front_page.url_alias|ezurl} class="rounded-tr{if eq($current_node, $front_page)} active{/if}">{$front_page.name}</a></li>
{foreach $main_level_nodes as $main_level_node}
{if ne($main_level_node.node_id, ezini('Nodes', 'Evenements', 'archichouette.ini'))}
<li><a href={$main_level_node.url_alias|ezurl} class="rounded-tr{if $current_node.path_array|contains($main_level_node.node_id)} active{/if}">{$main_level_node.name}</a></li>
{/if}
{/foreach}
</ul>
</nav>
