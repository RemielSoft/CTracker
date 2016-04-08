/*
    ==============================
    jQuery watermark plugin
    ==============================
    
    version: 1.0.0.0
    author: Dmitriy Nosenko    
*/

(function ($) {
    var methods = {
        init: function (options) {
            return this.each(function () {
                /* Check if watermark already set */
                if ($(this).data('watermark-object')) {
                    return;
                }

                var settings = $.extend({
                    class: 'watermark', /* default watermark class */
                    text: 'watermark text', /* default watermark text */
                    useAttribute: false, /* if true, use specified attribute for watermark text */
                    attributeName: '' /* alternative source for watermark text */
                }, options);

                /* Get target input */
                var input = $(this);

                /* Get values for positioning watermark */
                var height = input.outerHeight();
                var paddingLeft = parseInt(input.css('padding-left'));
                var marginTop = parseInt(input.css('margin-top'));
                var fontSize = parseInt(input.css('font-size'));
                var top = (height / 2) - (fontSize / 2) + marginTop;

                /* Creating wrapper */
                var wrapper = $('<div>')
                    .css({
                        'position': 'relative',
                        'display': 'inline-block'
                    });

                /* Set watermark text */
                var watermarkText = settings.text;
                if (settings.useAttribute && settings.attributeName && (input.attr(settings.attributeName) != 'undefined')) {
                    watermarkText = input.attr(settings.attributeName);
                }

                /* Creating watermark span */
                var watermark = $('<span>')
                    .css({
                        'position': 'absolute',
                        'left': paddingLeft + 2,
                        'top': top,
                        'font-size': fontSize,
                        'height': fontSize,
                        'line-height': (top-4) + 'px'
                    })
                    .addClass(settings.class)
                    .html(watermarkText);

                /* Save watermark object for other methods */
                $(this).data('watermark-object', watermark);

                /* Getting they together */
                input.wrap(wrapper);
                input.after(watermark);

                /* Binding to events */
                watermark.click(function () {
                    input.focus();
                });

                input.bind('click keyup input cut paste', function () {
                    if (input.val()) {
                        input.watermark('hide');
                    } else {
                        input.watermark('show');
                    }
                });

                /* Refresh watermark */
                input.click();
            });
        },
        /* Show watermark */
        show: function () {
            return this.each(function () {
                $(this).data('watermark-object').show();
            });
        },
        /* Hide watermark */
        hide: function () {
            return this.each(function () {
                $(this).data('watermark-object').hide();
            });
        }
    };

    $.fn.watermark = function (method) {
        if (methods[method]) {
            return methods[method].apply(this, Array.prototype.slice.call(arguments, 1));
        } else if (typeof method === 'object' || !method) {
            return methods.init.apply(this, arguments);
        } else {
            $.error('Method ' + method + ' does not exist on jQuery.watermark');
        }

    };
})(jQuery);