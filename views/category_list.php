<div class="container">
    <div class="row">
        <div class="col-lg-12 text-center">
            <h2>GET /v1/category</h2>
            <hr class="star-primary">
        </div>
    </div>
    <div class="row detail">
        <h3>Parameter</h3>
        <strong>HTTP_HEADER</strong></br>
        token : <?=$token;?>
        <h3>Response</h3>
        <pre><?=print_r($response,true);?></pre>
        let we choose first category (<?=$id_category;?>) to see detail and product<br/>
        next, go to <a href='/tester/category/<?=$id_category;?>'><strong>category <?=$category_name;?></strong></a>
    </div>
</div>