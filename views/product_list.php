<div class="container">
    <div class="row">
        <div class="col-lg-12 text-center">
            <h2>GET /v1/product</h2>
            <hr class="star-primary">
        </div>
    </div>
    <div class="row detail">
        <h3>Parameter</h3>
        <strong>HTTP_HEADER</strong></br>
        token : <?=$token;?>
        <h3>Response</h3>
        <pre><?=print_r($response,true);?></pre>
        let we choose first product (<?=$id_product;?>) to see detail and items<br/>
        next, go to <a href='/tester/product/<?=$id_product;?>'><strong>product <?=$product_name;?> </strong></a>
    </div>
</div>