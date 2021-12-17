import "../stylesheets/application"
import "bootstrap-icons/font/bootstrap-icons.css"
import "bootstrap"

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import Swiper from "../plugins/swiper/swiper-bundle.min"
import HSHeader from "../plugins/hs-header/hs-header.min"
import HSMegaMenu from "../plugins/hs-mega-menu/hs-mega-menu.min"

window.Swiper = Swiper
window.HSHeader = HSHeader
window.HSMegaMenu = HSMegaMenu

import 'jquery-validation'
import "../pages/index"
import "../pages/sign_in"
import "../pages/forgot_password"
import "../pages/reset_password"

Rails.start()
Turbolinks.start()
ActiveStorage.start()
