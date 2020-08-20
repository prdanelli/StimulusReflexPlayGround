import ApplicationController from './application_controller'
import Sortable from "sortablejs"

export default class extends ApplicationController {
  connect() {
    this.sortable = Sortable.create(this.element, {
      onEnd: this.end.bind(this),
      handle: ".js-sortable-handle"
    })
  }

  end(event) {
    let id = event.item.dataset.id
    let data = new FormData()
    data.append("position", event.newIndex + 1)

    fetch(this.data.get("url").replace(":id", id), {
      method: "PATCH",
      body: data
    })
  }
}
