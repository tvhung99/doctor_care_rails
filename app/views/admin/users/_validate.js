
$("#new_user").validate({

  //error place
  errorPlacement: function (error, element) {
    if(element.attr("type")=== "radio"){
      error.insertAfter(element.parent());
    } else {
      element.next("label").remove();
      error.insertAfter(element);
    }
  },
  errorClass: "errors",
  //adding rule
  rules: {
    // username is required with max of 20 and min of 6
    // email is required with format
    "user[email]": {
      required: true,
      email: true,
    },
    // password is required
    "user[password]": {
      required: true,
    },
    // password_confirmation is required and is the same with password
    "user[password_confirmation]": {
      required: true,
      equalTo: "#user_password",
    },
    "user[date_of_birth]": {
      required: true,
    },
    "user[first_name]": {
      required: true,
    },
    "user[last_name]": {
      required: true,
    },
    "user[gender]": {
      required: true,
    },
    // introduction is optional with maxlenght 500
  },
  // error messages
  messages: {
    "user[email]": {
      required: "Vui lòng nhập email!",
      email: "Vui lòng nhập đúng định dạng email!",
    },
    "user[password]": {
      required: "Vui lòng nhập mật khẩu!",
    },
    "user[password_confirmation]": {
      required: "Vui lòng nhập mật khẩu!",
      equalTo: "Mật khẩu không khớp!",
    },
    "user[first_name]": {
      required: "Vui lòng nhập trường này!",
    },
    "user[last_name]": {
      required: "Vui lòng nhập trường này!",
    },
    "user[role_id]": {
      required: "Vui lòng chọn trường này!",
    },
    "user[gender]": {
      required: "Vui lòng chọn trường này!",
    },
  },
});
