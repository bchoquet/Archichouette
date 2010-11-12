{* Link - Block Item View *}
<a href={$node.data_map.location.content|ezurl()}{if $node.data_map.open_in_new_window.content} rel="external"{/if}>{$node.data_map.name.content|wash()}</a>