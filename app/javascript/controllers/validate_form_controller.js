import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["idField", "error"]

  connect() {
    this.clearError()
  }

  clearError() {
    if (this.hasErrorTarget) {
      this.errorTarget.textContent = ""
    }
  }

  validate(event) {
    this.clearError()

    const id = this.idFieldTarget.value.trim()

    if (id === "") {
      event.preventDefault()
      this.errorTarget.textContent = "Please enter a task ID"
    }
  }
}
