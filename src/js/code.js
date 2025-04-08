
document.getElementById('login')?.addEventListener('submit', (event) => {
    const campoNombre = document.getElementById('usuario');
    if(campoNombre.value.includes('@')) {
        const partesEmail = campoNombre.value.split('@');
        console.log(partesEmail);
        if (partesEmail.length > 2) {
            campoNombre.setCustomValidity('No puede haber más de un @');
            campoNombre.reportValidity();
            event.preventDefault();
        }
        if(!partesEmail[1].includes('.')) {
            campoNombre.setCustomValidity('Después de @ ha de haber un .');
            campoNombre.reportValidity();
            event.preventDefault();
        }
    }
    //console.log("Login!!!");
})

document.getElementById('usuario')?.addEventListener('input', (event) => {
    event.target.setCustomValidity('');
})