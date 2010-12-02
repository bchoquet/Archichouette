{def

    $event_node    = $node.main_node
    $event_node_id = $node.main_node_id

    $curr_ts = currentdate()
    $curr_today = $curr_ts|datetime( custom, '%j')
    $curr_year = $curr_ts|datetime( custom, '%Y')
    $curr_month = $curr_ts|datetime( custom, '%n')

    $temp_ts = currentdate()

	$temp_day = $temp_ts|datetime(custom, '%d')
    $temp_month = $temp_ts|datetime( custom, '%n')
    $temp_year = $temp_ts|datetime( custom, '%Y')
    $temp_today = $temp_ts|datetime( custom, '%j')

    $days = $temp_ts|datetime( custom, '%t')

    $first_ts = makedate($temp_month, $temp_day, $temp_year)

    $last_ts = $first_ts|sum(2592000)
}


{def    $events = fetch( 'content', 'list', hash(
            'parent_node_id', $event_node_id,
            'sort_by', array( 'attribute', true(), 'event/from_time'),
            'class_filter_type',  'include',
            'class_filter_array', array( 'event' ),
            'main_node_only', true()
))
}


{if $events|count()}
<div class="content-view-full class-event-calendar clearfix">
	{include uri="design:includes/breadcrumbs.tpl" node=$node}
<h1>{$object.name|wash}</h1>
<ul>
{foreach $events as $event}
	<li><a href={$event.url_alias|ezurl}>
	<h2>{$event.data_map.from_time.content.timestamp|datetime(custom, '%d / %m')}</h2>
	<p>
		{$event.name|wash}
		... à {$event.data_map.from_time.content.timestamp|datetime(custom, '%H:%i')}
	</p>
	</a></li>
{/foreach}
</ul>
</div>
{/if}
{undef}
