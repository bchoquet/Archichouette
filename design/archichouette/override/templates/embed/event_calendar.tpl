<section class="content-view-embed class-event-calendar">
{def

    $event_node    = $object.main_node
    $event_node_id = $object.main_node_id

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

    $last_ts = makedate($temp_month, $days, $temp_year)
}

{if ne($temp_month, 12)}
    {set $last_ts = makedate( $temp_month|sum( 1 ), 1, $temp_year )}
{else}
    {set $last_ts = makedate( 1, 1, $temp_year|sum(1) )}
{/if}

{def    $events = fetch( 'content', 'list', hash(
            'parent_node_id', $event_node_id,
            'sort_by', array( 'attribute', true(), 'event/from_time'),
            'class_filter_type',  'include',
            'class_filter_array', array( 'event' ),
            'main_node_only', true(),
             'attribute_filter',
            array( 'or',
                    array( 'event/from_time', 'between', array( sum($first_ts,1), sub($last_ts,1)  )),
                    array( 'event/to_time', 'between', array( sum($first_ts,1), sub($last_ts,1) )) )
                ))

}
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
</section>
{undef}
