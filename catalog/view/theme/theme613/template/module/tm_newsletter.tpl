<div id="tm-newsletter" class="box newsletter">
   <h3><?php echo $heading_title; ?></h3>

        <?php if ($description){?><p class="newsletter-description"><?php echo $description;?></p><?php }?>
        <form method="post" enctype="multipart/form-data" id="tm-newsletter-form">
            <div class="newsletter-wrap">
                <input type="text" name="tm_newsletter_email" value="" placeholder="<?php echo $entry_mail; ?>"
                       id="input-tm-newsletter-email" class="form-control"/>
                <button type="submit" id="tm-newsletter-button" class="dropdown-btn"><?php echo $button_subscribe; ?></button>
            </div>
            <span id="tm-newsletter_error" class="newsletter-error"></span>
            <span id="tm-newsletter_success" class="newsletter-success"></span>
        </form>

</div>

<script>
    $(document).ready(function () {
        $('#tm-newsletter').submit(function (e) {
            e.preventDefault();
            var email = $("#input-tm-newsletter-email").val();
            var emailRegex = /^[A-Z0-9._%+-]+@[A-Z0-9.-]+.[A-Z]{2,4}$/igm;
            if (emailRegex.test(email)) {
                var dataString = 'tm_newsletter_email=' + email;
                $.ajax({
                    type: "POST",
                    url: "index.php?route=module/tm_newsletter",
                    data: dataString,
                    cache: false,
                    success: function (result) {
                        if (!result){
                            $('#tm-newsletter_success').html('<?php echo $success; ?>').fadeIn(300).delay(4000).fadeOut(300);
                        }else{
                            $('#tm-newsletter_error').html(result).fadeIn(300).delay(4000).fadeOut(300);
                        }
                    }
                });
            } else {
                $('#tm-newsletter_error').html('<?php echo $error_invalid_email; ?>').fadeIn(300).delay(4000).fadeOut(300);
            }
        });
    });
</script>