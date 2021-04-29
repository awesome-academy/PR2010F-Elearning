import consumer from "./consumer"
consumer.subscriptions.create("NotificationsChannel", {
  connected() {
    const counter = document.getElementById('notification-counter').innerHTML
    console.log("connected")
  },
  disconnected() {
  },
  received(data) {
    $('#notification-list').prepend('' + data.html);
    $('#notification-counter').html(data.counter);
  }
});
