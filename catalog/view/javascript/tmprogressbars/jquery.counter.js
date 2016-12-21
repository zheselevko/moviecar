;(function($) {
    $.fn.counter = function(options) {
        // Set default values
        var defaults = {
            start: 0,
            end: 10,
            time: 10,
            step: 1000,
            callback: function() { }
        }
        var options = $.extend(defaults, options);
        // The actual function that does the counting
        var counterFunc = function(el, increment, end, step) {
            var value = parseInt(el.html(), 10) + increment;
            if(value >= end) {
                el.html(Math.round(end));
                options.callback();
            } else {
                el.html(Math.round(value));
                setTimeout(counterFunc, step, el, increment, end, step);
            }
        }

        $(this).html(Math.round(options.start));

        var increment = (options.end - options.start) / ((1000 / options.step) * options.time);

        (function(e, i, o, s) {
            setTimeout(counterFunc, s, e, i, o, s);
        })($(this), increment, options.end, options.step);
    }
})(jQuery);