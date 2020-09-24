
(function ($) {
    "use strict";

    $.i18n().load( {
       'en': './js/i18n/en.json',
       'ru': './js/i18n/ru.json'
     } ).done(function() {
         $('.switch-locale').on('change', function(e) {
           e.preventDefault();
           $.i18n().locale = this.value;
           $('body').i18n();
         });
          $.i18n().locale = 'en';
          $('body').i18n();
       });



    /*==================================================================
    [ Validate ]*/
    var input = $('.validate-input .input100');

    $('.validate-form').on('submit',function(){
        var check = true;

        for(var i=0; i<input.length; i++) {
            if(validate(input[i]) == false){
                showValidate(input[i]);
                check=false;
            }
        }
        if (check)
        {
          var data = {
            contact: {
              first_name: $('#first-name').val(),
              last_name: $('#last-name').val(),
              email: $('#email').val(),
              phone_number: $('#phone').val(),
              message: $('#message').val()
            }
          };

          $.ajax({
              type: "POST",
              url: '/api/v1/contact',
              data: JSON.stringify(data),
              dataType:"json",
              contentType: 'application/json',
              success: function(response) {
                // we can use response object later if you want to display anything from it.
                $( "#result" ).empty().append( 'Success! We will get in touch with you soon.' );
                $('#contact-form').trigger("reset");
              },
              error: function(xhr, status, error) {
                // we can use xhr object to display error / to send notitification to development team
                // like wise we can use error object depending upon business requirement.
                $( "#result" ).empty().append( 'Something went wrong! please try again later.' );
              }
            });
        }
        return false;
    });

    $('.validate-form .input100').each(function(){
        $(this).focus(function(){
           hideValidate(this);
        });
    });

    function validate (input) {
        if($(input).attr('type') == 'email' || $(input).attr('name') == 'email') {
            if($(input).val().trim().match(/^([a-zA-Z0-9_\-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-]+\.)+))([a-zA-Z]{1,5}|[0-9]{1,3})(\]?)$/) == null) {
                return false;
            }
        }
        else {
            if($(input).val().trim() == ''){
                return false;
            }
        }
    }

    function showValidate(input) {
        var thisAlert = $(input).parent();

        $(thisAlert).addClass('alert-validate');
    }

    function hideValidate(input) {
        var thisAlert = $(input).parent();

        $(thisAlert).removeClass('alert-validate');
    }


})(jQuery);
