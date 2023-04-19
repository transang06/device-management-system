import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static outlets = [ "modal" ]

  connect () {
    // this.modalOutlets.forEach(result =>result.close())
    this.element.click()
    console.log("sss")
  }

}
