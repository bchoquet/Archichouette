{* subsribe_success_no.tpl is shown after subscribtion to a newsletter list is failed

    $newsletter_user
    $mail_send_result
    $user_email_already_exists
    $subscription_result_array
    $back_url_input
*}

<div class="newsletter newsletter-subscribe_success_not">
    <h1>Inscription à la Newsletter</h1>
    <p  class="newsletter-maintext">
        Une erreur est surbenue, nous n'avons pas pu vous inscrire à la newsletter
    </p>
    <p><a href="{$back_url_input}">Retour</a></p>
</div>