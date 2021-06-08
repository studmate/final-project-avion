// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
//= require jquery
import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

import { Application } from "stimulus"
import Carousel from "stimulus-carousel"
const application = Application.start()
application.register("carousel", Carousel)

Rails.start()
Turbolinks.start()
ActiveStorage.start()

import "stylesheets/applications" // Add this line
import "controllers"
import 'swiper/swiper-bundle.min.css'
import "../includes/slides.js"
