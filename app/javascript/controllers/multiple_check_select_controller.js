import {Controller} from "@hotwired/stimulus"

// Connects to data-controller="multiple-check-select"
export default class extends Controller {

  static targets = ["dropdownMemberIds", "hiddenMemberIds", "actualMemberIds"]
  static values = {data: Array};

  connect() {
    this.hiddenMemberIdsTarget.value = JSON.stringify(this.dataValue)
  }

  handleChange(e) {
    const value = parseInt(e.target.value)
    let hiddenValue = JSON.parse(this.hiddenMemberIdsTarget.value)
    if (e.target.checked) {
      hiddenValue.push(value)
    } else {
      hiddenValue = hiddenValue.filter(item => item != value)
    }
    this.hiddenMemberIdsTarget.value = JSON.stringify(hiddenValue)
    this.actualMemberIdsTarget.value = JSON.stringify(hiddenValue)
  }
}
