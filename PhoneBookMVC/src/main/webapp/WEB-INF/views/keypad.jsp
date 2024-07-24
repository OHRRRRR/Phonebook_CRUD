<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>전화번호입력</title>
<link rel="stylesheet" href="styles.css">
<style type="text/css">
    body, html {
        margin: 0;
        padding: 0;
        width: 100%;
        height: 100%;
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
        background-color: #f5f5f5; /* Optional: set a background color */
    }
    #phonetitle {
        margin-bottom: 20px; 
        font-size: 2em; 
    }
    #add, #check {
        color: black;
        margin: 10px 5px;
        text-decoration: none;
    }
    #numInput {
        color: black;
        background: white;
        text-align: center;
        margin: 20px 0;
        font-size: 3em;
        width: 420px;
        border-radius: 6px;
        border: 2px solid black;
    }
    #keypad {
        width: 420px;
        display: flex;
        flex-wrap: wrap;
        justify-content: space-between;
    }
    .keypad button {
        margin: 1%;
        width: 31%;
        height: 23%;
        background: #eee;
        border: 2px solid black;
        border-radius: 10px;
        font-size: 3em;
    }
    .keypad button.delete,
    .keypad button.submit {
        background: black;
        color: white;
    }
</style>
</head>
<body>
    <h2 id="phonetitle">전화번호를 입력하세요</h2>
    <a href="#" id="add">번호추가</a>
    <a href="list" id="check">전체확인하기</a>
    <input type="text" class="keypad" id="numInput" disabled="disabled" />
    <div id="keypad"></div>
    <script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
    <script type="text/javascript" src="jquery.keypad.js"></script>
    <script type="text/javascript">
        $(document).ready(function() {
            $('#keypad').keypad();
            // Bind click event to "번호추가" button
            $('#add').click(function() {
                var phoneNumber = $('#numInput').val();
                if (phoneNumber) {
                    window.location.href = 'form?phonenumber=' + encodeURIComponent(phoneNumber);
                } else {
                    alert('전화번호를 입력해주세요.');
                }
            });
        });
    </script>
    <script>
    (function($) {
        (function(pluginName) {
          var defaults = {
            inputField: 'input.keypad',
            buttonTemplate: '<button></button>',
            submitButtonText: '삭제',
            deleteButtonText: '←',
            submitButtonClass: 'submit',
            deleteButtonClass: 'delete'
          };
          $.fn[pluginName] = function(options) {
            options = $.extend(true, {}, defaults, options);
                  
            return this.each(function() {
              var elem = this,
                $elem = $(elem),
                $input = jQuery.type(options.inputField) == 'string' ? $(options.inputField) : options.inputField,
                $form = $input.parents('form').length ? $($input.parents('form')[0]) : $elem;
      
              var numbers = Array.apply(null, Array(9)).map(function (_, i) {
                return $(options.buttonTemplate).html(i+1).addClass('number');
              });
              numbers.push($(options.buttonTemplate).html(options.submitButtonText).addClass(options.submitButtonClass));
              numbers.push($(options.buttonTemplate).html("0").addClass('number'));
              numbers.push($(options.buttonTemplate).html(options.deleteButtonText).addClass(options.deleteButtonClass));

              $elem.html(numbers).addClass('keypad');
      
              $elem.find('.number').click(function(e) {
                $input.val($input.val() + $(e.target).text());
                $input.trigger('change');
              });
              $elem.find('.' + options.deleteButtonClass).click(function(e) {
                $input.val($input.val().slice(0, -1));
                $input.trigger('change');
              });
              $elem.find('.' + options.submitButtonClass).click(function(e) {
                $("#numInput").val("");
              });
            });
          };
          $.fn[pluginName].defaults = defaults;
        })('keypad');
      })(jQuery);
    </script>
</body>
</html>
