{*
    newsletter/unsubscribe.tpl => newsletter/unsubscribe_success.tpl
*}
<div class="newsletter newsletter-unsubscribe">

    <h1>Désinscription à la newsletter</h1>

    <p>
pour vous désinscrire, cliquez sur le bouton suivant :
</p>

    <form method="post" action={concat('newsletter/unsubscribe/', $subscription.hash)|ezurl}>
        <input type="hidden" name="CancelUriInput" value="/" />
        <input class="button" type="submit" name="SubscribeButton" value="Me désinscrire" />
    </form>
</div>