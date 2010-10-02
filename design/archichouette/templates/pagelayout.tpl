<!doctype html>
<html lang="{$site.http_equiv.Content-language|wash}" class="no-js">
<head>

{def
	$basket_is_empty   = cond( $current_user.is_logged_in, fetch( shop, basket ).is_empty, 1 )
    $user_hash         = concat( $current_user.role_id_list|implode( ',' ), ',', $current_user.limited_assignment_value_list|implode( ',' ) )
}

{if is_set( $extra_cache_key )|not}
    {def $extra_cache_key = ''}
{/if}

{cache-block keys=array( $module_result.uri, $basket_is_empty, $current_user.contentobject_id, $extra_cache_key )}
{def
	$pagedata 	= ezpagedata()
	$current_node_id = $pagedata.node_id
	$html5boilerplate_settings = ezini( 'Environment', 'Settings', 'html5boilerplate.ini' )
	$index_page = ezini( 'NodeSettings', 'RootNode', 'content.ini' )
	$front_page=fetch( 'content', 'node', hash( 'node_id', $index_page ) )
	$current_node=fetch( 'content', 'node', hash( 'node_id', $current_node_id ) )
}

{include uri='design:page_head.tpl'}
{if is_set($module_result.node_id)}
	{include uri="design:parts/opengraph.tpl" node_id=$module_result.node_id}
{/if}
</head>
<!--[if lt IE 7 ]> <body class="ie6"> <![endif]-->
<!--[if IE 7 ]>    <body class="ie7"> <![endif]-->
<!--[if IE 8 ]>    <body class="ie8"> <![endif]-->
<!--[if IE 9 ]>    <body class="ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <body> <!--<![endif]-->

    <header>
    
		{cache-block keys=array( $module_result.uri, $user_hash, $extra_cache_key )}

		{include uri='design:includes/header.tpl' current_node=$current_node html5boilerplate_settings=$html5boilerplate_settings}

    </header>

	{if and( $pagedata.website_toolbar, $pagedata.is_edit|not)}
		{include uri='design:page_toolbar.tpl'}
	{/if}
		{/cache-block}
		{/cache-block}
		{$module_result.content}
		{cache-block keys=array( $module_result.uri, $user_hash, $access_type.name, $extra_cache_key )}
	
	<aside id="sidebarRight">
		<!-- evenements -->
		<!-- deguise la chouette -->
		<!-- facebook -->
	</aside>
    
    <footer>

		{include uri='design:includes/footer.tpl' current_node=$current_node html5boilerplate_settings=$html5boilerplate_settings}

    </footer>


{ezscript_require(array( 'ezjsc::jquery', 'ezjsc::jqueryio') )}

{ezscript_load( array('plugins.js','script.js','profiling/yahoo-profiling.min.js', 'profiling/config.js') )}  

  <!--[if lt IE 7 ]>
    <script src={"javascript/dd_belatedpng.js"|ezdesign}></script>
  <![endif]-->

{if $html5boilerplate_settings.GoogleAnalyticsKey}

{literal}
  <script>
   var _gaq = [['_setAccount', '{/literal}{$html5boilerplate_settings.GoogleAnalyticsKey}{literal}'], ['_trackPageview']]; 
   (function(d, t) {
    var g = d.createElement(t), s = d.getElementsByTagName(t)[0];
    g.async = true; g.src = '//www.google-analytics.com/ga.js'; s.parentNode.insertBefore(g, s);
   })(document, 'script');
  </script>
{/literal}

{/if}

{/cache-block}

<div id="debug"><!--DEBUG_REPORT--></div>
	
</body>
</html>