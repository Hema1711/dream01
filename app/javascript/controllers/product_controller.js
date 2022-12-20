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
            <div class="image">
                <img src="/assets/bed-sheet-2.jpg" alt="">
            </div>
            <div class="info">
              <a class="index-anch" href="/products/single_product/${element.id}">
                <h3>${element.product_name}</h3> </a>
                <a class="product-edit-anch btn-info btn" href="/products/edit_product/${element.id}">Edit</a>
                <div class="subInfo">
               
                    <strong class="price"> ${element.price}/- <span>${element.price}/-</span> </strong>
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
                <a href="#" style="--i:1;" class="fas fa-heart index-anch"></a>
                <a href="#" style="--i:2;" class="fas fa-shopping-cart index-anch"></a>
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
            <img src="/assets/bed-sheet-8.jpg" alt="">
        </div>

        <div class="small-image">
            <img class="image-active" src="/assets/bed-sheet-9.jpg" alt="">
            <img src="/assets/bed-sheet-2.jpg" alt="">
            <img src="/assets/bed-sheet-3.jpg" alt="">
            <img src="/assets/bed-sheet-7.jpg" alt="">
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
      <strong class="price">${data.price}<span>₹1500</span> </strong>
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
            <img src="/assets/bed-sheet-1.jpg" alt="">
        </div>
        <div class="info">
            <h3>${element.product_name}</h3>
            <div class="subInfo">
                <strong class="price">${element.price}</strong>
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
