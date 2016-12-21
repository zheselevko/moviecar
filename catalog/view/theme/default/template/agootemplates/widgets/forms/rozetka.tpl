<?php if ($comment_status) {  ?>
<div id="cmswidget-<?php echo $cmswidget; ?>" class="cmswidget cmswidget-treecomments" data-prefix="<?php echo $prefix;?>">
<?php echo $box_begin; ?>
<div class="cmswidget-new-<?php echo $cmswidget; ?>">
	<div class="container_reviews cmswidget" id="<?php echo $prefix;?>container_reviews_<?php echo $mark;?>_<?php echo $mark_id;?>">
		<noindex>
			<div class="container_reviews_vars acr<?php echo $cmswidget; ?>" style="display: none">
				<div class="mark" data-text="<?php echo $mark; ?>"></div>
				<div class="mark_id" data-text="<?php echo $mark_id; ?>"></div>
				<div class="theme" data-text="<?php echo $theme; ?>"></div>
				<div class="exec" data-text="<?php if (isset($settings_widget['handler']) && $settings_widget['handler']!='') { echo $settings_widget['handler']; }  ?>"></div>
				<div class="visual_editor" data-text="<?php echo $visual_editor; ?>"></div>
				<div class="ascp_widgets_position" data-text="<?php echo $ascp_widgets_position;?>"></div>
				<div class="settingswidget" data-text="<?php echo base64_encode(serialize($settingswidget)); ?>"></div>
				<div class="text_wait" data-text="<?php echo $text_wait; ?>"></div>
				<div class="visual_rating" data-text="<?php echo $settings_widget['visual_rating']; ?>"></div>
				<div class="signer" data-text="<?php echo $settings_widget['signer']; ?>"></div>
				<div class="imagebox" data-text="<?php echo $imagebox; ?>"></div>
				<div class="prefix" data-text="<?php echo $prefix;?>"></div>
			</div>
  		</noindex>

		<?php if (isset($settings_widget['visual_editor']) && $settings_widget['visual_editor']) { ?>
				<script>
					if (typeof WBBLANG !=="undefined"){
					CURLANG = WBBLANG['<?php echo $lang_code;?>'] || WBBLANG['en'] || CURLANG;
					}
				</script>
		<?php } ?>
		<?php if (isset($settings_widget['signer']) && $settings_widget['signer']) { ?>
		<div id="<?php echo $prefix;?>record_signer" class="floatright width70 textright" style="position:relative;">
			<div id="<?php echo $prefix;?>js_signer"  class="width100 zindex11000 textleft" style="display:none; position: absolute;"></div>
			<form id="<?php echo $prefix;?>form_signer">
				<label class="floatright">
				<a class="textdecoration_none comments_signer hrefajax" data-cmswidget="<?php echo $cmswidget; ?>">
				<?php if (SC_VERSION > 15) { ?><i class="fa fa-envelope" aria-hidden="true"></i><?php } ?>

				<?php echo $text_signer; ?>
				</a>
				<input id="<?php echo $prefix;?>comments_signer" class="comments_signer" data-cmswidget="<?php echo $cmswidget; ?>" type="checkbox" <?php if (isset($signer_status) && $signer_status) echo 'checked'; ?>/>

				</label>
			</form>
		</div>
		<?php } ?>


		<a class="textdecoration_none leavereview-<?php echo $cmswidget; ?>" href="<?php echo $href; ?>#<?php echo $prefix;?>comment-title"><ins class="hrefajax textdecoration_none"><?php echo $text_write_review; ?><?php if (SC_VERSION > 15) { ?>&nbsp;<i class="fa fa-reply" aria-hidden="true"></i><?php } ?>&nbsp;&darr;</ins></a>

		<div class="width100 overflowhidden lineheight1">&nbsp;</div>


		<div id="<?php echo $prefix;?>div_comment_<?php echo $mark_id; ?>" >

			<div id="<?php echo $prefix;?>comment_<?php echo $mark_id; ?>" >
				<?php  echo $html_comment; ?>
			</div>

			<div id="<?php echo $prefix;?>comment-title">
				<a href="#"  id="<?php echo $prefix;?>comment_id_reply_0" data-cmswidget="<?php echo $cmswidget; ?>" data-prefix="<?php echo $prefix;?>" class="comment_reply comment_buttons form_reply">
				<ins id="<?php echo $prefix;?>reply_0" class="hrefajax text_write_review"><?php echo $text_write; ?></ins>
				</a>
			</div>



			<div id="<?php echo $prefix;?>comment_work_0" class="<?php echo $prefix;?>comment_work"></div>

			<div id="<?php echo $prefix;?>reply_comments" class="<?php echo $prefix;?>comment_form comment_form" data-prefix="<?php echo $prefix;?>" style="display:none">
				<div id="<?php echo $prefix;?>comment_work_" class="<?php echo $prefix;?>form_customer_pointer width100 margintop10">


					<?php if (isset($customer_id) && !$customer_id)   { ?>

					<div id="form_customer_none" style="display:none;"></div>




					<div class="form_customer <?php echo $prefix;?>form_customer" id="<?php echo $prefix;?>form_customer" style="display:none;">



						<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
							<div class="form_customer_content">
								<a href="#" class="floatright hrefajax"  onclick="$('.<?php echo $prefix;?>form_customer').hide(); $('.sc-auth').hide(); return false;"><?php echo $hide_block; ?></a>

								<div class="floatleft sc-auth-left">
									<b><?php echo $entry_email; ?></b><br />
									<input type="text" name="email" class="form-control sc-form-control" value="<?php echo $email; ?>" />
									<br />
									<b><?php echo $entry_password; ?></b><br />
									<input type="password" name="password" class="form-control sc-form-control" value="<?php echo $password; ?>" />
									<br />
									<a href="<?php echo $forgotten; ?>"><?php echo $text_forgotten; ?></a>
									<br />
									<input type="submit" value="<?php echo $button_login; ?>" class="button btn btn-primary" />
									<a href="<?php echo $register; ?>" class="marginleft10"><?php echo $error_register; ?></a>
									<?php if ($redirect) { ?>
									<input type="hidden" name="redirect" value="<?php echo $redirect; ?>#tabs" />
									<?php } ?>
								</div>
                                <div class="floatleft sc-auth" style="display:none;"></div>
							</div>
						</form>

					</div>
					<?php } ?>

					<form id="<?php echo $prefix;?>form_work_">
						<div class="seocmspro_customer_name width100 overflowhidden" <?php  if (isset($settings_widget['name_status']) && !$settings_widget['name_status'])   {   ?>style="display: none;"<?php } ?>>
						  <?php if (isset($settings_widget['avatar_status']) && $settings_widget['avatar_status']) { ?>
						  <div class="seocmspro_load_avatar seocmspro_avatar"><img src="<?php echo $avatar_customer; ?>" alt="avatar" style="width:<?php echo $avatar_width; ?>px ; height:<?php echo $avatar_height; ?>px ; "></div>
						  <?php } ?>
						<div class="seocmspro_author" <?php  if (isset($settings_widget['name_status']) && !$settings_widget['name_status'])   {   ?>style="display: none;"<?php } ?>>
						<b><ins class="color_entry_name"><?php   echo $entry_name; ?></ins></b>
						<br>
						<input type="text" name="name" class="form-control sc-form-control" onblur="if (this.value==''){this.value='<?php echo $text_login; ?>'}" onfocus="if (this.value=='<?php echo $text_login; ?>') this.value='';"  value="<?php echo $text_login; ?>" <?php
							if (isset($customer_id) && $customer_id) {
							 //echo 'readonly="readonly" style="background-color:#DDD; color: #555;"';
							}
							?>>

						<?php  if (isset($customer_id) && !$customer_id)   { ?>
						<div class="asc_textlogin">
						<a href="#" class="textdecoration_none hrefajax" data-cmswidget="<?php echo $cmswidget; ?>" data-prefix="<?php echo $prefix; ?>"><ins class="hrefajax customer_enter customer_auth" data-prefix="<?php echo $prefix; ?>" data-cmswidget="<?php echo $cmswidget; ?>"><?php echo $text_customer_enter; ?></ins></a>
						<?php echo $text_welcome; ?>
						</div>
						<?php } ?>

                         </div>
						</div>
						<div class=" bordernone width100 overflowhidden margintop5 lineheight1"></div>

						<?php include(realpath(dirname(__FILE__)).'/../../module/fields.tpl'); ?>

						<?php  if (isset($settings_widget['comment_must']) && $settings_widget['comment_must'])   {   ?>
							<b><ins class="color_entry_name"><?php echo $entry_comment;  ?></ins></b>
							<span class="blog_require">*</span>

							<div class="ascp_bbode">
								<textarea name="text" id="<?php echo $prefix;?>editor_" class="blog-record-textarea <?php echo $prefix;?>editor blog-textarea_height"></textarea>
							</div>

	                        <?php if (isset($settings_widget['help_view']) && $settings_widget['help_view']) { ?>
							<div class="help_text">
							<span class="text_note"><?php echo $text_note; ?></span>
							</div>
							<?php  } ?>
						<?php  } ?>

						<div class="bordernone width100 overflowhidden margintop5 lineheight1"></div>
						<?php if (isset($settings_widget['rating']) && $settings_widget['rating']) { ?>
						<b><ins class="color_entry_name"><?php echo $entry_rating_review; ?></ins></b>&nbsp;&nbsp;
						<?php if (isset($settings_widget['visual_rating']) && $settings_widget['visual_rating']) { ?>
						<div style="height: 25px;">
							<input type="radio" class="visual_star" name="rating" title="<?php echo $entry_bad; ?> 1" value="1" >
							<input type="radio" class="visual_star" name="rating" title="<?php echo $entry_bad; ?> 2" value="2" >
							<input type="radio" class="visual_star" name="rating" title="<?php echo $entry_bad; ?> 3" value="3" >
							<input type="radio" class="visual_star" name="rating" title="<?php echo $entry_good; ?> 4" value="4" >
							<input type="radio" class="visual_star" name="rating" title="<?php echo $entry_good; ?> 5" value="5" >
							<div class="floatleft"  style="padding-top: 5px; "><b><ins class="color_entry_name marginleft10"><span id="hover-test" ></span></ins></b></div>
							<div  class="bordernone width100 overflowhidden lineheight1"></div>
						</div>
						<?php } else { ?>
						<span><ins class="color_bad"><?php echo $entry_bad; ?></ins></span>&nbsp;
						<input type="radio"  name="rating" value="1" >
						<ins class="blog-ins_rating" style="">1</ins>
						<input type="radio"  name="rating" value="2" >
						<ins class="blog-ins_rating" >2</ins>
						<input type="radio"  name="rating" value="3" >
						<ins class="blog-ins_rating" >3</ins>
						<input type="radio"  name="rating" value="4" >
						<ins class="blog-ins_rating" >4</ins>
						<input type="radio"  name="rating" value="5" >
						<ins class="blog-ins_rating" >5</ins>
						&nbsp;&nbsp; <span><ins  class="color_good"><?php echo $entry_good; ?></ins></span>
						<?php } ?>
						<?php } else {?>
						<input type="radio" name="rating" value="5" checked style="display:none;">
						<?php } ?>
						<div class="bordernone width100 overflowhidden margintop5 lineheight1"></div>
						<?php if ($captcha_status) { ?>
						<?php if (isset($settings_widget['help_view']) && $settings_widget['help_view']) { ?>
						<div class="ascp_captcha_title help_text"><?php echo $entry_captcha_title; ?>&nbsp;&darr;</div>
						<div class="ascp_entry_captcha help_text"><?php echo $entry_captcha; ?></div>
                        <?php  } ?>
						<div class="captcha_status"></div>
						<?php  } ?>

						<?php if (isset($settings_widget['signer_answer']) && $settings_widget['signer_answer']) { ?>

                		<?php if (isset($settings_widget['signer_answer_require']) && $settings_widget['signer_answer_require']) { ?>
                		<span class="blog_require">*</span>
                		<?php } ?>

                          <?php if (isset($customer_id) && $customer_id) { ?>

							<label for="signer_answer">
							<a class="textdecoration_none hrefajax" data-cmswidget="<?php echo $cmswidget; ?>">
							<input id="signer_answer" name="signer_answer"  class="sc-form-control" data-cmswidget="<?php echo $cmswidget; ?>" type="checkbox" checked/>

							<?php echo $text_signer_answer; ?>
                           </a>
                            </label>
                		<?php } else { ?>

                		<label>
                		<b><?php echo $text_signer_answer; ?></b>
                		</label>
						   <?php echo $text_signer_answer_email; ?>
						   <input type="text" name="email_ghost" class="form-control sc-form-control" value="<?php if (isset($email_ghost) && $email_ghost!='') echo $email_ghost; ?>" />
						<?php } ?>
						<?php } ?>

						<?php if (SC_VERSION < 20) { ?>
							<div class="buttons">
								<div class="left"><a class="button button-comment" id="<?php echo $prefix;?>button-comment-0"><span><?php echo $button_write; ?></span></a></div>
							</div>
						<?php } else { ?>
				   			<div class="buttons">
				                <button type="button" id="<?php echo $prefix;?>button-comment-0" data-loading-text="" class="btn btn-primary button button-comment"><i class="fa fa-pencil-square-o"></i> <?php echo $button_write; ?></button>
				             </div>
						<?php } ?>

   					</form>
				</div>
			</div>
		</div>

		<div class="overflowhidden">&nbsp;</div>
	</div>
</div>
<?php echo $box_end; ?>
</div>

<script>


comment_form_<?php echo $prefix;?> = $('#<?php echo $prefix;?>reply_comments').clone();
$('#<?php echo $prefix;?>reply_comments').remove();

if (typeof tab_select == "undefined") {
	var tab_select = new Array();
}

tab_select[<?php echo $cmswidget; ?>] = '#tab-html-<?php echo $cmswidget; ?>';
</script>


<script>
<?php if (isset($settings_widget['doc_ready']) && $settings_widget['doc_ready']) { ?>
$(document).ready(function(){
<?php } ?>

		<?php if (isset($settings_widget['anchor']) && $settings_widget['anchor']!='') { ?>

			url = location.href, idx_<?php echo $cmswidget; ?> = url.indexOf("#")
			hash_<?php echo $cmswidget; ?> = idx_<?php echo $cmswidget; ?> != -1 ? url.substring(idx_<?php echo $cmswidget; ?>+1) : "";
			var idx_comment_<?php echo $cmswidget; ?> =  hash_<?php echo $cmswidget; ?>.lastIndexOf("_");
			hash_cmswidget_<?php echo $cmswidget; ?> = idx_comment_<?php echo $cmswidget; ?> != -1 ? hash_<?php echo $cmswidget; ?>.substring(idx_comment_<?php echo $cmswidget; ?>+1) : "";
		    offset_diff_<?php echo $cmswidget; ?> = '';
		    offset_top_tab_<?php echo $cmswidget; ?> = '';
		    offset_top_<?php echo $cmswidget; ?> = ''

			if (hash_<?php echo $cmswidget; ?>!='') {
				if (hash_cmswidget_<?php echo $cmswidget; ?> == '<?php echo $cmswidget; ?>') {
					if ($('#'+hash_<?php echo $cmswidget; ?>).length) {
			 	       offset_diff_<?php echo $cmswidget; ?> =  ($('#'+hash_<?php echo $cmswidget; ?>).offset().top) - ($('#cmswidget-<?php echo $cmswidget; ?>').offset().top)
			       }
		  		}
			}

		    var prefix = '<?php echo $prefix;?>';
            var cmswidget = '<?php echo $cmswidget; ?>';
			var heading_title = '<?php echo $heading_title; ?>';
			var total = '<?php echo $comment_total; ?>';

			<?php  if (isset($mark_info['url'])) { ?>
			var name = '<?php if (isset($mark_info['name'])) echo htmlspecialchars($mark_info['name'], ENT_QUOTES & ~ENT_COMPAT, 'UTF-8');  ?>';
			var url = '<?php if (isset($mark_info['url'])) echo $mark_info['url']; ?>';
			<?php } ?>

			<?php  if (isset($mark_info['product_info']['url'])) { ?>
			var product_name = '<?php if (isset($mark_info['product_info']['name'])) echo htmlspecialchars($mark_info['product_info']['name'], ENT_QUOTES & ~ENT_COMPAT, 'UTF-8'); ?>';
			var product_url = '<?php if (isset($mark_info['product_info']['url'])) echo $mark_info['product_info']['url']; ?>';
			<?php } ?>

			var data = $('#cmswidget-<?php echo $cmswidget; ?>').html($('#cmswidget-<?php echo $cmswidget; ?>').clone());

			<?php echo $settings_widget['anchor']; ?>;

			$('.cmswidget-new-<?php echo $cmswidget; ?>').attr('id', 'cmswidget-<?php echo $cmswidget; ?>');
			delete data;
			delete prefix;
			delete cmswidget;
			delete total;

			<?php  if (isset($mark_info['product_info']['url'])) { ?>
			delete product_name;
			delete product_url;
			<?php } ?>

			<?php  if (isset($mark_info['url'])) { ?>
			delete name;
			delete url;
			<?php } ?>

			if ($('a[href=\''+tab_select[<?php echo $cmswidget; ?>]+'\']').length) {
			    offset_top_tab_<?php echo $cmswidget; ?> = $('a[href=\''+tab_select[<?php echo $cmswidget; ?>]+'\']').offset().top;
			}
            if (offset_top_tab_<?php echo $cmswidget; ?>!='' && offset_diff_<?php echo $cmswidget; ?>!='') {
            	offset_top_<?php echo $cmswidget; ?> = (offset_top_tab_<?php echo $cmswidget; ?>) + (offset_diff_<?php echo $cmswidget; ?>);
            }

	   <?php  } else { ?>
		   hash_cmswidget_<?php echo $cmswidget; ?> = '<?php echo $cmswidget; ?>';
	   <?php } ?>



<?php if (isset($settings_widget['doc_ready']) && $settings_widget['doc_ready']) { ?>
});
<?php } ?>

$(document).ready(function(){
 $('#<?php echo $prefix;?>comment_id_reply_0').click();
});

$(window).load(function() {

<?php
  if (isset($settings_general['get_pagination']))
	$get_pagination = $settings_general['get_pagination'];
  else
	$get_pagination = 'tracking';
?>

    if (typeof offset_top_<?php echo $cmswidget; ?> != "undefined" && offset_top_<?php echo $cmswidget; ?> != '') {
    	switch_tab_<?php echo $cmswidget; ?> = true;
    }  else {
    	switch_tab_<?php echo $cmswidget; ?> = false;
    }


	<?php if (isset($request->get[$get_pagination])) { ?>
				offset_top_<?php echo $cmswidget; ?> = offset_top_tab_<?php echo $cmswidget; ?>;
				hash_cmswidget_<?php echo $cmswidget; ?> = '<?php echo $cmswidget; ?>';
				switch_tab_<?php echo $cmswidget; ?> = true;
	<?php  } ?>

	if (hash_cmswidget_<?php echo $cmswidget; ?> == '<?php echo $request_get['cmswidget']; ?>' && switch_tab_<?php echo $cmswidget; ?>) {
		$('a[href=\''+tab_select[<?php echo $cmswidget; ?>]+'\']').trigger('click');
		if (offset_top_<?php echo $cmswidget; ?>!='') {
		    $('html, body').animate({scrollTop: offset_top_<?php echo $cmswidget; ?>}, 500, function() {});
		}
	}

});

</script>

<script>
<?php $tab_review = sprintf($tab_review, $comment_total); ?>
$(document).ready(function(){

	if (tab_select[<?php echo $cmswidget; ?>] == '#tab-html-<?php echo $cmswidget; ?>') {
		title_tab_<?php echo $cmswidget; ?> = $('a[href=\''+tab_select[<?php echo $cmswidget; ?>]+'\']').html();
		$('a[href=\''+tab_select[<?php echo $cmswidget; ?>]+'\']').html(title_tab_<?php echo $cmswidget; ?> + ' (<?php echo $comment_total; ?>)');
	}

	<?php if ($comment_total < 1) { ?>
	$('.leavereview-<?php echo $cmswidget; ?>').hide();
	<?php } ?>

});
</script>
<?php } ?>
<?php if (isset($settings_widget['reserved']) && $settings_widget['reserved']!='') {
echo html_entity_decode($settings_widget['reserved'], ENT_QUOTES, 'UTF-8');
} ?>
