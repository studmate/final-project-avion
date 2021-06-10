
import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "toggleable" ]

  toggle(event) {
    event.preventDefault();
     console.log(this.toggleableTarget)
 this.toggleableTarget.classList.toggle('hidden')
  }
}
