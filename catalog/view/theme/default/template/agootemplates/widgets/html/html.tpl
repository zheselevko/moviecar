<?php if ((isset($html) && $html!='' )
			|| (isset($html_modal) && $html_modal!='')
			|| (isset($settings_widget['reserved']) && $settings_widget['reserved']!='')
			|| (isset($settings_widget['box_begin']) && $settings_widget['box_begin']!='')
			|| (isset($settings_widget['box_end']) && $settings_widget['box_end']!='')
			|| (isset($settings_widget['search']) && $settings_widget['search'])
		  ) { ?>
<div id="cmswidget-<?php echo $cmswidget; ?>" class="cmswidget">
	<?php echo $box_begin; ?>
	<?php if (isset($settings_widget['modal_status']) && $settings_widget['modal_status']) { ?>
	<a href="#" onclick="modal_html_<?php echo $cmswidget; ?>(); return false;" class="<?php if (isset($settings_widget['modal_a_class']) && $settings_widget['modal_a_class']!='') { echo $settings_widget['modal_a_class']; } ?>"><?php
    if (isset($html_modal) && $html_modal!='') {    	echo $html_modal;
    } else {
		echo $heading_title;
	}
	?></a>
	<?php } ?>
    <section id="cmswidget-section-<?php echo $cmswidget; ?>" <?php if (isset($settings_widget['modal_status']) && $settings_widget['modal_status']) { ?>style="display: none;"<?php } ?>>
		<?php
		if (isset($settings_widget['search']) && $settings_widget['search']) {
			include(realpath(dirname(__FILE__)).'/../../module/search.tpl');
		}
		?>
		<?php echo $html; ?>
		<?php if (isset($settings_widget['reserved']) && $settings_widget['reserved']!='') {  echo html_entity_decode($settings_widget['reserved'], ENT_QUOTES, 'UTF-8'); } ?>
	</section>
	<?php echo $box_end; ?>
</div>

<?php if (isset($settings_widget['modal_status']) && $settings_widget['modal_status']) { ?>
<script>
modal_html_<?php echo $cmswidget; ?> = function() {
	<?php if ($imagebox == 'colorbox') { ?>

	$.colorbox.close();
	var html_<?php echo $cmswidget; ?> = $('#cmswidget-section-<?php echo $cmswidget; ?>');
	// var colorboxInterval;
	// var colorboxtimeout;

	$.colorbox({
<?php if (isset($settings_widget['modal_cb_width']) && $settings_widget['modal_cb_width']!='') { ?>
		 width: "<?php echo $settings_widget['modal_cb_width']; ?>",
<?php } ?>
<?php if (isset($settings_widget['modal_cb_height']) && $settings_widget['modal_cb_height']!='') { ?>
		 height: "<?php echo $settings_widget['modal_cb_height']; ?>",
<?php } ?>

<?php if (isset($settings_widget['modal_cb_maxwidth']) && $settings_widget['modal_cb_maxwidth']!='') { ?>
		 maxWidtht: "<?php echo $settings_widget['modal_cb_maxwidth']; ?>",
<?php } ?>
<?php if (isset($settings_widget['modal_cb_maxheight']) && $settings_widget['modal_cb_maxheight']!='') { ?>
		 maxHeight: "<?php echo $settings_widget['modal_cb_maxheight']; ?>",
<?php } ?>

<?php if (isset($settings_widget['modal_cb_innerwidth']) && $settings_widget['modal_cb_innerwidth']!='') { ?>
		 innerWidth: "<?php echo $settings_widget['modal_cb_innerwidth']; ?>",
<?php } ?>
<?php if (isset($settings_widget['modal_cb_innerheight']) && $settings_widget['modal_cb_innerheight']!='') { ?>
		 innerHeight: "<?php echo $settings_widget['modal_cb_innerheight']; ?>",
<?php } ?>

<?php if (isset($settings_widget['modal_cb_initialwidth']) && $settings_widget['modal_cb_initialwidth']!='') { ?>
		 initialWidth: "<?php echo $settings_widget['modal_cb_initialwidth']; ?>",
<?php } ?>
<?php if (isset($settings_widget['modal_cb_initialheight']) && $settings_widget['modal_cb_initialheight']!='') { ?>
		 initialHeight: "<?php echo $settings_widget['modal_cb_initialheight']; ?>",
<?php } ?>

<?php if (isset($settings_widget['modal_cb_opacity']) && $settings_widget['modal_cb_opacity']!='') { ?>
		 opacity: "<?php echo $settings_widget['modal_cb_opacity']; ?>",
<?php } ?>

<?php if (isset($settings_widget['modal_cb_scrolling']) && $settings_widget['modal_cb_scrolling']) { ?>
		 scrolling: true,
<?php } else { ?>
         scrolling: false,
<?php } ?>

<?php if (isset($settings_widget['modal_cb_reposition']) && $settings_widget['modal_cb_reposition']) { ?>
		 reposition: true,
<?php } else { ?>
         reposition: false,
<?php } ?>

<?php if (isset($settings_widget['modal_cb_fixed']) && $settings_widget['modal_cb_fixed']) { ?>
		 fixed: true,
<?php } else { ?>
         fixed: false,
<?php } ?>

		 onOpen: function(){
		 },
		 onLoad: function(){		 	html_<?php echo $cmswidget; ?>.show();		 },
	     onComplete: function () {

<?php if (isset($settings_widget['modal_cbmobile_width_browser']) && $settings_widget['modal_cbmobile_width_browser']!='') { ?>
			 cbmobile_resize();
<?php } ?>

<?php if (isset($settings_widget['modal_cb_resize']) && $settings_widget['modal_cb_resize']) { ?>
		 	$(this).colorbox.resize();
<?php } ?>

			// colorboxInterval = setInterval( function() { }, 2000 );
         },
		 onClosed: function(){
			// clearInterval(colorboxtimeout);
			html_<?php echo $cmswidget; ?>.hide();
		 },

<?php if (isset($settings_widget['modal_cb_title']) && $settings_widget['modal_cb_title']) { ?>
		 title: "<?php echo $heading_title; ?>",
<?php } ?>

		 inline: true,
		 href: html_<?php echo $cmswidget; ?>
	 });

	 return false;
    <?php } ?>
}


$(window).resize(function(){
	cbmobile_resize();
});


function cbmobile_resize() {
var isMobile = false;

if( /Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(navigator.userAgent) ) {
	isMobile = true;
}
// device detection
if (!isMobile) {
if(/(android|bb\d+|meego).+mobile|avantgo|bada\/|blackberry|blazer|compal|elaine|fennec|hiptop|iemobile|ip(hone|od)|ipad|iris|kindle|Android|Silk|lge |maemo|midp|mmp|netfront|opera m(ob|in)i|palm( os)?|phone|p(ixi|re)\/|plucker|pocket|psp|series(4|6)0|symbian|treo|up\.(browser|link)|vodafone|wap|windows (ce|phone)|xda|xiino/i.test(navigator.userAgent)
    || /1207|6310|6590|3gso|4thp|50[1-6]i|770s|802s|a wa|abac|ac(er|oo|s\-)|ai(ko|rn)|al(av|ca|co)|amoi|an(ex|ny|yw)|aptu|ar(ch|go)|as(te|us)|attw|au(di|\-m|r |s )|avan|be(ck|ll|nq)|bi(lb|rd)|bl(ac|az)|br(e|v)w|bumb|bw\-(n|u)|c55\/|capi|ccwa|cdm\-|cell|chtm|cldc|cmd\-|co(mp|nd)|craw|da(it|ll|ng)|dbte|dc\-s|devi|dica|dmob|do(c|p)o|ds(12|\-d)|el(49|ai)|em(l2|ul)|er(ic|k0)|esl8|ez([4-7]0|os|wa|ze)|fetc|fly(\-|_)|g1 u|g560|gene|gf\-5|g\-mo|go(\.w|od)|gr(ad|un)|haie|hcit|hd\-(m|p|t)|hei\-|hi(pt|ta)|hp( i|ip)|hs\-c|ht(c(\-| |_|a|g|p|s|t)|tp)|hu(aw|tc)|i\-(20|go|ma)|i230|iac( |\-|\/)|ibro|idea|ig01|ikom|im1k|inno|ipaq|iris|ja(t|v)a|jbro|jemu|jigs|kddi|keji|kgt( |\/)|klon|kpt |kwc\-|kyo(c|k)|le(no|xi)|lg( g|\/(k|l|u)|50|54|\-[a-w])|libw|lynx|m1\-w|m3ga|m50\/|ma(te|ui|xo)|mc(01|21|ca)|m\-cr|me(rc|ri)|mi(o8|oa|ts)|mmef|mo(01|02|bi|de|do|t(\-| |o|v)|zz)|mt(50|p1|v )|mwbp|mywa|n10[0-2]|n20[2-3]|n30(0|2)|n50(0|2|5)|n7(0(0|1)|10)|ne((c|m)\-|on|tf|wf|wg|wt)|nok(6|i)|nzph|o2im|op(ti|wv)|oran|owg1|p800|pan(a|d|t)|pdxg|pg(13|\-([1-8]|c))|phil|pire|pl(ay|uc)|pn\-2|po(ck|rt|se)|prox|psio|pt\-g|qa\-a|qc(07|12|21|32|60|\-[2-7]|i\-)|qtek|r380|r600|raks|rim9|ro(ve|zo)|s55\/|sa(ge|ma|mm|ms|ny|va)|sc(01|h\-|oo|p\-)|sdk\/|se(c(\-|0|1)|47|mc|nd|ri)|sgh\-|shar|sie(\-|m)|sk\-0|sl(45|id)|sm(al|ar|b3|it|t5)|so(ft|ny)|sp(01|h\-|v\-|v )|sy(01|mb)|t2(18|50)|t6(00|10|18)|ta(gt|lk)|tcl\-|tdg\-|tel(i|m)|tim\-|t\-mo|to(pl|sh)|ts(70|m\-|m3|m5)|tx\-9|up(\.b|g1|si)|utst|v400|v750|veri|vi(rg|te)|vk(40|5[0-3]|\-v)|vm40|voda|vulc|vx(52|53|60|61|70|80|81|83|85|98)|w3c(\-| )|webc|whit|wi(g |nc|nw)|wmlb|wonu|x700|yas\-|your|zeto|zte\-/i.test(navigator.userAgent.substr(0,4))) isMobile = true;
}

<?php if (isset($settings_widget['modal_cbmobile_width_browser']) && $settings_widget['modal_cbmobile_width_browser']!='') { ?>
	if ($(window).width() <= '<?php  echo $settings_widget['modal_cbmobile_width_browser'];	?>' || isMobile) {
	    $.colorbox.resize({
<?php if (isset($settings_widget['modal_cbmobile_width']) && $settings_widget['modal_cbmobile_width']!='') { ?>
		 width: "<?php echo $settings_widget['modal_cbmobile_width']; ?>",
<?php } ?>
<?php if (isset($settings_widget['modal_cbmobile_height']) && $settings_widget['modal_cbmobile_height']!='') { ?>
		 height: "<?php echo $settings_widget['modal_cbmobile_height']; ?>",
<?php } ?>

<?php if (isset($settings_widget['modal_cbmobile_maxwidth']) && $settings_widget['modal_cbmobile_maxwidth']!='') { ?>
		 maxWidtht: "<?php echo $settings_widget['modal_cbmobile_maxwidth']; ?>",
<?php } ?>
<?php if (isset($settings_widget['modal_cbmobile_maxheight']) && $settings_widget['modal_cbmobile_maxheight']!='') { ?>
		 maxHeight: "<?php echo $settings_widget['modal_cbmobile_maxheight']; ?>",
<?php } ?>

<?php if (isset($settings_widget['modal_cb_fixed']) && $settings_widget['modal_cb_fixed']) { ?>
		 fixed: true
<?php } else { ?>
         fixed: false
<?php } ?>

	    });
	} else {
	    $.colorbox.resize({
<?php if (isset($settings_widget['modal_cb_width']) && $settings_widget['modal_cb_width']!='') { ?>
		 width: "<?php echo $settings_widget['modal_cb_width']; ?>",
<?php } ?>
<?php if (isset($settings_widget['modal_cb_height']) && $settings_widget['modal_cb_height']!='') { ?>
		 height: "<?php echo $settings_widget['modal_cb_height']; ?>",
<?php } ?>

<?php if (isset($settings_widget['modal_cb_maxwidth']) && $settings_widget['modal_cb_maxwidth']!='') { ?>
		 maxWidtht: "<?php echo $settings_widget['modal_cb_maxwidth']; ?>",
<?php } ?>
<?php if (isset($settings_widget['modal_cb_maxheight']) && $settings_widget['modal_cb_maxheight']!='') { ?>
		 maxHeight: "<?php echo $settings_widget['modal_cb_maxheight']; ?>",
<?php } ?>

<?php if (isset($settings_widget['modal_cb_fixed']) && $settings_widget['modal_cb_fixed']) { ?>
		 fixed: true
<?php } else { ?>
         fixed: false
<?php } ?>

	    });


	}
<?php } ?>
}



</script>
<?php } ?>


<?php if (isset($settings_widget['anchor']) && $settings_widget['anchor']!='') { ?>
<script>
	<?php if (isset($settings_widget['doc_ready']) && $settings_widget['doc_ready']) { ?>
	$(document).ready(function(){
	<?php  } ?>
		var prefix = '<?php echo $prefix;?>';
		var cmswidget = '<?php echo $cmswidget; ?>';
		var heading_title = '<?php echo $heading_title; ?>';
		var data = $('#cmswidget-<?php echo $cmswidget; ?>').html($('#cmswidget-<?php echo $cmswidget; ?>').clone());
		<?php echo $settings_widget['anchor']; ?>;
		delete data;
		delete prefix;
		delete cmswidget;
	<?php if (isset($settings_widget['doc_ready']) && $settings_widget['doc_ready']) { ?>
	});
	<?php  } ?>
</script>
<?php  } ?>
<?php } ?>