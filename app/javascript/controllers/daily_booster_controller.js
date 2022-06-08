import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["card"]

  connect() {
    console.log("hello");
    console.log(this.cardTarget);
    setTimeout(() => {
      this.cardTargets.forEach((card) => {
        card.classList.add('active')
      })
    }, 200);
  }
}
