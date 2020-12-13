(function ($) {
  "use strict";

  /*==================================================================
    [ Validate ]*/
  var input = $(".validate-input .input100");

  $(".validate-form").on("submit", function (event) {
    const loader = document.getElementById("loader-wrapper");
    loader.classList.add("d-flex");
    event.preventDefault(); 
    var check = true;

    for (var i = 0; i < input.length; i++) {
      if (validate(input[i]) == false) {
        showValidate(input[i]);
        check = false;
      }
    }

    if(check) {
      const formElement = document.getElementById("contact-form");
      fetch(formElement.action, {
        method: "post",
        body: new FormData(formElement),
      })
        .then((resp) => resp.json())
        .then(() => {
          formElement.reset();
          alert("Form Submitted succefully!");
        })
        .catch((error) => {
          console.log(error);
          alert("Something went wrong!");
        })
        .finally(() => {
          loader.classList.remove("d-flex");
        });
    } else {
      loader.classList.remove('d-flex');
    }
    return check;
  });

  $(".validate-form .input100").each(function () {
    $(this).focus(function () {
      hideValidate(this);
    });
  });

  function validate(input) {
    if ($(input).attr("type") == "email" || $(input).attr("name") == "email") {
      if (
        $(input)
          .val()
          .trim()
          .match(
            /^([a-zA-Z0-9_\-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-]+\.)+))([a-zA-Z]{1,5}|[0-9]{1,3})(\]?)$/
          ) == null
      ) {
        return false;
      }
    } else {
      if ($(input).val().trim() == "") {
        return false;
      }
    }
  }

  function showValidate(input) {
    var thisAlert = $(input).parent();

    $(thisAlert).addClass("alert-validate");
  }

  function hideValidate(input) {
    var thisAlert = $(input).parent();

    $(thisAlert).removeClass("alert-validate");
  }
})(jQuery);
