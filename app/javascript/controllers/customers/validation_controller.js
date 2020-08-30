import { Controller } from 'stimulus';

export default class extends Controller{
  static targets = ['email', 'cnpjCpf', 'customerForm', 'emailErrorMessage',
                    'cnpjCpfErrorMessage']

  errorMessages = {
    email: 'Já existe um cliente com esse email',
    cnpjCpf:'Já existe um cliente com esse CNPJ/CPF'
  }

  isFormInvalid = true;

  initialize() {

    this.emailTarget.addEventListener('blur', event => {
      if (this.emailIsEmpty(this.emailTarget)){
        this.validateEmail()
      }
    })

    this.cnpjCpfTarget.addEventListener('blur', event => {
      if (this.cnpjCpfIsEmpty(this.cnpjCpfTarget)){
        this.validateCnpjCpf()
      }
    })

    this.customerFormTarget.addEventListener('submit', e => {

      if(this.isFormInvalid == true){
        e.preventDefault();
      }
    })
  }

  emailIsEmpty(email){
    return !email.value == ''
  }

  cnpjCpfIsEmpty(cnpjCpf){
    return !cnpjCpf.value == ''
  }

  validateEmail(){
    fetch('/customers/validate_email', {
      method: 'POST',
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json'
      },
      body: JSON.stringify({validate: { email: this.emailTarget.value }})
    })
    .then(response => response.json())
    .then(data => {
      if(data.avaiable == false){
        this.isFormInvalid = true

        this.emailErrorMessageTarget.innerHTML =
        `<span id="customErrorMessage">${this.errorMessages.email}</span>`
      }else{
        this.isFormInvalid = false

        this.emailErrorMessageTarget.innerHTML = ''
      }
    });
  }

  validateCnpjCpf(){
    fetch('/customers/validate_cnpj_cpf', {
      method: 'POST',
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json'
      },
      body: JSON.stringify({validate: { cnpj_cpf: this.cnpjCpfTarget.value }})
    })
    .then(response => response.json())
    .then(data => {
      if(data.avaiable == false){
        this.isFormInvalid = true

        this.cnpjCpfErrorMessageTarget.innerHTML =
        `<span id="customErrorMessage">${this.errorMessages.cnpjCpf}</span>`
      }else{
        this.isFormInvalid = false

        this.cnpjCpfErrorMessageTarget.innerHTML = ''
      }
    })
  }
}