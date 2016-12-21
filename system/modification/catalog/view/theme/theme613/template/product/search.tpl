<?php echo $header; ?><?php if( ! empty( $mfilter_json ) ) { echo '<div id="mfilter-json" style="display:none">' . base64_encode( $mfilter_json ) . '</div>'; } ?>
<div class="container">
  <div class="row"><?php echo $column_left; ?>
	<?php if ($column_left && $column_right) { ?>
	<?php $class = 'col-sm-6'; ?>
	<?php } elseif ($column_left || $column_right) { ?>
	<?php $class = 'col-sm-9'; ?>
	<?php } else { ?>
	<?php $class = 'col-sm-12'; ?>
	<?php } ?>
	<div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?><div id="mfilter-content-container">
        <ul class="breadcrumb">
            <?php foreach ($breadcrumbs as $breadcrumb) { ?>
                <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
            <?php } ?>
        </ul>
	  <h1><?php echo $heading_title; ?></h1>
	  <label class="control-label" for="input-search"><?php echo $entry_search; ?></label>
	  <div class="row">
		<div class="col-sm-4">
		  <input type="text" name="search" value="<?php echo $search; ?>" placeholder="<?php echo $text_keyword; ?>" id="input-search" class="form-control" />
			<br />
		</div>
		<div class="col-sm-3">
		  <select name="category_id" class="form-control">
			<option value="0"><?php echo $text_category; ?></option>
			<?php foreach ($categories as $category_1) { ?>
			<?php if ($category_1['category_id'] == $category_id) { ?>
			<option value="<?php echo $category_1['category_id']; ?>" selected="selected"><?php echo $category_1['name']; ?></option>
			<?php } else { ?>
			<option value="<?php echo $category_1['category_id']; ?>"><?php echo $category_1['name']; ?></option>
			<?php } ?>
			<?php foreach ($category_1['children'] as $category_2) { ?>
			<?php if ($category_2['category_id'] == $category_id) { ?>
			<option value="<?php echo $category_2['category_id']; ?>" selected="selected">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_2['name']; ?></option>
			<?php } else { ?>
			<option value="<?php echo $category_2['category_id']; ?>">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_2['name']; ?></option>
			<?php } ?>
			<?php foreach ($category_2['children'] as $category_3) { ?>
			<?php if ($category_3['category_id'] == $category_id) { ?>
			<option value="<?php echo $category_3['category_id']; ?>" selected="selected">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_3['name']; ?></option>
			<?php } else { ?>
			<option value="<?php echo $category_3['category_id']; ?>">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_3['name']; ?></option>
			<?php } ?>
			<?php } ?>
			<?php } ?>
			<?php } ?>
		  </select>
			<br />
		</div>
		<div class="col-sm-12 col-lg-3">
		  <label class="checkbox-inline">
			<?php if ($sub_category) { ?>
			<input type="checkbox" name="sub_category" value="1" checked="checked" />
			<?php } else { ?>
			<input type="checkbox" name="sub_category" value="1" />
			<?php } ?>
			<?php echo $text_sub_category; ?></label>
		</div>
	  </div>
	  <p>
		<label class="checkbox-inline">
		  <?php if ($description) { ?>
		  <input type="checkbox" name="description" value="1" id="description" checked="checked" />
		  <?php } else { ?>
		  <input type="checkbox" name="description" value="1" id="description" />
		  <?php } ?>
		  <?php echo $entry_description; ?></label>
	  </p>
	  <input type="button" value="<?php echo $button_search; ?>" id="button-search" class="btn btn-primary" />
	  <h2><?php echo $text_search; ?></h2>
	  <?php if ($products) { ?>
          <div class="product-filter clearfix">
              <div class="product-filter_elem">
                  <div class="button-view">
                      <button type="button" id="list-view" data-toggle="tooltip" title="<?php echo $button_list; ?>"><i class="material-design-view12"></i></button>
                      <button type="button" id="grid-view" data-toggle="tooltip" title="<?php echo $button_grid; ?>"><i class="material-design-two375"></i></button>
                  </div>
              </div>
              <div class="product-filter_elem sort">
                  <label class="control-label" for="input-sort"><?php echo $text_sort; ?></label>
                  <select id="input-sort" class="form-control col-sm-3" onchange="location = this.value;">
                      <?php foreach ($sorts as $sorts) { ?>
                          <?php if ($sorts['value'] == $sort . '-' . $order) { ?>
                              <option value="<?php echo $sorts['href']; ?>" selected="selected"><?php echo $sorts['text']; ?></option>
                          <?php } else { ?>
                              <option value="<?php echo $sorts['href']; ?>"><?php echo $sorts['text']; ?></option>
                          <?php } ?>
                      <?php } ?>
                  </select>
              </div>
              <div class="product-filter_elem show pull-right">
                  <label class="control-label" for="input-limit"><?php echo $text_limit; ?></label>
                  <select id="input-limit" class="form-control" onchange="location = this.value;">
                      <?php foreach ($limits as $limits) { ?>
                          <?php if ($limits['value'] == $limit) { ?>
                              <option value="<?php echo $limits['href']; ?>" selected="selected"><?php echo $limits['text']; ?></option>
                          <?php } else { ?>
                              <option value="<?php echo $limits['href']; ?>"><?php echo $limits['text']; ?></option>
                          <?php } ?>
                      <?php } ?>
                  </select>
              </div>
              <div class="product-filter_elem">
                  <div class="button-view">
                      <a href="<?php echo $compare; ?>" id="compare-total" class="compare-total material-design-shuffle24" data-toggle="tooltip" title="<?php echo $text_compare; ?>"><span><?php echo $text_compare; ?></span>
                      </a>
                  </div>
              </div>


          </div>

	  <div class="row"> 
		<?php foreach ($products as $product) { ?>
            <div class="product-layout product-list col-xs-12">
                <div class="product-thumb transition <?php if ($product['options']) echo 'options';  ?>">
                    <?php if ($product['options']) { ?>
                        <!-- Product options -->
                        <div class="product-option-wrap">
                            <div class="product-options form-horizontal">
                                <div class="options">
                                    <a class="ajax-overlay_close" href='#'></a>
                                    <h3><?php echo $text_option; ?></h3>

                                    <div class="form-group hidden">
                                        <label class="control-label col-sm-4"
                                               for="product_id"></label>

                                        <div class="col-sm-8">
                                            <input type="text"
                                                   name="product_id"
                                                   value="<?php echo $product['product_id'] ?>"
                                                   id="product_id"
                                                   class="form-control"/>
                                        </div>
                                    </div>

                                    <?php foreach ($product['options'] as $option) { ?>
                                        <?php if ($option['type'] == 'select') { ?>
                                            <div
                                                class="form-group<?php echo($option['required'] ? ' required' : ''); ?>">
                                                <label class="control-label col-sm-12"
                                                       for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>

                                                <div class="col-sm-12">
                                                    <select
                                                        name="option[<?php echo $option['product_option_id']; ?>]"
                                                        id="input-option<?php echo $option['product_option_id']; ?>"
                                                        class="form-control">
                                                        <option value=""><?php echo $text_select; ?></option>
                                                        <?php foreach ($option['product_option_value'] as $option_value) { ?>
                                                            <option
                                                                value="<?php echo $option_value['product_option_value_id']; ?>"><?php echo $option_value['name']; ?>
                                                                <?php if ($option_value['price']) { ?>
                                                                    (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                                                                <?php } ?>
                                                            </option>
                                                        <?php } ?>
                                                    </select>
                                                </div>
                                            </div>
                                        <?php } ?>
                                        <?php if ($option['type'] == 'radio') { ?>
                                            <div
                                                class="form-group<?php echo($option['required'] ? ' required' : ''); ?>">
                                                <label
                                                    class="control-label col-sm-12"

                                                    ><?php echo $option['name']; ?></label>

                                                <div class="col-sm-12">
                                                    <div
                                                        id="input-option<?php echo $option['product_option_id']; ?>">
                                                        <?php foreach ($option['product_option_value'] as $option_value) { ?>
                                                            <div class="radio">
                                                                <label
                                                                    for="option[<?php echo $option['product_option_id'] . $option_value['product_option_value_id']; ?>]">
                                                                    <input type="radio" hidden
                                                                           name="option[<?php echo $option['product_option_id']; ?>]"
                                                                           id="option[<?php echo $option['product_option_id'] . $option_value['product_option_value_id']; ?>]"
                                                                           value="<?php echo $option_value['product_option_value_id']; ?>"/>
                                                                    <?php echo $option_value['name']; ?>
                                                                    <?php if ($option_value['price']) { ?>
                                                                        (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                                                                    <?php } ?>
                                                                </label>
                                                            </div>
                                                        <?php } ?>
                                                    </div>
                                                </div>
                                            </div>
                                        <?php } ?>
                                        <?php if ($option['type'] == 'checkbox') { ?>
                                            <div
                                                class="form-group<?php echo($option['required'] ? ' required' : ''); ?>">
                                                <label
                                                    class="control-label col-sm-12
                                                "><?php echo $option['name']; ?></label>

                                                <div class="col-sm-12">
                                                    <div
                                                        id="input-option<?php echo $option['product_option_id']; ?>">
                                                        <?php foreach ($option['product_option_value'] as $option_value) { ?>
                                                            <div class="checkbox">
                                                                <label>
                                                                    <input type="checkbox"
                                                                           name="option[<?php echo $option['product_option_id']; ?>][]"
                                                                           value="<?php echo $option_value['product_option_value_id']; ?>"/>
                                                                    <?php echo $option_value['name']; ?>
                                                                    <?php if ($option_value['price']) { ?>
                                                                        (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                                                                    <?php } ?>
                                                                </label>
                                                            </div>
                                                        <?php } ?>
                                                    </div>
                                                </div>
                                            </div>
                                        <?php } ?>
                                        <?php if ($option['type'] == 'image') { ?>
                                            <div
                                                class="form-group<?php echo($option['required'] ? ' required' : ''); ?>">
                                                <label
                                                    class="control-label col-sm-12
                                                "><?php echo $option['name']; ?></label>

                                                <div class="col-sm-12">
                                                    <div
                                                        id="input-option<?php echo $option['product_option_id']; ?>">
                                                        <?php foreach ($option['product_option_value'] as $option_value) { ?>
                                                            <div class="radio">
                                                                <label>
                                                                    <input type="radio"
                                                                           name="option[<?php echo $option['product_option_id']; ?>]"
                                                                           value="<?php echo $option_value['product_option_value_id']; ?>"/>
                                                                    <img src="<?php echo $option_value['image']; ?>"
                                                                         alt="<?php echo $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>"
                                                                         class="img-thumbnail"/> <?php echo $option_value['name']; ?>
                                                                    <?php if ($option_value['price']) { ?>
                                                                        (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                                                                    <?php } ?>
                                                                </label>
                                                            </div>
                                                        <?php } ?>
                                                    </div>
                                                </div>
                                            </div>
                                        <?php } ?>
                                        <?php if ($option['type'] == 'text') { ?>
                                            <div
                                                class="form-group<?php echo($option['required'] ? ' required' : ''); ?>">
                                                <label class="control-label col-sm-12
                                            "
                                                       for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>

                                                <div class="col-sm-12">
                                                    <input type="text"
                                                           name="option[<?php echo $option['product_option_id']; ?>]"
                                                           value="<?php echo $option['value']; ?>"
                                                           placeholder="<?php echo $option['name']; ?>"
                                                           id="input-option<?php echo $option['product_option_id']; ?>"
                                                           class="form-control"/>
                                                </div>
                                            </div>
                                        <?php } ?>
                                        <?php if ($option['type'] == 'textarea') { ?>
                                            <div
                                                class="form-group<?php echo($option['required'] ? ' required' : ''); ?>">
                                                <label class="control-label col-sm-12
                                            "
                                                       for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>

                                                <div class="col-sm-12">
                                                    <textarea name="option[<?php echo $option['product_option_id']; ?>]"
                                                              rows="5" placeholder="<?php echo $option['name']; ?>"
                                                              id="input-option<?php echo $option['product_option_id']; ?>"
                                                              class="form-control"><?php echo $option['value']; ?></textarea>
                                                </div>
                                            </div>
                                        <?php } ?>
                                        <?php if ($option['type'] == 'file') { ?>
                                            <div
                                                class="form-group<?php echo($option['required'] ? ' required' : ''); ?>">
                                                <label
                                                    class="control-label col-sm-12
                                                "><?php echo $option['name']; ?></label>

                                                <div class="col-sm-12">
                                                    <button type="button"
                                                            id="button-upload<?php echo $option['product_option_id']; ?>"
                                                            data-loading-text="<?php echo $text_loading; ?>"
                                                            class="btn btn-block btn-default"><i
                                                            class="fa fa-upload"></i> <?php echo $button_upload; ?>
                                                    </button>
                                                    <input type="hidden"
                                                           name="option[<?php echo $option['product_option_id']; ?>]"
                                                           value=""
                                                           id="input-option<?php echo $option['product_option_id']; ?>"/>
                                                </div>
                                            </div>
                                        <?php } ?>
                                        <?php if ($option['type'] == 'date') { ?>
                                            <div
                                                class="form-group<?php echo($option['required'] ? ' required' : ''); ?>">
                                                <label class="control-label col-sm-12
                                            "
                                                       for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>

                                                <div class="col-sm-12">
                                                    <div class="input-group date">
                                                        <input type="text"
                                                               name="option[<?php echo $option['product_option_id']; ?>]"
                                                               value="<?php echo $option['value']; ?>"
                                                               data-date-format="YYYY-MM-DD"
                                                               id="input-option<?php echo $option['product_option_id']; ?>"
                                                               class="form-control"/>
											<span class="input-group-btn">
												<button class="btn btn-default" type="button"><i
                                                        class="fa fa-calendar"></i></button>
											</span>
                                                    </div>
                                                </div>
                                            </div>
                                        <?php } ?>
                                        <?php if ($option['type'] == 'datetime') { ?>
                                            <div
                                                class="form-group<?php echo($option['required'] ? ' required' : ''); ?>">
                                                <label class="control-label col-sm-12
                                            "
                                                       for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>

                                                <div class="col-sm-12">
                                                    <div class="input-group datetime">
                                                        <input type="text"
                                                               name="option[<?php echo $option['product_option_id']; ?>]"
                                                               value="<?php echo $option['value']; ?>"
                                                               data-date-format="YYYY-MM-DD HH:mm"
                                                               id="input-option<?php echo $option['product_option_id']; ?>"
                                                               class="form-control"/>
									<span class="input-group-btn">
									<button type="button" class="btn btn-default"><i class="fa fa-calendar"></i>
                                    </button>
									</span></div>
                                                </div>
                                            </div>
                                        <?php } ?>
                                        <?php if ($option['type'] == 'time') { ?>
                                            <div
                                                class="form-group<?php echo($option['required'] ? ' required' : ''); ?>">
                                                <label class="control-label col-sm-12
                                            "
                                                       for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>

                                                <div class="col-sm-12">
                                                    <div class="input-group time">
                                                        <input type="text"
                                                               name="option[<?php echo $option['product_option_id']; ?>]"
                                                               value="<?php echo $option['value']; ?>"
                                                               data-date-format="HH:mm"
                                                               id="input-option<?php echo $option['product_option_id']; ?>"
                                                               class="form-control"/>
									<span class="input-group-btn">
									<button type="button" class="btn btn-default"><i class="fa fa-calendar"></i>
                                    </button>
									</span></div>
                                                </div>
                                            </div>
                                        <?php } ?>
                                    <?php } ?>
                                    <button class="product-btn-add" type="button"
                                            onclick="cart.addPopup($(this),'<?php echo $product['product_id']; ?>');">
                                        <span><?php echo $button_cart; ?></span>
                                    </button>
                                </div>
                            </div>
                        </div>
                    <?php } ?>
                    <div class="image">
                        <a class="lazy" style="padding-bottom: <?php echo ($product['img-height']/$product['img-width']*100); ?>%"
                           href="<?php echo $product['href']; ?>">
                            <img alt="<?php echo $product['name']; ?>"
                                 title="<?php echo $product['name']; ?>"
                                 class="img-responsive"
                                 data-src="<?php echo $product['thumb']; ?>"
                                 src="#"/>
                        </a>
                    </div>
                    <div class="caption">
                        <?php if ($product['price']) { ?>
                            <div class="price price-product">
                                <?php if (!$product['special']) { ?>
                                    <?php echo $product['price']; ?>
                                <?php } else { ?>
                                    <span class="price-new"><?php echo $product['special']; ?></span> <span class="price-old"><?php echo $product['price']; ?></span>
                                <?php } ?>
                                <?php if ($product['tax']) { ?>
                                    <span class="price-tax"><?php echo $text_tax; ?> <?php echo $product['tax']; ?></span>
                                <?php } ?>
                            </div>
                        <?php } ?>

                        <div class="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></div>
                        <div class="description"><?php echo $product['description']; ?></div>

                        <?php if ($product['rating']) { ?>
                            <div class="rating">
                                <?php for ($i = 1; $i <= 5; $i++) { ?>
                                    <?php if ($product['rating'] < $i) { ?>
                                        <span class="fa-stack"><i
                                                class="material-icons-star fa-stack-1x"></i></span>
                                    <?php } else { ?>
                                        <span class="fa-stack"><i
                                                class="material-icons-star   fa-stack-1x"></i>
                                                <i class="material-icons-star star  fa-stack-1x"></i></span>
                                    <?php } ?>
                                <?php } ?>
                            </div>
                        <?php } ?>
                    </div>
                    <div class="aside">
                        <?php if ($product['price']) { ?>
                            <div class="price price-product">
                                <?php if (!$product['special']) { ?>
                                    <?php echo $product['price']; ?>
                                <?php } else { ?>
                                    <span class="price-new"><?php echo $product['special']; ?></span> <span class="price-old"><?php echo $product['price']; ?></span>
                                <?php } ?>
                                <?php if ($product['tax']) { ?>
                                    <span class="price-tax"><?php echo $text_tax; ?> <?php echo $product['tax']; ?></span>
                                <?php } ?>
                            </div>
                        <?php } ?>
                        <div class="cart-button">
                            <button class="product-btn-add" type="button" data-toggle="tooltip" title="<?php echo $button_cart; ?>"
                                    onclick="ajaxAdd($(this),<?php echo $product['product_id'] ?>);">
                                <i class="material-icons-add_shopping_cart"></i>
                            </button>
                            <button class="product-btn" type="button" data-toggle="tooltip"
                                    title="<?php echo $button_wishlist; ?>"
                                    onclick="wishlist.add('<?php echo $product['product_id']; ?>');"><i
                                    class="material-icons-favorite_border"></i></button>
                            <button class="product-btn" type="button" data-toggle="tooltip"
                                    title="<?php echo $button_compare; ?>"
                                    onclick="compare.add('<?php echo $product['product_id']; ?>');"><i
                                    class="material-icons-equalizer"></i></button>
                        </div>
                    </div>
                </div>
                <div class="clear"></div>
            </div>
		<?php } ?>
	  </div>
	  <div class="row">
		<div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
		<div class="col-sm-6 text-right"><?php echo $results; ?></div>
	  </div>
	  <?php } else { ?>
	  <p><?php echo $text_empty; ?></p>
	  <?php } ?>
	  </div><?php echo $content_bottom; ?></div>
	<?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?> 
<script type="text/javascript"><!--
$('#button-search').bind('click', function() {
	url = 'index.php?route=product/search';
	
	var search = $('#content input[name=\'search\']').prop('value');
	
	if (search) {
		url += '&search=' + encodeURIComponent(search);
	}

	var category_id = $('#content select[name=\'category_id\']').prop('value');
	
	if (category_id > 0) {
		url += '&category_id=' + encodeURIComponent(category_id);
	}
	
	var sub_category = $('#content input[name=\'sub_category\']:checked').prop('value');
	
	if (sub_category) {
		url += '&sub_category=true';
	}
		
	var filter_description = $('#content input[name=\'description\']:checked').prop('value');
	
	if (filter_description) {
		url += '&description=true';
	}

	location = url;
});

$('#content input[name=\'search\']').bind('keydown', function(e) {
	if (e.keyCode == 13) {
		$('#button-search').trigger('click');
	}
});

$('select[name=\'category_id\']').on('change', function() {
	if (this.value == '0') {
		$('input[name=\'sub_category\']').prop('disabled', true);
	} else {
		$('input[name=\'sub_category\']').prop('disabled', false);
	}
});

$('select[name=\'category_id\']').trigger('change');
--></script>