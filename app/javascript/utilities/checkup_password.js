document.addEventListener('turbolinks:load', function() {
  var control = document.getElementById("user_password_confirmation");

  if (control) { control.addEventListener('input', passwordConfirmation) }

});

function passwordConfirmation() {
  input1 = document.getElementById("user_password");
  input2 = document.getElementById("user_password_confirmation");

  if (input2.value.length === 0) {
    return (input2.style.backgroundColor = "transparent")
  };

  if (input1.value === input2.value) {
    input2.style.backgroundColor = "Green"
  } else {
    input2.style.backgroundColor = "Red"
  };
};