<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style>
body {
  margin: 0;
  background-color: #F0F0F0;
  font-family: 'Liberation Sans', Arial, sans-serif;
}

h1 {
  text-align: center;
}

#images {
	width:300px;
	height:200px;
}

</style>
</head>
<body>
	<h1>Infinite Scrolling, Demo 3</h1>

    <ul id="images">
      <li>
          <img src="Images/골든리트리버.PNG"/>
      </li>
      <li>
          <img src="Images/스피츠.PNG"/>
      </li>
      <li>
          <img src=""/>
      </li>
      <li>
          <img src="https://pexels.imgix.net/photos/1127/cold-snow-landscape-nature.jpg?fit=crop&w=640&h=480" alt="" />
      </li>
      <li>
          <img src="https://pexels.imgix.net/photos/9148/pexels-photo.jpeg?fit=crop&w=640&h=480" alt="" />
      </li>
    </ul>
</body>
<script>
(function($){

  $.fn.endlessScroll = function(options) {

    var defaults = {
      bottomPixels: 50,
      fireOnce: true,
      fireDelay: 150,
      loader: "<br />Loading...<br />",
      data: "",
      insertAfter: "div:last",
      resetCounter: function() { return false; },
      callback: function() { return true; },
      ceaseFire: function() { return false; }
    };

    var options = $.extend({}, defaults, options);

    var firing       = true;
    var fired        = false;
    var fireSequence = 0;

    if (options.ceaseFire.apply(this) === true) {
      firing = false;
    }

    if (firing === true) {
      $(this).scroll(function() {
        if (options.ceaseFire.apply(this) === true) {
          firing = false;
          return; // Scroll will still get called, but nothing will happen
        }

        if (this == document || this == window) {
          var is_scrollable = $(document).height() - $(window).height() <= $(window).scrollTop() + options.bottomPixels;
        } else {
          // calculates the actual height of the scrolling container
          var inner_wrap = $(".endless_scroll_inner_wrap", this);
          if (inner_wrap.length == 0) {
            inner_wrap = $(this).wrapInner("<div class=\"endless_scroll_inner_wrap\" />").find(".endless_scroll_inner_wrap");
          }
          var is_scrollable = inner_wrap.length > 0 &&
            (inner_wrap.height() - $(this).height() <= $(this).scrollTop() + options.bottomPixels);
        }

        if (is_scrollable && (options.fireOnce == false || (options.fireOnce == true && fired != true))) {
          if (options.resetCounter.apply(this) === true) fireSequence = 0;

          fired = true;
          fireSequence++;

          $(options.insertAfter).after("<div id=\"endless_scroll_loader\">" + options.loader + "</div>");

          data = typeof options.data == 'function' ? options.data.apply(this, [fireSequence]) : options.data;

          if (data !== false) {
            $(options.insertAfter).after("<div id=\"endless_scroll_data\">" + data + "</div>");
            $("div#endless_scroll_data").hide().fadeIn();
            $("div#endless_scroll_data").removeAttr("id");

            options.callback.apply(this, [fireSequence]);

            if (options.fireDelay !== false || options.fireDelay !== 0) {
              $("body").after("<div id=\"endless_scroll_marker\"></div>");
              // slight delay for preventing event firing twice
              $("div#endless_scroll_marker").fadeTo(options.fireDelay, 1, function() {
                $(this).remove();
                fired = false;
              });
            }
            else {
              fired = false;
            }
          }

          $("div#endless_scroll_loader").remove();
        }
      });
    }
  };

})(jQuery);


// Script
$(document).ready(function() {
  $(document).endlessScroll({
    inflowPixels: 300,
    callback: function() {
      var $img = $('#images li:nth-last-child(5)').clone();
      $('#images').append($img);
    }
  });
});
</script>
</html>