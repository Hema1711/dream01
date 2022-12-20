import { Controller } from "@hotwired/stimulus"
var load_count    =   0
var search_text   =   ""
// Connects to data-controller="cart"
export default class extends Controller {

  // static targets  =   ["cartDetail"]

  connect() {
    console.log("Cart controller")
    this.cart_binding()
  }

  // cart_binding() {
  //   console.log("cart")
  //   fetch("/carts/cart_details/")
  //   .then(result=> result.json())
  //   .then(data=> {
  //     console.log(data)
  //     var detail                                =   ''


  //     detail.forEach(element => {
  //            detail                                  =   detail + this.dynamic_data(element)
  //           });
  //           this.cartDetailTarget.insertAdjacentHTML("beforeend",detail)
  //   })
   
  //   }



    cart_binding(){
      fetch("/carts/cart_details/", {

        method:"POST",
        body: JSON.stringify({
            "load_count"    :   load_count,
            "search_text"   :   search_text
        }),
  
        headers: { "content-type": "application/json; charset=UTF-8" }
  
      })
  
      .then(result=> result.json())
      .then(data=> {
        var detail                                =   ''
      
        data.forEach(element => {
               detail                                  =   this.dynamic_data(element)
               
              });

              this.cartDetailTarget.insertAdjacentHTML("beforeend",detail)
      })
    }


    dynamic_data(element){ 
      console.log("element")
      console.log(element)
      return`
      <tr >
      <th scope="row">
        <div class="d-flex align-items-center">
          <img src="https://i.imgur.com/2DsA49b.webp" class="img-fluid rounded-3"
            style="width: 120px;" alt="Book">
          <div class="flex-column ms-4">
            <p class="mb-2">${element.user.first_name}</p>
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

}