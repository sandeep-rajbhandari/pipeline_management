import {Controller} from "@hotwired/stimulus"
import Sortable from 'sortablejs';

// Connects to data-controller="sortable"
export default class extends Controller {
  static values = {
    group: String
  }

  connect() {
    Sortable.create(this.element, {
      onEnd: this.onEnd.bind(this),
      group: this.groupValue,
    })
  }

  async onEnd(event) {
    let sortableUpdateUrl = event.item.dataset.sortableUpdateUrl
    // console.log(sortableUpdateUrl)
    // console.log(event.newIndex)
    let index = event.newIndex
    let sortableStageId = event.to.dataset.sortableStageId
    const response = await fetch(sortableUpdateUrl, {
      method: 'PATCH',
      body: JSON.stringify({stage_id: sortableStageId, row_order_position: index}),
      headers: {
        "Content-Type": "application/json",
        "X-CSRF-Token": document.querySelector('meta[name="csrf-token"]').content
      }
    })
  }
}
