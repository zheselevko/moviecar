<?php echo $header; ?>
<div class="container">
    <?php if ($success) { ?>
        <div class="alert alert-success"><i class="material-design-verification24"></i>  <?php echo $success; ?>
            <button type="button" class="close material-design-close47"></button>
        </div>
    <?php } ?>
    <div class="row"><?php echo $column_left; ?>
        <?php if ($column_left && $column_right) { ?>
            <?php $class = 'col-sm-6'; ?>
        <?php } elseif ($column_left || $column_right) { ?>
            <?php $class = 'col-sm-9'; ?>
        <?php } else { ?>
            <?php $class = 'col-sm-12'; ?>
        <?php } ?>
        <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
            <ul class="breadcrumb">
                <?php foreach ($breadcrumbs as $breadcrumb) { ?>
                    <li>
                        <a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
                    </li>
                <?php } ?>
            </ul>
            <h1 class="no-line"><i class="material-design-favorite22"></i><?php echo $heading_title; ?></h1>

            <div class="cart-wrapper">
                <?php if ($products) { ?>
                    <div class="table-responsive">
                        <table class="table table-bordered table-hover">
                            <thead>
                            <tr>
                                <td class="text-center"><?php echo $column_image; ?></td>
                                <td class="text-left"><?php echo $column_name; ?></td>
                                <td class="text-left"><?php echo $column_model; ?></td>
                                <td class="text-right"><?php echo $column_stock; ?></td>
                                <td class="text-right"><?php echo $column_price; ?></td>
                                <td class="text-right"></td>
                                <td style="width: 0"></td>
                            </tr>
                            </thead>
                            <tbody>
                            <?php foreach ($products as $product) { ?>
                                <tr>
                                    <td class="text-center"><?php if ($product['thumb']) { ?>
                                            <a href="<?php echo $product['href']; ?>"><img
                                                    src="<?php echo $product['thumb']; ?>"
                                                    alt="<?php echo $product['name']; ?>"
                                                    title="<?php echo $product['name']; ?>"/></a>
                                        <?php } ?></td>
                                    <td class="text-left">
                                        <a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
                                    </td>
                                    <td class="text-left"><?php echo $product['model']; ?></td>
                                    <td class="text-right"><?php echo $product['stock']; ?></td>
                                    <td class="text-right"><?php if ($product['price']) { ?>
                                            <div class="price">
                                                <?php if (!$product['special']) { ?>
                                                    <?php echo $product['price']; ?>
                                                <?php } else { ?>
                                                    <b><?php echo $product['special']; ?></b>
                                                    <s><?php echo $product['price']; ?></s>
                                                <?php } ?>
                                            </div>
                                        <?php } ?></td>
                                    <td class="text-center">
                                        <button type="button"
                                                onclick="cart.add('<?php echo $product['product_id']; ?>');"
                                                title="<?php echo $button_cart; ?>" class="product-btn-add"><i
                                                class="material-design-shopping231"></i><span><?php echo $button_cart; ?></span>
                                        </button>
                                    </td>

                                    <td class="text-center" style="width: 0">
                                        <a href="<?php echo $product['remove']; ?>" data-toggle="tooltip"
                                           title="<?php echo $button_remove; ?>" class="cart-remove-btn"><i
                                                class="material-design-rubbish"></i></a>
                                    </td>
                                </tr>
                            <?php } ?>
                            </tbody>
                        </table>
                    </div>
                <?php } else { ?>
                    <p><?php echo $text_empty; ?></p>
                <?php } ?>
                <div class="buttons clearfix">
                    <div class="pull-right">
                        <a href="<?php echo $continue; ?>"
                           class="btn btn-primary checkout"><?php echo $button_continue; ?></a>
                    </div>
                </div>
            </div>
            <?php echo $content_bottom; ?></div>
        <?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?> 