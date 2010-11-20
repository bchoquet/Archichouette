<div class="newsletter newsletter-subscribe">

    {def $newsletter_root_node_id = ezini( 'NewsletterSettings', 'RootFolderNodeId', 'cjw_newsletter.ini' )
         $available_output_formats = 2

         $newsletter_system_node_list = fetch( 'content', 'tree', hash( 'parent_node_id', $newsletter_root_node_id,
                                                                        'class_filter_type', 'include',
                                                                        'class_filter_array', array( 'cjw_newsletter_system' ),
                                                                        'sort_by', array( 'name', true() ),
                                                                        'limitation', hash( )
                                                                      )
                                              )
         $newsletter_list_count = fetch( 'content', 'tree_count',
                                                            hash('parent_node_id', $newsletter_root_node_id,
                                                                 'extended_attribute_filter',
                                                                      hash( 'id', 'CjwNewsletterListFilter',
                                                                            'params', hash( 'siteaccess', array( 'current_siteaccess' ) ) ),
                                                                 'class_filter_type', 'include',
                                                                 'class_filter_array', array('cjw_newsletter_list'),
                                                                 'limitation', hash() )
                                                       )}

    <h1>Inscription à la Newsletter</h1>


    {* check if nl system is available *}
    {if or( $newsletter_system_node_list|count()|eq(0), $newsletter_list_count|eq(0) )}
        <div class="block">
            <p>
                {'No newsletters available.'|i18n( 'cjw_newsletter/subscribe' )}
            </p>
        </div>
    {else}

        <form name="subscribe" method="post" action={'/newsletter/subscribe/'|ezurl}>

            {* warnings *}
            {if and( is_set( $warning_array ), $warning_array|count|ne( 0 ) )}
            <div class="block">
                <div class="message-warning">
                    <h2>Certaines informations sont incorrectes</h2>
                    <ul>
                    {foreach $warning_array as $message_array_item}
                        <li><span class="key">{$message_array_item.field_key|wash}: </span><span class="text">{$message_array_item.message|wash()}</span></li>
                    {/foreach}
                    </ul>
                </div>
            </div>
            {/if}

            <div class="block">
                <p>
                    Pour vous inscrire à la newsletter, merci de saisir votre adresse email ci-dessous :
                </p>
            </div>

            <div class="block">
                {foreach $newsletter_system_node_list as $system_node}

                    {def $newsletter_list_node_list = fetch( 'content', 'tree',
                                                                hash('parent_node_id', $system_node.node_id,
                                                                     'extended_attribute_filter',
                                                                          hash( 'id', 'CjwNewsletterListFilter',
                                                                                'params', hash( 'siteaccess', array( 'current_siteaccess' ) ) ),
                                                                     'class_filter_type', 'include',
                                                                     'class_filter_array', array('cjw_newsletter_list'),
                                                                     'limitation', hash() )
                                                           )
                         $newsletter_list_node_list_count = $newsletter_list_node_list|count
                    }

                    {if $newsletter_list_node_list_count|ne(0)}
                            {foreach $newsletter_list_node_list as $list_node sequence array( 'bglight', 'bgdark' ) as $style}
                                {def $list_id = $list_node.contentobject_id
                                     $list_selected_output_format_array = array(0)
                                     $td_counter = 0}

                                    {if is_set( $subscription_data_array.list_output_format_array[$list_id] )}
                                        {set $list_selected_output_format_array = $subscription_data_array.list_output_format_array[$list_id]}
                                    {/if}

                                    {if $list_node.data_map.newsletter_list.content.output_format_array|count|ne(0)}

                                    {* check box subscribe to list *}
                                        <input type="hidden" name="Subscription_IdArray[]" value="{$list_id}" title="" />
                                        <input type="hidden" name="Subscription_ListArray[]" value="{$list_id}"title="{$list_node.data_map.title.content|wash}" />
                                     {else}
                                    {* do nothing *}
                                    {/if}


                                {undef $list_id $list_selected_output_format_array $td_counter $newsletter_list_node_list_count}
                            {/foreach}
                    {/if}

                    {undef $newsletter_list_node_list}
                {/foreach}
            </div>

            {* Email. *}
            <div class="block">
                <label for="Subscription_Email">{"E-mail"|i18n( 'cjw_newsletter/subscribe' )}*:</label>
                <input class="halfbox" id="Subscription_Email" type="text" name="Subscription_Email" value="{cond( and( is_set( $user ), $subscription_data_array['email']|eq('') ), $user.email|wash(), $subscription_data_array['email']|wash )}" title="{'Email of the subscriber.'|i18n( 'cjw_newsletter/subscribe' )}" />
            </div>

            <div class="block">
                <input type="hidden" name="BackUrlInput" value="{cond( ezhttp_hasvariable('BackUrlInput'), ezhttp('BackUrlInput'), 'newsletter/subscribe'|ezurl('no'))}" />
                <input class="button" type="submit" name="SubscribeButton" value="M'inscrire" />
            </div>

            <br />
            <br />

        </form>
    {/if}

</div>