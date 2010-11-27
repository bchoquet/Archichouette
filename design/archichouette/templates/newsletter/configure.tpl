{* newsletter/configure.tpl *}
<div class="newsletter newsletter-configure">

    <h1>Confirmez votre inscription à la Newsletter</h1>

    {def $newsletter_root_node_id = ezini( 'NewsletterSettings', 'RootFolderNodeId', 'cjw_newsletter.ini' )
         $available_output_formats = 2} {* for tables *}

    {if is_set( $confirm_all_result )}
    <div class="message-feedback">
         <p>Vous êtes bien inscrit à la newsletter</p>
    </div>

    {else if is_set( $changes_saved )}
    <div class="message-feedback">
        <p>Vous êtes bien inscrit à la newsletter</p>
    </div>
    {else}

    {* warnings *}
    {if and( is_set( $warning_array ), $warning_array|count|ne( 0 ) )}
    <div class="block">
        <div class="message-warning">
            <h2>Erreur de saisie</h2>
            <ul>
            {foreach $warning_array as $index => $messageArrayItem}
                <li><span class="key">{$messageArrayItem.field_key|wash}: </span><span class="text">{$messageArrayItem.message|wash()}</span></li>
            {/foreach}
            </ul>
        </div>
    </div>
    {/if}

    <form name="configure" method="post" action={concat('/newsletter/configure/', $newsletter_user.hash)|ezurl}>

    {* fetch all available newsletter systems *}
    {def $newsletter_system_node_list = fetch( 'content', 'tree', hash('parent_node_id', $newsletter_root_node_id,
                                                            'class_filter_type', 'include',
                                                            'class_filter_array', array('cjw_newsletter_system'),
                                                            'sort_by', array( 'name', true() ),
                                                            'limitation', hash( ) )) }

    {* check if a newsletter_system is available *}
    {if $newsletter_system_node_list|count|eq(0)}
        <p>
            {'No newsletters available.'|i18n( 'cjw_newsletter/configure' )}
        </p>
    {else}
    {* for every newsletter_system check if there are newsletter_list where a subscription for current siteaccess is possible *}
        {def $newsletter_list_node_list = fetch( 'content', 'tree', hash('parent_node_id', $newsletter_system_node_list.0.node_id,
                                                                'extended_attribute_filter',
                                                                      hash( 'id', 'CjwNewsletterListFilter',
                                                                            'params', hash( 'siteaccess', array( 'current_siteaccess' ) ) ),
                                                                'class_filter_type', 'include',
                                                                'class_filter_array', array('cjw_newsletter_list'),
                                                                'limitation', hash() ))
             $newsletter_available=false()
        }

        {foreach $newsletter_system_node_list as $system_node}
            {set $newsletter_list_node_list = fetch( 'content', 'tree', hash('parent_node_id', $system_node.node_id,
                                                                'extended_attribute_filter',
                                                                      hash( 'id', 'CjwNewsletterListFilter',
                                                                            'params', hash( 'siteaccess', array( 'current_siteaccess' ) ) ),
                                                                'class_filter_type', 'include',
                                                                'class_filter_array', array('cjw_newsletter_list'),
                                                                'limitation', hash( ) )) }
            {if $newsletter_list_node_list|count()|gt(0)}
                {set $newsletter_available=true()}
            {/if}
        {/foreach}
        {undef $newsletter_list_node_list}

        {* no nl_list available *}
        {if $newsletter_available|not()}
            <p>
                {'No newsletters available.'|i18n( 'cjw_newsletter/configure' )}
            </p>
        {* nl_list available *}
        {else}

                {foreach $newsletter_system_node_list as $system_node}
                    {def $newsletter_list_node_list = fetch( 'content', 'tree',
                                                                hash('parent_node_id', $system_node.node_id,
                                                                     'extended_attribute_filter',
                                                                          hash( 'id', 'CjwNewsletterListFilter',
                                                                                'params', hash( 'siteaccess', array( 'current_siteaccess' ) ) ),
                                                                     'class_filter_type', 'include',
                                                                     'class_filter_array', array('cjw_newsletter_list'),
                                                                     'limitation', hash( ) )) }
                {if $newsletter_list_node_list|count|ne(0)}
                <div class="newsletter-system-design">
                    {foreach $newsletter_list_node_list as $list_node}
                        <tr>
                        {def $list_id = $list_node.contentobject_id
                             $subscription_array = $newsletter_user.subscription_array
                             $confirmed = 0
                             $approved = 0
                             $removed = 0
                             $subscription = null
                             $list_selected_output_format_array = array()
                             $status = 0
                             $is_removed = false()
                             $subscription_hash = ''
                             $td_counter = 0}

                        {if is_set($subscription_array[$list_id])}

                            {set $subscription = $subscription_array[$list_id]
                                 $list_selected_output_format_array = $subscription.output_format_array
                                 $confirmed = $subscription.confirmed
                                 $removed = $subscription.removed
                                 $approved = $subscription.approved
                                 $status = $subscription.status
                                 $is_removed = $subscription.is_removed
                                 $subscription_hash = $subscription.hash}

                        {/if}
                        {if $list_node.data_map.newsletter_list.content.output_format_array|count()|ne(0)}
                                {*<li>status: ({$status|wash}) - confirmed( {if $confirmed|ne(0)} {$confirmed|datetime( 'custom', '%j.%m.%Y %H:%i' )}{else} n/a {/if}) | approved({if $approved|ne(0)}  {$approved|datetime( 'custom', '%j.%m.%Y %H:%i' )} {else} n/a {/if}) | removed({if $removed|ne(0)}  {$removed|datetime( 'custom', '%j.%m.%Y %H:%i' )} {else} n/a {/if})<br>*}
                                <input type="hidden" name="Subscription_IdArray[]" value="{$list_id}" title="" />
                                <input type="hidden" name="Subscription_ListArray[]" value="{$list_id}" title="{$list_node.data_map.title.content|wash}" />
                                {*$list_node.data_map.newsletter_list|attribute(show)*}


                        {undef $list_id $list_selected_output_format_array $subscription_array $subscription $confirmed $subscription $removed $approved $status $is_removed $subscription_hash $td_counter}
                    {/foreach}
                </div>
                {/if}
                {undef $newsletter_list_node_list}

                {/foreach}

                {def $available_saluation_array = $newsletter_user.available_salutation_name_array}

                {* Email. *}
                <div class="block">
                    <label for="Subscription_Email">{"Email"|i18n( 'cjw_newsletter/configure' )}:</label>
                    <input class="halfbox" id="Subscription_Email" type="text" name="Subscription_Email" value="{$newsletter_user.email|wash}" title="{'Email of the subscriber.'|i18n( 'cjw_newsletter/configure' )}" {cond( is_set( $newsletter_user ), 'disabled="disabled"', '')} />
                </div>

                <div class="block">
                    <input class="button" type="submit" name="ConfirmButton" value="Valider mon inscription" />
                </div>
           </form>

        {/if}
        {undef $newsletter_available}
    {/if}
	{/if}
</div>
