<div class="container">
    <div class="row">
        <div class="col-lg-12 text-center">
            <h2>DELETE /v1/category/<?=$id_category;?></h2>
            <hr class="star-primary">
        </div>
    </div>
    <div class="row detail">
        <h3>Parameter</h3>
        <strong>HTTP_HEADER</strong></br>
        token : <?=$token;?>
        <h3>Response</h3>
        <pre><?=print_r($response,true);?></pre>
        good job, I think we are done with this category<br/>
        you can go <a href="/tester/auth">back</a> and repeat it if you want, or move on to <a href="/tester/product_list">product list</a></br>
    </div>
</div>