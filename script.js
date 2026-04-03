const form = document.getElementById('lead-form');
const successMessage = document.getElementById('form-success');

if (form && successMessage) {
  form.addEventListener('submit', (event) => {
    event.preventDefault();

    const data = new FormData(form);
    const name = data.get('name');

    successMessage.textContent = `¡Gracias${name ? `, ${name}` : ''}! Tu solicitud fue registrada. Te contactaremos pronto.`;
    form.reset();
  });
}
