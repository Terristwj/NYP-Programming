import { Component, OnInit } from '@angular/core';
import { CartItem } from '../shared/models/cartitem';
import { CartService } from '../shared/services/cart.service';
import { FirebaseCartService } from '../shared/services/firebase-cart.service';
import { BarcodeScanner } from '@ionic-native/barcode-scanner/ngx';

@Component({
  selector: 'app-cart',
  templateUrl: './cart.page.html',
  styleUrls: ['./cart.page.scss'],
})
export class CartPage implements OnInit {
  cart: CartItem[];
  constructor(private cartService: FirebaseCartService,
    private barcodeScanner: BarcodeScanner) { }

  ngOnInit() {
    this.cartService.getCartItems().then(
      result =>  this.cart = result
    );
  }

  delete(item: CartItem){
    // this.cartService.remove(item);
    this.cartService.remove(item).then(() => {
      // Refresh the cart after remove
      this.cartService.getCartItems().then(
        result =>  this.cart = result
      );
    });
  }

  checkout(){
    this.cartService.checkout().then((cartId) => {
 
      // Refresh the cart after check out
      this.cartService.getCartItems().then(
        result =>  this.cart = result
      );
 
      // Show a QR code
      this.barcodeScanner.encode(this.barcodeScanner.Encode.TEXT_TYPE, cartId).then(result => {
         console.log('Encode QR ' + result);
      })
      .catch(err => {
        alert('Error ' + err);
      });
 
    });
  }
}
