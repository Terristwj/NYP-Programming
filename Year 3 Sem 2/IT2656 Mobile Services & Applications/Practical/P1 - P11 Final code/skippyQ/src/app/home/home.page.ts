import { Component } from '@angular/core';
import { Product } from '../shared/models/product';
import { ToastController, IonSearchbar } from '@ionic/angular';
import { isNgTemplate } from '@angular/compiler';
import { CartService } from '../shared/services/cart.service';
import { ProductService } from '../shared/services/product.service';
import { FirebaseCartService } from '../shared/services/firebase-cart.service';
import { FirebaseProductService } from '../shared/services/firebase-product.service';

@Component({
  selector: 'app-home',
  templateUrl: 'home.page.html',
  styleUrls: ['home.page.scss'],
})
export class HomePage {
  allProducts: Product[];
  products: Product[];
  constructor( public toastController: ToastController
    , private cartService: FirebaseCartService
    , private productService: FirebaseProductService
    // private productService: ProductService
    ) {
  }

  ngOnInit(){
  }
  
  ionViewDidEnter() {
    this.productService.getAllProducts().then(
      result => this.products = result
    );
  }
    
  async addToCart(item: Product){
    const toast = await this.toastController.create({
      message: item.name + ' added to cart',
      duration: 2000,
      position: 'top',
      color: 'secondary'
    });
 
    this.cartService.add(item)
    .then(() => {
      toast.present();
    })
    .catch(error => {
      toast.message = 'Error: ' + error;
      toast.present();
    });
  }

  async addToFav(item: Product){
    const toast = await this.toastController.create
    ({
      message: item.name + ' added to favourite',
      duration: 2000,
      position: 'top',
      color: 'secondary'
    });
    toast.present();
  }

  search(event){
    const text = event.target.value;
    if (text && text.trim() !== ''){
      this.products = this.allProducts.filter(
        item => item.name.toLowerCase().includes(text.toLowerCase())
      );
    } else {
      // When text is blank, show all products
      this.products = this.allProducts;
    }
  }

  refresh(event) {
    this.products = this.allProducts;
    event.target.complete();
  }
}
