import { Controller } from "@hotwired/stimulus"

// Turbo.session.drive = false

export default class extends Controller {
    connect() {
        this.element.textContent = "Hello from devise!"
    }
}

