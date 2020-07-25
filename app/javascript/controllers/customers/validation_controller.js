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
      if (!this.emailIsEmpty(this.emailTarget)){
        this.validateEmail()
      }
    })

    this.customerFormTarget.addEventListener('submit', e => {

      if(this.isFormInvalid == true){
        e.preventDefault();
      }
    })
  }

  emailIsEmpty(email){
    if(email.value == ''){
      return true
    }
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

  validatePhoneNumber(){
    this.phoneNumberErrorMessageTarget.innerHTML =
    `<span id="customErrorMessage">${this.errorMessages.phoneNumber}</span>`
  }

  validateCnpjCpf(){
    this.cnpjCpfErrorMessageTarget.innerHTML =
    `<span id="customErrorMessage">${this.errorMessages.cnpjCpf}</span>`
  }
}