import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import "bootstrap"
import "../stylesheets/application"
import "@fortawesome/fontawesome-free/css/all"
Rails.start()
Turbolinks.start()
ActiveStorage.start()

require("jquery")
require("bootstrap")
require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")

document.addEventListener("turbolinks:load", function() {
  $(".alert" ).fadeOut(1000);
  $(".alert-success" ).fadeOut(1000);
  $(".alert-danger" ).fadeOut(1000);
    $(function () {
        $('[data-toggle="tooltip"]').tooltip({show:{effect:"none",delay:0 }});
        $('[data-toggle="popover"]').popover()
    })
})
