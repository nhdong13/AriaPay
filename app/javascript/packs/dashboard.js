import "../stylesheets/dashboard"
import "bootstrap-icons/font/bootstrap-icons.css"
import "../plugins/bootstrap-4.5.3/bootstrap.bundle.min.js"
import "../plugins/chart.js/chart.js"
import "../plugins/icon-set/style.css"
import "../plugins/select2/select2.full.min.js"

var jQuery = require('jquery');
global.$ = global.jQuery = jQuery;
window.$ = window.jQuery = jQuery;

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import HSCore from "../plugins/hs-core/theme.min"
import HSSideNav from "../plugins/hs-navbar-vertical-aside/hs-navbar-vertical-aside.min"

window.HSCore = HSCore
window.HSSideNav = HSSideNav

Rails.start()
Turbolinks.start()
ActiveStorage.start()

