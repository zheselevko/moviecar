<?php echo $header; ?>
<div class="container">
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
                <li> <a href="<?php echo $breadcrumb['href']; ?>"> <?php echo $breadcrumb['text']; ?> </a> </li>
            <?php } ?>
        </ul>
	  <h1><?php echo $heading_title; ?></h1>
	  <?php if ($categories) { ?>
	  <p class="brands"><strong><?php echo $text_index; ?></strong>
		<?php foreach ($categories as $category) { ?>
		&nbsp;&nbsp;&nbsp;<a href="index.php?route=product/manufacturer#<?php echo $category['name']; ?>"><?php echo $category['name']; ?></a>
		<?php } ?>
	  </p>
	  <?php foreach ($categories as $category) { ?>
		<div class="manufacturer-list">
		<div class="manufacturer-heading">
			<span id="<?php echo $category['name']; ?>"><?php echo $category['name']; ?></span>
		</div>
	  <?php if ($category['manufacturer']) { ?>
	  <?php foreach (array_chunk($category['manufacturer'], 4) as $manufacturers) { ?>
	  <div class="manufacturer-content">
		<div class="row">
			<?php foreach ($manufacturers as $manufacturer) { ?>
			<div class="col-sm-6"><a href="<?php echo $manufacturer['href']; ?>"><?php echo $manufacturer['name']; ?></a></div>
			<?php } ?>
		</div>
	  </div>
	  <?php } ?>
	  <?php } ?>
	  </div>
	  <?php } ?>
	  <?php } else { ?>
	  <p><?php echo $text_empty; ?></p>
	  <div class="buttons clearfix">
		<div class="pull-right"><a href="<?php echo $continue; ?>" class="btn btn-primary"><?php echo $button_continue; ?></a></div>
	  </div>
	  <?php } ?>
	  <?php echo $content_bottom; ?></div>
	<?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?>

<script>
    (function ($) {
        $('.brands a').click(function (e) {
            e.preventDefault()
            var str = $(this).attr('href');
            $('html, body').animate({
                'scrollTop': $('#' + str.charAt(str.length - 1)).offset().top - ($('#stuck').outerHeight() + 24)
            }, 1000);
            $('#reviews_form_title').addClass('close-tab').parents('#tab-review').find('#reviews_form').slideDown();
        })
    })(jQuery)
</script>