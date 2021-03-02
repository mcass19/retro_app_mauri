function openModal(id_action_plan) {  
  var modal = $('#action_plan_modal_' + id_action_plan);
  var close = document.getElementById('close_symbol_' + id_action_plan);

  modal.removeClass('hidden').addClass('modal');

  close.onclick = function() {
    modal.removeClass('modal').addClass('hidden');
  };
};
