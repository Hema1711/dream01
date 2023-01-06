import { Controller } from "@hotwired/stimulus"
var search_text =""
var load_count = 0
var  $count = 0
// Connects to data-controller="search"
export default class extends Controller {

  static targets  =   ["search", "serachData","searchText","searchError"]
   
  connect() {
    // console.log("Search Controller")
    
  }



    search_dynamic_data() {
      // console.log("Serach Kulla Vanthuten 2")
      // console.log("load Count New arival   " + load_count)
    fetch("/products/all_product", {

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
      $count = data[1]

      load_count                                =   load_count +data[0].length




      data[0].forEach(element => {
      
            detail                                  =   detail + this.all_products_dynamic(element)
            });
            // detail = this.serachDataTarget.innerHTML
            this.serachDataTarget.insertAdjacentHTML("beforeend",detail)
    })

  }

  all_products_dynamic(element){ 
  return`
  <div class="box" id="div${element.product_unique_id}">
  <div class="image ">
      <img src=${element.product_image1.url}  alt="" style=" vertical-align: middle; height: 150px; width: 200px;">
  </div>
  <div class="info">
      <div>
      <a class="index-anch-new-arrival" href="/products/single_product/${element.product_unique_id}">
      <h3>${element.product_name}</h3>
      </a>
      </div>
      <div class="subInfo">
      
          <strong class="price">₹${element.product_price}/- <span>${element.product_price}/-</span> </strong>
          <div class="stars">
              <i class="fas fa-star"></i>
              <i class="fas fa-star"></i>
              <i class="fas fa-star"></i>
              <i class="fas fa-star"></i>
              <i class="fas fa-star-half"></i>
          </div>
      </div>
      <div class="product-card-buttons">
      <a class="product-anch btn-info btn" href="/products/edit_product/${element.product_unique_id}">Edit</a>
      <a class="product-anch btn-danger btn" data-action="click->product#delete" data-product-id-param=${element.product_unique_id} >Delete</a>
      </div>
     
  </div>
  <div class="overlay">
      <a href="/carts/add_to_wishlist/${element.product_unique_id}" style="--i:1;" class="fas fa-heart index-anch"></a>
      <a href="/carts/create_cart/${element.product_unique_id}" style="--i:2;" class="fas fa-shopping-cart index-anch"></a>
  </div>
</div>
  `
  }

  search_box(){
    search_text = this.searchTextTarget.value
  
    if(search_text !=""){
    this.serachDataTarget.innerHTML            =   " "
    load_count                              =   0
 
    this.searchErrorTarget.style.display =    "none"
    this.search_dynamic_data()
    }
    else{
      this.searchErrorTarget.style.display =    "block"
    }
   
  }

//   search_data(){
//   console.log("Surya ")
// }

}
