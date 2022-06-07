import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["a", "p"]
  disabled() {
    this.aTarget.classList.add("d-none")
    this.pTarget.classList.remove("d-none")
  }
}
