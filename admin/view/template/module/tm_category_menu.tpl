<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
    <div class="page-header">
        <div class="container-fluid">
            <div class="pull-right">
                <button type="submit" form="form-tm_category_menu" data-toggle="tooltip"
                        title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
                <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>"
                   class="btn btn-default"><i class="fa fa-reply"></i></a>
            </div>
            <h1><?php echo $heading_title; ?></h1>
            <ul class="breadcrumb">
                <?php foreach ($breadcrumbs as $breadcrumb) { ?>
                    <li>
                        <a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
                    </li>
                <?php } ?>
            </ul>
        </div>
    </div>
    <div class="container-fluid">
        <?php if ($error_warning) { ?>
            <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
                <button type="button" class="close" data-dismiss="alert">&times;</button>
            </div>
        <?php } ?>
        <?php if ($error_size) { ?>
            <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_size; ?>
                <button type="button" class="close" data-dismiss="alert">&times;</button>
            </div>
        <?php } ?>
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_edit; ?></h3>
            </div>
            <div class="panel-body">
                <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data"
                      id="form-tm_category_menu" class="form-horizontal">

                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="input-name"><?php echo $entry_name; ?></label>

                        <div class="col-sm-10">
                            <input type="text" name="name" value="<?php echo $name; ?>"
                                   placeholder="<?php echo $entry_name; ?>" id="input-name" class="form-control"/>
                            <?php if ($error_name) { ?>
                                <div class="text-danger"><?php echo $error_name; ?></div>
                            <?php } ?>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="input-status"><?php echo $entry_status; ?></label>

                        <div class="col-sm-10">
                            <select name="status" id="input-status" class="form-control">
                                <?php if ($status) { ?>
                                    <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                                    <option value="0"><?php echo $text_disabled; ?></option>
                                <?php } else { ?>
                                    <option value="1"><?php echo $text_enabled; ?></option>
                                    <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                                <?php } ?>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="input-limit"><?php echo $entry_limit; ?></label>

                        <div class="col-sm-10">
                            <input type="text" name="limit" value="<?php echo $limit; ?>"
                                   placeholder="<?php echo $entry_limit; ?>" id="input-limit" class="form-control"/>
                        </div>
                    </div>

                    <div id="images">

                        <?php $images = 0; ?>
                        <?php if (isset($image)) { ?>
                            <?php for ($i = 0; $i <= sizeof($image) - 1; $i++) { ?>
                                <?php if (!empty($image[$i])) { ?>
                                    <div class="image<?php echo $i ?>">
                                        <div class="form-group">
                                            <h4 class="col-sm-2 text-right">Image: <?php echo $i + 1; ?></h4>

                                            <div class="col-sm-10 text-right">
                                                <button type="button" onclick="removeImage(<?php echo $i ?>);"
                                                        data-toggle="tooltip"
                                                        title="<?php echo $text_remove_image; ?>"
                                                        class="btn btn-danger"><i
                                                        class="fa fa-minus-circle"></i></button>
                                            </div>

                                            <div class="clearfix "></div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label"
                                                   for="input-image_<?php echo $i; ?>"><?php echo $entry_image; ?></label>

                                            <div class="col-sm-10">
                                                <a href="" id="thumb-image<?php echo $i; ?>" data-toggle="image"
                                                   class="img-thumbnail"><img
                                                        src="<?php if ($image[$i]) {
                                                            echo $image_thumb[$i]['image'];
                                                        } else {
                                                            echo $placeholder;
                                                        } ?>" alt="" title=""
                                                        data-placeholder="<?php echo $placeholder; ?>"/></a>
                                                <input class="form-control" type="hidden" name="image[]"
                                                       value="<?php echo $image[$i]; ?>"
                                                       id="input-image_<?php echo $i; ?>">
                                            </div>
                                        </div>

                                        <div class="form-group required">
                                            <label class="col-sm-2 control-label"
                                                   for="input-image-width_<?php echo $i; ?>"><?php echo $entry_image_width; ?></label>

                                            <div class="col-sm-10">
                                                <input class="form-control" type="text" name="image_width[]" value="<?php if ($image_width[$i]) {echo $image_width[$i];} else{ echo '0'; } ?>"
                                                       id="input-image-width_<?php echo $i; ?>">
                                            </div>
                                        </div>

                                        <div class="form-group required">
                                            <label class="col-sm-2 control-label"
                                                   for="input-image-height_<?php echo $i; ?>"><?php echo $entry_image_height; ?></label>

                                            <div class="col-sm-10">
                                                <input class="form-control" type="text" name="image_height[]" value="<?php if ($image_height[$i]) {echo $image_height[$i];} else{ echo '0'; } ?>"
                                                       id="input-image-height_<?php echo $i; ?>">
                                            </div>
                                        </div>
                                    </div>
                                    <?php $images++ ?>
                                <?php } ?>
                            <?php } ?>

                        <?php } ?>

                    </div>
                    <div class="text-right">
                        <button type="button" onclick="addImage();" data-toggle="tooltip"
                                title="<?php echo $text_add_image; ?>" class="btn btn-primary"><i
                                class="fa fa-plus-circle"></i></button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<?php echo $footer; ?>

<script type="text/javascript">
    var images =<?php echo $images; ?>;

    function addImage() {
        html = '<div class="image' + images + '">';


        html += '<div class="form-group">';
        html += '	<h4 class="col-sm-2 text-right">Image: ' + (images + 1) + '</h4>';
        html += '	<div class="col-sm-10 text-right">';
        html += '		 <button type="button" onclick="removeImage(' + images + ');" data-toggle="tooltip"  title=" <?php echo $text_remove_image; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button>';
        html += '	</div>';
        html += '</div>';


        html += '<div class="form-group required">';
        html += '	<label class="col-sm-2 control-label" for="input-image_' + images + '"><?php echo $entry_image; ?></label>';
        html += '	<div class="col-sm-10">';
        html += '		<a href="" id="thumb-image' + images + '" data-toggle="image" class="img-thumbnail"><img src="<?php echo $placeholder;?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>"/></a>';
        html += '		<input class="form-control" type="hidden" name="image[]" value="" id="input-image_' + images + '">';
        html += '	</div>';
        html += '</div>';

        html += '<div class="form-group required">';
        html += '	<label class="col-sm-2 control-label" for="input-image-width_' + images + '"><?php echo $entry_image_width; ?></label>';
        html += '	<div class="col-sm-10">';
        html += '		<input class="form-control" type="text" name="image_width[]" value="0" id="input-image-width_' + images + '">';
        html += '	</div>';
        html += '</div>';

        html += '<div class="form-group required">';
        html += '	<label class="col-sm-2 control-label" for="input-image-height_' + images + '"><?php echo $entry_image_height; ?></label>';
        html += '	<div class="col-sm-10">';
        html += '		<input class="form-control" type="text" name="image_height[]" value="0" id="input-image-height_' + images + '">';
        html += '	</div>';
        html += '</div>';


        $('#images').append(html);
        images++;
    }

    function removeImage(index) {
        var el = '.image' + index;
        $(el).remove();
        $('.tooltip').remove();
    }
</script>