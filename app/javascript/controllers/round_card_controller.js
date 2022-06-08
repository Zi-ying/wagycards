import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "card_click" ]

  select() {
    console.log('coucou')
  }
}
