import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["form"]

  removeRow(event) {
    if (event.detail.success) {
      this.formTarget.closest("[id^='task-']").remove();

      // Optionally show flash
      const flash = document.querySelector("#flash");
      if (flash) {
        flash.innerHTML = `
          <div class="bg-green-500 text-white px-4 py-2 rounded shadow">
            Task deleted successfully.
          </div>
        `;
        setTimeout(() => flash.innerHTML = "", 3000);
      }
    }
  }
}
