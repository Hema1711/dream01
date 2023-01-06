import { Controller } from "@hotwired/stimulus"
var load_count    =   0
var search_text   =   ""
var cart   = 0
var quantity = ""
var product_price = []
// Connects to data-controller="cart"
var cart_details =""
export default class extends Controller {

  static targets  =   ["cartDetail", "cart_is_empty","cart_total", "quantity"]

  connect() {
    this.cart_binding()
  }

 



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
        var cart_tax = 25
        let cart_total = data[1]  
        var cart_shipping = 20
       

        if(data == null){
          this.cart_is_emptyTarget.style.display =   "block"
        }
        else{
          // console.log("data[0] " + data[0])
        data[0].forEach(element => {
          // console.log(element)
          // console.log(element.product_price)

               this.cart_is_emptyTarget.style.display =   "none"
               product_price.push(element.product_price)
               detail                                  =  detail + this.dynamic_data(element)
               
              });
              // console.log("product_price " + product_price)
              // console.log("cart_total " + cart_total)
              this.cartDetailTarget.innerHTML = detail
            }
            console.log("Detail  :  "+ cart_details.product_description)
            var cart                                  =   this.cart_total( cart_tax , cart_total,cart_shipping)
            // this.cart_totalTarget.insertAdjacentHTML("beforeend",cart) 
            this.cart_totalTarget.innerHTML = cart
          
      })
    }



    cart_calc(data){

      // console.log("CArt Calc")
      // console.log(data)
        var product_price = []
      data.forEach(product => {
          product_price = product.append(product_price)
          
      })
      // console.log(product_price)

    }

    dynamic_data(element){ 
      // console.log("dynamic_data "+ element.product_quantity)
      // console.log(element)
      return`
      <div class="row border-top border-bottom" id="div${element.product_unique_id}" >
        <div class="row main align-items-center">
              <div class="col-2"><img class="img-fluid" src="${element.product_image1}" style="width:250px; height:150px;"></div>
              <div class="col">
                  <div class="row text-muted">${element.product_name}</div>
                  <div class="row">${element.product_description}</div>
              </div>
              <div class="col">
                  <input id="form1" min="1" name="quantity" value="${element.product_quantity}" type="number" class="form-control form-control-sm" style="width: 50px;"  data-action="input->cart#product_quantity" data-cart-id-param ="${element.product_unique_id}"  data-cart-target="quantity"/>
              </div>
              <div class="col">$${element.product_price}</div>
              <div class="col">
              <a class="btn btn-danger btn-lg active" data-action="click->cart#delete_cart" data-cart-id-param=${element.product_unique_id}>Delete</a> 
              </div>
        </div>
      </div>
      `
    }

    

    // product_quantity(data){
    //   var product_unique_id = data.params.id
    //   // console.log("Product Quantity")
    //   quantity = this.quantityTarget.value 
    
    //   // console.log("Quantity "+ quantity)

    //   // console.log("product_unique_id "+ product_unique_id)
    //   fetch("/carts/product_qauntity/", {

    //     method:"POST",
    //     body: JSON.stringify({
    //         "product_unique_id"    :   product_unique_id,
    //         "quantity"   :   quantity
    //     }),
    //     headers: { "content-type": "application/json; charset=UTF-8" }
    //   })
    // }

 


    delete_cart(data) {

      // console.log(data.params.id)

      if(confirm("Are You Sure You Want to delete the product")){ 
      
        fetch("/carts/delete_cart/" + data.params.id, {method: "delete"})
        .then(res => {
          if (res.ok == true){
          
            document.getElementById("div"+data.params.id).remove()

            this.cart_binding()

          }  
        })
      }

    }

    cart_total( cart_tax , cart_total,cart_shipping){
        // console.log("Cart Total" + cart_price)
        return`
        <div>
          <div><h5><b>Summary</b></h5></div>
            <hr>
            <div class="row">
              <div class="d-flex justify-content-between" style="font-weight: 500;">
                <p class="mb-2" style="font-size: larger;">Subtotal</p>
                <p class="mb-2" style="font-size: larger;">$ ${cart_total}</p>
              </div>
              <div class="d-flex justify-content-between" style="font-weight: 500;">
                <p class="mb-0" style="font-size: larger;">Shipping</p>
                <p class="mb-0" style="font-size: larger;">$${cart_shipping}</p>
              </div>
              <div class="d-flex justify-content-between mb-4" style="font-weight: 500;">
                <p class="mb-2"style="font-size: larger;">Total (tax included)</p>
                <p class="mb-2" style="font-size: larger;">$${cart_tax}</p>
              </div>
            </div>
            <hr>
            <div class="d-flex justify-content-between mb-4" style="font-weight: 500;">
              <p class="mb-2"style="font-size: larger;">Grand Total</p>
              <p class="mb-2" style="font-size: larger;">$${cart_total + cart_shipping  + cart_tax}</p>
            </div>
        </div>
        
        `
    }




    // order_confirmation(){
    //   console.log("Payment Gateway")
    //   var stripeEmail = "jaisurya066@gmail.com"
    //     var stripeToken = "sk_test_51MJ8uISEvkY5149VN4KE7e5KSBKPIhThFIu3SLYQF0eYYrNzRQuIQXEhWYDBSZWba16XRQiydXcNPngBXkQ2jeou00kvSQ8xDC"
    //   fetch("/carts/create_pay", {
 
    //     method:"POST",
    //     body: JSON.stringify({
         
    //         "stripeEmail"    :   stripeEmail,
    //         "stripeToken"   :   stripeToken
    //     }),
  
    //     headers: { "content-type": "application/json; charset=UTF-8" }
  
    //   })

    // }



    // payment_gateway(){
    //   console.log("Payment Gateway")
    //   var stripeEmail = "jaisurya066@gmail.com"
    //     var stripeToken = "sk_test_51MJ8uISEvkY5149VN4KE7e5KSBKPIhThFIu3SLYQF0eYYrNzRQuIQXEhWYDBSZWba16XRQiydXcNPngBXkQ2jeou00kvSQ8xDC"
    //   fetch("/carts/create_pay", {
 
    //     method:"POST",
    //     body: JSON.stringify({
         
    //         "stripeEmail"    :   stripeEmail,
    //         "stripeToken"   :   stripeToken
    //     }),
  
    //     headers: { "content-type": "application/json; charset=UTF-8" }
  
    //   })

    // }
}
