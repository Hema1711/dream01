import { Controller } from "@hotwired/stimulus"
var load_count    =   0
var search_text   =   ""
// Connects to data-controller="product"
export default class extends Controller {
  static targets  =   ["newArrival","featuredProduct","productGallery"]

  connect() {
    this.new_arrival_products()  
    this.featured_product()
    this.product_gallery()
  }


  new_arrival_products() {

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
    
      data.forEach(element => {
       
             detail                                  =   detail + this.new_arrival_products_dynamic(element)
            });
            this.newArrivalTarget.insertAdjacentHTML("beforeend",detail)
    })
   
    }

    new_arrival_products_dynamic(element){ 
      return`
      <div class="box">
            <div class="image ">
                <img src=${element.product_image5.url} alt="">
            </div>
            <div class="info">
              <a class="index-anch-new-arrival" href="/products/single_product/${element.product_unique_id}">
                <h3>${element.product_name}</h3> </a>
                <a class="product-edit-anch btn-info btn" href="/products/edit_product/${element.product_unique_id}">Edit</a>
                <a class="product-del-anch btn-danger btn" href="/products/delete_product/${element.product_unique_id}">Delete</a>
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
               
            </div>
            <div class="overlay">
                <a href="/carts/add_to_wishlist" style="--i:1;" class="fas fa-heart index-anch"></a>
                <a href="/carts/create_cart/${element.product_unique_id}" style="--i:2;" class="fas fa-shopping-cart index-anch"></a>
            </div>
        </div>
      `
    }


    featured_product(){
      fetch("/products/featured_product", {
        headers: { "content-type": "application/json; charset=UTF-8" }
  
      })
  
      .then(result=> result.json())
      .then(data=> {
        var detail                                =   ''
               detail                                  =  this.featured_product_dynamic(data)
               this.featuredProductTarget.insertAdjacentHTML("beforeend",detail) 
      })
    }

    featured_product_dynamic(data){
      return`
      <div class="image-container">
        <div class="big-image">
            <img src="${data.product_image2.url}" alt="">
        </div>

        <div class="small-image">
            <img class="image-active" src="${data.product_image3.url}" alt="">
            <img src="${data.product_image1.url}" alt="">
            <img src="${data.product_image3.url}" alt="">
            <img src="${data.product_image5.url}" alt="">
        </div>

      </div>

    <div class="content">

      <h3>${data.product_name}</h3>
      <div class="stars">
          <i class="fas fa-star"></i>
          <i class="fas fa-star"></i>
          <i class="fas fa-star"></i>
          <i class="fas fa-star"></i>
          <i class="fas fa-star"></i>
          <span>(500+) reviews</span>
      </div>
      <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Assumenda, at!</p>
      <strong class="price">₹ ${data.product_price}<span>₹1500</span> </strong>
      <a href="#"><button class="btn-index">buy now</button></a>

    </div>
      `
    }

    product_gallery(){
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
      
        data.forEach(element => {
         
               detail                                  =   detail + this.product_gallery_dynamic(element)
              });
              this.productGalleryTarget.innerHTML = detail
      })
    }

    product_gallery_dynamic(element){
      return`
      <div class="box phone">
        <div class="image">
            <img src="${element.product_image1.url}" alt="">
        </div>
        <div class="info">
            <h3>${element.product_name}</h3>
            <div class="subInfo">
                <strong class="price">₹ ${element.product_price}</strong>
                <div class="stars">
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star-half"></i>
                </div>
            </div>
        </div>
      </div>
      `
    }

}
