import { Controller } from "@hotwired/stimulus"
import Swal from 'sweetalert2'

export default class extends Controller {
  static targets = ["resultat"]

  connect() {
    if (this.resultatTarget.innerHTML === 'true') {
      Swal.fire({
        icon: 'success',
        title: 'Congratulations!',
        text: 'You won the round !',
        timer: 2000
      })
    } else {
      Swal.fire({
        icon: 'error',
        title: 'Sorry...',
        text: 'You loose the round !',
        timer: 2000
      })
    }
  }
}
