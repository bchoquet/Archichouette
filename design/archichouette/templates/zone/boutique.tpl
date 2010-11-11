<div class="zone-layout-{$zone_layout|downcase()}">
{if and( is_set( $zones[0].blocks ), $zones[0].blocks|count() )}
	<div class="topzone clearfix">
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
	</div>
{/if}
{if and( is_set( $zones[1].blocks ), $zones[1].blocks|count() )}
	<div class="middlezone">
	{foreach $zones[1].blocks as $block}
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
	</div>
{/if}
{if and( is_set( $zones[2].blocks ), $zones[2].blocks|count() )}
	<div class="bottomzone clearfix">
	{foreach $zones[2].blocks as $block}
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
	</div>
{/if}
</div>