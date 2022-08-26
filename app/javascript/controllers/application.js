import { Application } from "@hotwired/stimulus"

const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

export { application }

// STIMULUS CAROUSEL In your application.js (for example)
import 'swiper/css/bundle'
