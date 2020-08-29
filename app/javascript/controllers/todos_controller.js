import ApplicationController from './application_controller'

export default class extends ApplicationController {
  static targets = ["form"]

  // Reset the value of the input after create
  afterCreate () {
    const input = this.formTarget.querySelectorAll("input#todo_description")[0]
    input.value = ""
  }
}
