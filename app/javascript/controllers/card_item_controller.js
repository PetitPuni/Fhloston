import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="card-item"
export default class extends Controller {
  connect() {
    console.log("je suis connecté")
  }

  searchbar(){
    
  }
}
