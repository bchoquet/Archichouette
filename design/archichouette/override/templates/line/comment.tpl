{* Comment - Line view *}

<div class="content-view-line class-comment">
    <h2>{$node.name|wash}</h2>
    <div class="attribute-infos">
        <span class="author">{$node.data_map.author.content|wash}</span> /
        <span class="date">{$node.object.published|datetime('custom', '%d.%m.%Y')}</span>
    </div>
    <div class="attribute-message">
        <p>{$node.data_map.message.content|wash(xhtml)|break}</p>
    </div>
</div>