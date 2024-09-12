import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="modal"
export default class extends Controller {
  connect() {
  }

  close(e) {
    e.preventDefault();

    // Get "confirmation-model" turbo_frame_tag and set innerHTML to blank
    const modal = document.getElementById("modal");
    modal.innerHTML = "";

    modal.removeAttribute("src");
    modal.removeAttribute("complete");
  }
}
