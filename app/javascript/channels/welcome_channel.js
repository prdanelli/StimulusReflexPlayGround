import consumer from "./consumer"

consumer.subscriptions.create("WelcomeChannel", {
  connected() {
    console.log("welcome connected")
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    console.log("welcome disconnected")
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    // Called when there's incoming data on the websocket for this channel
    console.log("welcome received", data)
  }
});
