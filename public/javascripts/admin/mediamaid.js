jQuery(document).ready(function() {
    jQuery('.mediamaid_img').click(function() {
        var img = jQuery(this).attr('src');
        var alt = jQuery(this).attr('alt');

        if (jQuery(this).hasClass('image')) {
            var newHTML = '<div class="mediamaid"><img src="' + img + '"/></div>'
        } else {
            var newHTML = '<div class="mediamaid"><a href="' + alt + '" />' + alt + '</a></div>'
        }
        alert(newHTML);
        jQuery("#part_body_content").insertAtCaret(newHTML);

    });

});

//	jQuery("#mediamaid_img").draggable({helper: 'clone'});
//	jQuery("#part_body_content").droppable({
//		accept: "#DragWordList li",
//		drop: function(ev, ui) {
//			jQuery(this).insertAtCaret(ui.draggable.text());
//		}
//	});
//});

jQuery.fn.insertAtCaret = function (myValue) {
    return this.each(function() {
        //IE support
        if (document.selection) {
            this.focus();
            sel = document.selection.createRange();
            sel.text = myValue;
            this.focus();
        }
        //MOZILLA / NETSCAPE support
        else if (this.selectionStart || this.selectionStart == '0') {
            var startPos = this.selectionStart;
            var endPos = this.selectionEnd;
            var scrollTop = this.scrollTop;
            this.value = this.value.substring(0, startPos) + myValue + this.value.substring(endPos, this.value.length);
            this.focus();
            this.selectionStart = startPos + myValue.length;
            this.selectionEnd = startPos + myValue.length;
            this.scrollTop = scrollTop;
        } else {
            this.value += myValue;
            this.focus();
        }
    });
};

