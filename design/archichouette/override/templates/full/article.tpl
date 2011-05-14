<article class="content-view-full class-article">
{include uri="design:includes/breadcrumbs.tpl" node=$node}

	{if $node.object.data_map.visuels.content.relation_list|count()}
    <div class="attribute-visuels slideshow">
    	<div class="slideshow-contents">
    	{foreach $node.object.data_map.visuels.content.relation_list as $visuel}
    		{def $visuelObj = fetch('content', 'object', hash('object_id', $visuel.contentobject_id))}
    		{content_view_gui content_object=$visuelObj view=embed object_parameters=hash('size', 'medium')}
			{undef $visuelObj}
		{/foreach}
		</div>
    </div>
    {/if}

