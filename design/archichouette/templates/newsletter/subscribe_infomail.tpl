{* subsribe_infomail -
 template with email input field to request the configure link

*}

<div class="newsletter newsletter-subscribe_infomail">
<h1>Désinscription à la newsletter</h1>
    {* warnings *}
    {if and( is_set( $warning_array ), $warning_array|count|ne( 0 ) )}
    <div class="block">
        <div class="message-warning">
            <h2>Erreur</h2>
            <ul>
            {foreach $warning_array as $index => $messageArrayItem}
                <li><span class="key">{$messageArrayItem.field_key|wash}: </span><span class="text">{$messageArrayItem.message|wash()}</span></li>
            {/foreach}
            </ul>
        </div>
    </div>
    {/if}

    <p>
        Entrez l'email avec lequel vous êtes inscrit pour recevoir un lien de sésabonnement :
    </p>

    <form action={'newsletter/subscribe_infomail'|ezurl()} method="post">
        <label for="EmailInput">Email*:</label>
        <input class="input" type="text" id="EmailInput" name="EmailInput" size="50" />
        <br/>
        <input class="button" type="submit" value="Envoyer" name="SubscribeInfoMailButton" />
        <input type="hidden" name="BackUrlInput" value={'newsletter/subscribe'|ezurl()} />
    </form>
    <div class="block">
    </div>
</div>