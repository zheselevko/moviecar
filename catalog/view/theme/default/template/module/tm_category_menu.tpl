<div class="box category col-sm-3">
	<div class="box-heading"><h3><?php echo $heading_title; ?></h3></div>
	<div class="box-content">
		<div class="box-category">
		<ul class="list-unstyled category_menu">
		<?php $i = 0; foreach ($categories as $category) { ?>
		<?php if ($category['children']) { ?>
		<li>
			<a class="children" href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a>
			  <?php foreach (array_chunk($category['children'], ceil(count($category['children']) )) as $children) { ?>
			  <ul style="<?php if ($images[$i]) {?> background-image: url(<?php echo $images[$i]['src'];?>)" <?php }?>>

				<?php foreach ($children as $child) {?>
						<li>
							<strong><a href="<?php echo $child['href']; ?>"><?php echo $child['name']; ?></a></strong>
								<?php if ($child['products']) { ?>
									<ul>
										<?php foreach ($child['products'] as $product) { ?>
											<li><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></li>
										<?php } ?>
									</ul>
								<?php } ?>
						</li>
				<?php }
                ($i < count($images) - 1 ? $i++ : $i=0 ) ?>

			  </ul>
			  <?php } ?>
		</li>
		<?php } else { ?>
		<li><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a></li>
		<?php } ?>
		<?php } ?>
		</ul>
	</div>
</div>
</div>

