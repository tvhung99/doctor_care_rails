

$(document).ready(function () {
  if(+$('#user_role_id').val() === 4){
    ["clinic_id", "description", "specialty_id","degree_id"].forEach((f) => {
      $(`#user_doctor_${f}`).show();
    });
  } else {
    ["clinic_id", "description", "specialty_id","degree_id"].forEach((f) => {
      $(`#user_doctor_${f}`).hide();
    });
  }
  $("#user_role_id").on("change", function () {
    if (+$(this).val() === 4) {
      ["clinic_id", "description", "specialty_id","degree_id"].forEach((f) => {
        $(`#user_doctor_${f}`).show();
      });
    } else {
      ["clinic_id", "description", "specialty_id","degree_id"].forEach((f) => {
        $(`#user_doctor_${f}`).hide();
      });
    }
  });
});
