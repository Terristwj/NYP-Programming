import { Injectable } from '@angular/core';
import { CartItem } from '../models/cartitem';
import { Product } from '../models/product';

@Injectable({
  providedIn: 'root'
})
export class CartService {
  cart: CartItem[] = [];
  constructor() { }

  getCartItems(): CartItem[]{
    return this.cart;
  }

  add(product: Product){
    // if product is found in cart, increase quantity
    let found = false;
    for (const index in this.cart){
      if(this.cart[index].product === product){
        this.cart[index].quantity++;
        found = true;
        break;
      }
    }

    //if product not in cart, add with quantity 1
    if (!found){
      this.cart.push(new CartItem(product, 1))
    }
  }

  remove(item: CartItem){
    this.cart.splice(this.cart.indexOf(item), 1);
  }
}
