import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="user"
export default class extends Controller {

  static targets=[ "first_name","email","last_name","phone_number",
                  "state","city","country","zipcode" ]

  connect() {
    console.log("Connected! User")
  }

  user_detail(){

    email_id = document.getElementById("email")
    console.log(email_id)
    fetch("/users/update_user", {
      method:"PUT",
      body: JSON.stringify({
          "email_id"    :   email_id
      }),

      headers: { "content-type": "application/json; charset=UTF-8" }
    })
  }



  first_name_validation(){
    console.log("First Name")
  }


  last_name_validation(){
    console.log("Last Name")
  }

  phone_validation(){
    console.log("Phone")
  }


  email_validation(){
    console.log("Email")
  }
  state_validation(){
    console.log("State")
  }


  city_validation(){
    console.log("City")
  }

  country_validation(){
    console.log("Country")
  }


  zipcode_validation(){
    console.log("Zipcode")
  }

}
