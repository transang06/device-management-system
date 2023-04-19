import { Controller } from "@hotwired/stimulus"
// import { Modal } from 'flowbite';

export default class extends Controller {
  static targets = [ "close" ]

  close() {
    console.log("sasas")
    this.closeTarget.click();
  }
}
