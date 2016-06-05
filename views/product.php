<div class="container">
    <div class="row">
        <div class="col-lg-12 text-center">
            <h3>GET /v1/product/<?=$id_product;?></h3>
            <hr class="star-primary">
        </div>
    </div>
    <div class="row detail">
        <h3>Parameter</h3>
        <strong>HTTP_HEADER</strong></br>
        token : <?=$token;?>
        <h3>Response</h3>
        <pre><?=print_r($response,true);?></pre>
        ok, you got product detail and variants right now<br/>
        now search anything you want by fill the form bellow, trust me it's works<br/>
        <form class="form-horizontal" method='post' action='/tester/product_search'>
            <div class="form-group">
                <label class="control-label col-sm-2">Color</label>
                <div class="col-sm-10">
                    <input type="text" name="color" class="form-control" placeholder="black,white,red,etc">
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-sm-2">Size</label>
                <div class="col-sm-10">
                    <input type="text" name="size" class="form-control" placeholder="black,white,red,etc">
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-sm-2">Price Range</label>
                <div class="col-sm-10">
                    <div class="row">
                        <div class="col-sm-5">
                            <input type="text" name="price_min" class="form-control" placeholder="Minimum Price ex. 100000">
                        </div>
                        <div class="col-sm-2 text-center">
                            To
                        </div>
                        <div class="col-sm-5">
                            <input type="text" name="price_max" class="form-control" placeholder="Maximum Price ex. 200000">
                        </div>
                    </div>
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