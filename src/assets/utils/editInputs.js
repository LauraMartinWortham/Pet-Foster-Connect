const editBtns = document.querySelectorAll('.material-symbols-outlined');

editBtns.forEach(n => n.addEventListener("click", enableEdit));

function enableEdit(e) {
  const field = e.target.closest('fieldset')
  const inputs = field.querySelectorAll('input')
  const validate = document.querySelector("button");

  if (validate.classList.contains('hidden')) {
  validate.classList.toggle('hidden')
  }

  inputs.forEach((input) => {
      input.disabled = false;
      input.required = true
      input.classList.add('bg-fond')
  })
}