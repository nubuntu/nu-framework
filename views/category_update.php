<div class="container">
    <div class="row">
        <div class="col-lg-12 text-center">
            <h2>POST /v1/category/<?=$id_category;?></h2>
            <hr class="star-primary">
        </div>
    </div>
    <div class="row detail">
        <h3>Parameter</h3>
        <strong>HTTP_HEADER</strong></br>
        token : <?=$token;?><br/>
        <strong>HTTP_POST</strong><br/>
        category_name : <?=$category_name;?> <br/>
        <h3>Response</h3>
        <pre><?=print_r($response,true);?></pre>
        Oh... that worst, more better if you just <a href="/tester/category_delete/<?=$id_category;?>">delete it</a><br/>
    </div>
</div>