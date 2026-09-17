import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["button", "openIcon", "closeIcon"]

  toggle() {
    const isOpen = this.element.classList.toggle("navigation-open")

    this.buttonTarget.setAttribute("aria-expanded", String(isOpen))
    this.buttonTarget.setAttribute("aria-label", isOpen ? "Fechar menu" : "Abrir menu")
    this.openIconTarget.classList.toggle("hidden", isOpen)
    this.closeIconTarget.classList.toggle("hidden", !isOpen)
  }

  connect() {
    this.closeMenu = this.closeMenu.bind(this)
    document.addEventListener("turbo:before-visit", this.closeMenu)
  }

  disconnect() {
    document.removeEventListener("turbo:before-visit", this.closeMenu)
  }

  closeMenu() {
    if (this.element.classList.contains("navigation-open")) this.toggle()
  }
}
