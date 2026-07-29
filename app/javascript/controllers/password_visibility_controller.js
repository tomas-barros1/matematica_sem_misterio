import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["input", "button"]

  toggle() {
    const showingPassword = this.inputTarget.type === "text"

    this.inputTarget.type = showingPassword ? "password" : "text"
    this.buttonTarget.textContent = showingPassword ? "Mostrar" : "Ocultar"
    this.buttonTarget.setAttribute("aria-label", showingPassword ? "Mostrar senha" : "Ocultar senha")
    this.buttonTarget.setAttribute("aria-pressed", (!showingPassword).toString())
  }
}
