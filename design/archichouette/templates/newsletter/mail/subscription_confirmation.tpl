{*?template charset=utf-8?*}{set-block variable=$subject scope=root}{ezini('NewsletterMailSettings', 'EmailSubjectPrefix', 'cjw_newsletter.ini')} {'Subscription verification'|i18n( 'cjw_newsletter/subscription_confirmation' )}{/set-block}
{*
$newsletter_user
$hostname
*}
{def $subscriptionListString = ''}
{foreach $newsletter_user.subscription_array as $subscription}
{set $subscriptionListString = concat( $subscriptionListString, "\n- ", $subscription.newsletter_list.data_map.title.content|wash() )}
{/foreach}
Bonjour,
vous avez demandé à vous inscrire à la Newsletter Archichouette.

Pour valider votre inscription, merci de cliquer sur le lien ci dessous :
{concat( 'http://', $hostname, concat( '/newsletter/configure/', cond( $newsletter_user, $newsletter_user.hash, '#' ) )|ezurl(no))

{include uri="design:newsletter/mail/footer.tpl"}