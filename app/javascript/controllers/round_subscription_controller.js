import { Controller } from "@hotwired/stimulus"
import consumer from "../channels/consumer"

export default class extends Controller {
  static values = { roundId: Number }
  static targets = ["card"]

  connect() {
    this.channel = consumer.subscriptions.create(
      { channel: "RoundChannel", id: this.roundIdValue },
      { received: data => console.log(data) }
    )
    console.log(`Subscribed to the round with the id ${this.roundIdValue}.`)
  }
}
