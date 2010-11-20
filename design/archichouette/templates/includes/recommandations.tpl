{def $boutique = fetch('content', 'node', hash('node_id', ezini('Nodes', 'Boutique', 'archichouette.ini')))}
<section id="vousaimez" class="rounded">
	<a href={concat($boutique.url_alias, '#block-df82211322b366f320cbb26172278dd1-3644897aaefb5d0a77ff71f784171f7e')|ezurl}>
		<h1>Vous avez aimé !</h1>
		<p>Dites le... !</p>
	</a>
</section>