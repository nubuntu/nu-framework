<div class="container">
    <div class="row">
        <div class="col-lg-12 text-center">
            <h2>GET /v1/category/<?=$id_category;?></h2>
            <hr class="star-primary">
        </div>
    </div>
    <div class="row detail">
        <h3>Parameter</h3>
        <strong>HTTP_HEADER</strong></br>
        token : <?=$token;?>
        <h3>Response</h3>
        <pre><?=print_r($response,true);?></pre>
        ok, you got category detail and product right now<br/>
        now let we try add new category, just fill the form bellow<br/>
        <form class="form-horizontal" method='post' action='/tester/category_create'>
            <div class="form-group">
                <label class="control-label col-sm-2">Name</label>
                <div class="col-sm-10">
                    <input type="text" name="category_name" class="form-control" placeholder="Enter name">
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-sm-2">Parent</label>
                <div class="col-sm-10">
                    <?=$select;?>
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10">
                    <input type="submit" class="btn btn-default" value="Submit"/>
                </div>
            </div>
        </form>
    </div>
</div>