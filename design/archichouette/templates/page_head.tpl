{def
	$title_path = array()
	$site_title = ''
	$meta = metadata( $module_result.node_id )
}

{if is_set($module_result.content_info.persistent_variable.site_title)}
    {set scope=root site_title=$module_result.content_info.persistent_variable.site_title}
{else}

	{foreach $module_result.path as $path}

		{set $title_path = $title_path|prepend($path.text)}

	{/foreach}

	{set $site_title = concat($title_path|implode(' / '),' - ',$site.title|wash)}

{/if}


<meta charset="utf-8">
<!--[if IE]><![endif]-->
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="generator" content="eZ Publish" />
{if $meta.title}
	<title>{$meta.title|wash}</title>
{else}
	<title>{$site_title}</title>
{/if}
<meta name="viewport" content="width=device-width; initial-scale=1.0; maximum-scale=1.0;">
<link rel="shortcut icon" href="/favicon.ico">
{* 'core.css','pagelayout.css','content.css',*}
  {ezcss_load( array('debug.css',
                      'websitetoolbar.css',
                      ezini( 'StylesheetSettings', 'CSSFileList', 'design.ini' ),
                      ezini( 'StylesheetSettings', 'FrontendCSSFileList', 'design.ini' ) ))}

<link rel="apple-touch-icon" href={"apple-touch-icon.png"|ezdesign}>
<script src={"javascript/modernizr-1.5.min.js"|ezdesign}></script>

{* check if we need a http-equiv refresh *}
{if $site.redirect}
<meta http-equiv="Refresh" content="{$site.redirect.timer}; URL={$site.redirect.location}" />

{/if}

{* check if we need a http-equiv refresh *}
{if $site.redirect}
<meta http-equiv="Refresh" content="{$site.redirect.timer}; URL={$site.redirect.location}" />

{/if}
{foreach $site.http_equiv as $key => $item}
<meta name="{$key|wash}" content="{$item|wash}" />

{/foreach}
{if $meta}
	{if $meta.keywords}
        <meta name="keywords" content="{$meta.keywords|wash}" />
    {/if}
    {if $meta.description}
        <meta name="description" content="{$meta.description|wash}" />
    {/if}
{else}
	{foreach $site.meta as $key => $item}
	{if is_set( $module_result.content_info.persistent_variable[$key] )}
		<meta name="{$key|wash}" content="{$module_result.content_info.persistent_variable[$key]|wash}" />
	{else}
		<meta name="{$key|wash}" content="{$item|wash}" />
	{/if}
	{/foreach}
{/if}
{include uri="design:ezcanonical.tpl"}