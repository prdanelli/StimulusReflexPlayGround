import cableReady from 'cable_ready'
import consumer from "./consumer"

consumer.subscriptions.create("TodosChannel", {
  connected() {
    document.body.classList.add('todo-connected')
  },

  disconnected() {
    document.body.classList.remove('todo-connected')
  },

  received(data) {
  }
});
