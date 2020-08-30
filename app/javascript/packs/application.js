import { Application } from "stimulus"
import { definitionsFromContext } from "stimulus/webpack-helpers"
import Form from 'rails-form-validation'
import Rails from "@rails/ujs"
Rails.start()

const application = Application.start()
const context = require.context("../controllers", true, /\.js$/)
application.load(definitionsFromContext(context))

application.register('form', Form)
Form.config({
  error: 'global-default-error-element-class-name',
  invalid: 'global-default-invalid-input-class-name',
  template: '<span id="customErrorMessage" class="{error}"><br>{message}</span>'
})