import { Injectable } from '@angular/core';
import 'firebase/firestore';
import { AuthService } from './auth.service';
import { Product } from '../models/product';
import { CartItem } from '../models/cartitem';
import * as firebase from 'firebase';

@Injectable({
  providedIn: 'root'
})
export class FirebaseCartService {

  constructor(private authService: AuthService) { }

  getCartId() {
    const promise = new Promise<string>((resolve, reject) => {
      const db = firebase.firestore();

      // Get the current user
      const user = this.authService.getCurrentUser();

      // Get the 'incomplete' cart (not checked out yet) of the current user
      if (user !== undefined && user.email !== undefined && user.email.trim().length > 0) {
        const query = db.collection('carts/')
          .where('user', '==', user.email)
          .where('status', '==', 'incomplete')
          .limit(1);

        query.get().then(querySnapshot => {
          if (querySnapshot.empty) {
            // No cart exists, create a new cart
            const cartsRef = db.collection('carts/');
            cartsRef.add({
              user: user.email,
              status: 'incomplete'
            }).then(docRef => {
              console.log('add new cart ' + docRef.id + ' for  email ' + user.email);
              resolve(docRef.id);
            });
          } else {
            // Get exising cart id
            resolve(querySnapshot.docs[0].id);
          }
        });
      } else {
        reject('Not logged in');
      }
    });
    return promise;
  }

  getCartItems() {
    const promise = new Promise<CartItem[]>((resolve, reject) => {
      this.getCartId().then(cartId => {
        const db = firebase.firestore();
 
        // Read from the DB
        const cartRef = db.collection('carts/' + cartId + '/items');
        cartRef.get().then(itemsSnapshot => {
          const cart: CartItem[] = []; // Empty cart
          itemsSnapshot.forEach(doc => {
            const p = new Product(doc.data().name, doc.data().price, '');
            p.id = doc.id;
            const c = new CartItem(p, doc.data().quantity);
            cart.push(c); // Add to cart
          });
          resolve(cart); // Return cart as result of promise
        });
      }).catch(error => { });
    });
    return promise;
  }

  add(product: Product) {
    const promise = new Promise<void>((resolve, reject) => {
      this.getCartId().then(cartId => {
        const db = firebase.firestore();
 
        // Check if product exists in the DB
        const itemRef = db.collection('carts/' + cartId + '/items/').doc(product.id);
        itemRef.get().then(itemSnapshot => {
          if (itemSnapshot.exists) {
            // Update product quantity (+1) to DB
            itemRef.update({
              quantity: itemSnapshot.data().quantity + 1
            });
          } else {
            // Add to DB set the id using product id
            itemRef.set({
              quantity: 1,
              name: product.name,
              price: product.price
            });
          }
          resolve(); // Promise fulfilled
        });
      }).catch(error => reject(error));
    });
    return promise;
  }

  remove(item: CartItem) {
    const promise = new Promise<void>((resolve, reject) => {
      this.getCartId().then(cartId => {
        const db = firebase.firestore();
 
        // Check if product exists in the DB
        const itemRef = db.collection('carts/' + cartId + '/items/').doc(item.product.id);
        itemRef.get().then(itemSnapshot => {
          if (itemSnapshot.exists) {
            // Remove product from cart in DB
            itemRef.delete();
            resolve(); // Promise fulfilled
          }
        });
      }).catch(error => { });
    });
    return promise;
  }

  checkout() { 
    const promise = new Promise<void>((resolve, reject) => {
      this.getCartId().then(cartId => {
        const db = firebase.firestore();
        // Update cart status to 'ordered' in DB
        const cartRef = db.collection('carts/').doc(cartId);
        cartRef.update({
          status: 'ordered'
        });
        resolve();
      });
    });
    return promise;
  }

  getCartOrderById(cartId: string) {
    const promise = new Promise<CartItem[]>((resolve, reject) => {
      const db = firebase.firestore();
 
      // Read from the DB
      const cartRef = db.collection('carts/' + cartId + '/items');
      cartRef.get().then(itemsSnapshot => {
      const cart: CartItem[] = []; // Empty cart
      itemsSnapshot.forEach(doc => {
        const p = new Product(doc.data().name, doc.data().price, '');
        p.id = doc.id;
        const c = new CartItem(p, doc.data().quantity);
        cart.push(c); // Add to cart
      });
      resolve(cart); // Return cart as result of promise
      }).catch(error => { });
    });
    return promise;
  }
}
