{*?template charset=utf-8?*}{set-block variable=$subject scope=root}{ezini('NewsletterMailSettings', 'EmailSubjectPrefix', 'cjw_newsletter.ini')} {'Subscription information'|i18n( 'cjw_newsletter/subscription_information' )}{/set-block}
{*
$newsletter_user
$hostname
*}
{def $subscriptionListString = ''}
{foreach $newsletter_user.subscription_array as $subscription}
{set $subscriptionListString = concat( $subscriptionListString, "\n- ", $subscription.newsletter_list.name|wash() )}
{/foreach}
Bonjour,
Pour vous désabonner de la newsletter, cliquez sur le lien ci-dessous :
{concat( 'http://', $hostname, concat( '/newsletter/configure/', cond( $newsletter_user, $newsletter_user.hash, '#' ) )|ezurl(no))

{include uri="design:newsletter/mail/footer.tpl"}