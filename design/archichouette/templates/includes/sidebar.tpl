{def $evenements_node = fetch('content', 'node', hash('node_id', ezini('Nodes', 'Evenements', 'archichouette.ini')))}
	<aside id="sidebarRight">
		{content_view_gui content_object=$evenements_node.object view='embed'}
		
		<!-- deguise la chouette -->
		<!-- facebook -->
		<!-- newsletter -->
	</aside>
 