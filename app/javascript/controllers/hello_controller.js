import { Controller } from "@hotwired/stimulus"
var load_count    =   0
var search_text   =   ""
export default class extends Controller {

  static targets  =   ["email", "login","cart", "cartDetail"]

  connect() {
    // console.log("Hello Controller")
  }


  cart_binding() {
    // console.log("URL")
    window.open("/carts/cart_index/")
  }

    dynamic_data(element){ 
      console.log(element)
      return`
      <tr >
      <th scope="row">
        <div class="d-flex align-items-center">
          <img src="https://i.imgur.com/2DsA49b.webp" class="img-fluid rounded-3"
            style="width: 120px;" alt="Book">
          <div class="flex-column ms-4">
            <p class="mb-2">Thinking, Fast and Slow</p>
            <p class="mb-0">Daniel Kahneman</p>
          </div>
        </div>
      </th>
      <td class="align-middle">
        <p>Digital</p>
      </td>
      <td class="align-middle">
        <div class="d-flex flex-row">
          <button class="btn btn-link px-2"
            onclick="this.parentNode.querySelector('input[type=number]').stepDown()">
            <i class="fas fa-minus"></i>
          </button>

          <input id="form1" min="0" name="quantity" value="2" type="number"
            class="form-control form-control-sm" style="width: 50px;" />

          <button class="btn btn-link px-2"
            onclick="this.parentNode.querySelector('input[type=number]').stepUp()">
            <i class="fas fa-plus"></i>
          </button>
        </div>
      </td>
      <td class="align-middle">
        <p class="mb-0" style="font-size: larger;" >$9.99</p>
      </td>
    </tr>
      `
    }



  login_box(){
    // console.log("Login")
    window.open("/users/get_user");
  }

  email_validation(){
    // console.log("Email")
  }



}
