{def $voisins = fetch('content', 'list', hash(
	'parent_node_id', ezini('Nodes', 'Voisins', 'archichouette.ini'),
	'class_filter_type', 'include',
	'class_filter_array', array('partenaire')
))}
<a id="rppp" href="http://www.petitpaume.com" rel="external"><img src={"images/rppp.png"|ezdesign} /></a>
{if $voisins|count}
<section id="voisins">
	<h1>La rue du Griffon :</h1>
	<ul>
		{foreach $voisins as $v}
		<li>
			<a href={$v.data_map.lien.content|ezurl} rel="external">
				{attribute_view_gui attribute=$v.data_map.logo image_class='logo'}
			</a>
		</li>
		{/foreach}
	</ul>
</section>
{/if}