<div class="container">
    <div class="row">
        <div class="col-lg-12 text-center">
            <h2>POST /v1/category</h2>
            <hr class="star-primary">
        </div>
    </div>
    <div class="row detail">
        <h3>Parameter</h3>
        <strong>HTTP_HEADER</strong></br>
        token : <?=$token;?> <br/>
        <strong>HTTP_POST</strong><br/>
        category_name : <?=$category_name;?> <br/>
        category_parent : <?=$category_parent;?> <br/>
        <h3>Response</h3>
        <pre><?=print_r($response,true);?></pre>
        Nice.., you just created new category, and the id_category is <?=$id_category;?><br/>
        so, let we check is it right or not <a href="/tester/category_check/<?=$id_category;?>">/v1/category/<?=$id_category;?></a><br/>
    </div>
</div>