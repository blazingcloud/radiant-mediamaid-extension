jQuery.noConflict();
jQuery(document).ready(function() {
    jQuery('#link_gallery').click(function() {
        jQuery('#gallery').toggle();
    });
    jQuery('#link_gallery').one('click', function() {
        jQuery.get('/admin/mediamaid/gallery', function(data) {
            jQuery('#gallery').show();
            jQuery('#gallery').html(data);
        });
    });

});
