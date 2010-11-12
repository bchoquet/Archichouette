{def $sujet = fetch('content', 'node', hash('node_id', $main_node_id))}
<div class="content-edit">
    <div class="class-comment">

    <form enctype="multipart/form-data" method="post" action={concat( "/content/edit/", $object.id, "/", $edit_version, "/", $edit_language|not|choose( concat( $edit_language, "/" ), '' ) )|ezurl}>

	{include uri="design:includes/breadcrumbs.tpl" node=$sujet}
    <div class="attribute-header">
        <h1 class="long">Nouveau Commentaire</h1>
    </div>

    {include uri="design:content/edit_validation.tpl"}

    <div class="block">
       {def $attribute=$object.data_map.subject}
       <label>{$attribute.contentclass_attribute.name}</label><div class="labelbreak"></div>
       <input type="hidden" name="ContentObjectAttribute_id[]" value="{$attribute.id}" />
       <input class="box" type="text" size="70" name="ContentObjectAttribute_ezstring_data_text_{$attribute.id}" value="" />
    </div>

    {def $current_user=fetch( 'user', 'current_user' )
         $attribute=$object.data_map.author}
    <div class="block">
        {if $current_user.is_logged_in}
        <input type="hidden" name="ContentObjectAttribute_ezstring_data_text_{$attribute.id}" value="{$current_user.contentobject.name|wash}" />
        {else}
            <label>{$attribute.contentclass_attribute.name}</label><div class="labelbreak"></div>
        <input type="hidden" name="ContentObjectAttribute_id[]" value="{$attribute.id}" />
        <input class="box" type="text" size="70" name="ContentObjectAttribute_ezstring_data_text_{$attribute.id}" value="" />
        {/if}
    </div>

    <div class="block">
       {def $attribute=$object.data_map.message}
       <label>{$attribute.contentclass_attribute.name}</label><div class="labelbreak"></div>
       <input type="hidden" name="ContentObjectAttribute_id[]" value="{$attribute.id}" />
       <textarea class="box" cols="70" rows="10" name="ContentObjectAttribute_data_text_{$attribute.id}"></textarea>
    </div>

    <div class="buttonblock">
        <input class="button rounded10" type="submit" name="PublishButton" value="{'Send for publishing'|i18n('design/ezwebin/edit/comment')}" />
        <input class="button rounded10" type="submit" name="DiscardButton" value="{'Discard'|i18n('design/ezwebin/edit/comment')}" />
        <input type="hidden" name="MainNodeID" value="{$main_node_id }" />
        <input type="hidden" name="DiscardConfirm" value="1" />
    </div>

    </form>

    </div>
</div>