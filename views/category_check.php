<div class="container">
    <div class="row">
        <div class="col-lg-12 text-center">
            <h3>GET /v1/category/<?=$id_category;?></h3>
            <hr class="star-primary">
        </div>
    </div>
    <div class="row detail">
        <h3>Parameter</h3>
        <strong>HTTP_HEADER</strong></br>
        token : <?=$token;?>
        <h3>Response</h3>
        <pre><?=print_r($response,true);?></pre>
        yeah, you're awesome.... new category has ben added and displayed here<br/>
        how about if you edit this category?, I think the name is not too cool<br/>
        <form class="form-horizontal" method='post' action='/tester/category_update/<?=$id_category;?>'>
            <div class="form-group">
                <label class="control-label col-sm-2">Name</label>
                <div class="col-sm-10">
                    <input type="text" name="category_name" class="form-control" placeholder="Enter name" value="<?=$category_name;?>">
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