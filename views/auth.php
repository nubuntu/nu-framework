<div class="container">
    <div class="row">
        <div class="col-lg-12 text-center">
            <h2>GET /v1/auth</h2>
            <hr class="star-primary">
        </div>
    </div>
    <div class="row detail">
        <h3>Parameter</h3>
        <strong>HTTP_HEADER</strong></br>
        apikey : <?=$config['apikey'];?>
        <h3>Response</h3>
        <pre><?=print_r($response,true);?></pre>
        your new token is <?=$response['data']['token'];?><br/>
        we save that token from now in session, for later use if we need to call other request<br/>
        next, go to <a href='/tester/category_list'><strong>category list</strong></a>
    </div>
</div>