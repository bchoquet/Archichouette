{* subsribe_success.tpl is shown after successfully subscribe to a newsletter list

    $newsletter_user
    $mail_send_result
    $user_email_already_exists
    $subscription_result_array
    $back_url_input
*}
<div class="newsletter newsletter-subscribe_success">
    <h1>Inscription à la Newsletter</h1>

    <p class="newsletter-maintext">
        Vous êtes presque inscrit à la newsletter
    </p>
    <p>
        Un email vous a été envoyé à {$newsletter_user.email}.
    </p>
    <p>
        Vous devez encore activer votre inscription en cliquant sur le lien contenu dans cet email.
    </p>
    <p><a href="{$back_url_input}">Retour</a></p>
</div>