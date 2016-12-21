
<div id="banner<?php echo $module; ?>" class="banners row">
<div class="h1 col-sm-12 center">Категории транспорта</div>	
	<?php foreach ($banners as $banner) { ?>
	<?php if ($banner['link']) { ?>
	<div class="col-sm-4 <?php echo $banner['title']; ?>">
		<div class="banner-box">
			<a class="clearfix" href="<?php echo $banner['link']; ?>">
			<span class="push"></span>
				<?php if ($banner['description']) { ?>
				<div class="s-desc"><?php echo $banner['description']; ?></div>
				<?php } ?>
			</a>
		</div>
	</div>
	<?php } else { ?>
	<div class="col-sm-4 <?php echo $banner['title']; ?>">
		<div class="banner-box">
			<img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" class="img-responsive" />
			<?php if ($banner['description']) { ?>
			<div class="s-desc"><?php echo $banner['description']; ?></div>
			<?php } ?>
		</div>
	</div>
	<?php } ?>
	<?php } ?>

	
</div>
