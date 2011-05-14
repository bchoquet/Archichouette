{* Article - Full view *}
<article class="block-item-article clearfix">
{if $node.data_map.body.has_content}<a href={$node.url_alias|ezurl()}>{/if}
	{if $node.object.data_map.visuels.content.relation_list.0}
		<div class="visuel">
		{def $visuelObj = fetch('content', 'object', hash('object_id', $node.object.data_map.visuels.content.relation_list.0.contentobject_id))}
		{content_view_gui content_object=$visuelObj view=embed object_parameters=hash('size', 'small')}
		{undef $visuelObj}
		</div>
	{/if}  
	     
	<h1>{$node.data_map.title.content|wash()}</h1>
	
    
   	{if $node.data_map.intro.content.is_empty|not}
    	<div class="attribute-short">
        	{attribute_view_gui attribute=$node.data_map.intro}
        </div>
    {/if}


    {if $node.data_map.body.has_content}
        <span class="infos rounded-trb">+ d'infos</span>
    {/if}
{if $node.data_map.body.has_content}</a>{/if}
</article>
