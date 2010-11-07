<div class="zone-layout-{$zone_layout|downcase()} clearfix">
	<div class="leftcol">
		{include uri="design:includes/familles.tpl"}
	</div>
	<div class="rightcol">
		{if and( is_set( $zones[0].blocks ), $zones[0].blocks|count() )}
			{foreach $zones[0].blocks as $block}
				{if or( $block.valid_nodes|count(),
				    and( is_set( $block.custom_attributes), $block.custom_attributes|count() ),
				    and( eq( ezini( $block.type, 'ManualAddingOfItems', 'block.ini' ), 'disabled' ), ezini_hasvariable( $block.type, 'FetchClass', 'block.ini' )|not ) )}
				    <section class="block block-{$block.view} clearfix" id="block-{$block.zone_id}-{$block.id}">
				    {block_view_gui block=$block}
				    </section>
				{else}
				    {skip}
				{/if}
			{/foreach}
		{/if}
	</div>
</div>
