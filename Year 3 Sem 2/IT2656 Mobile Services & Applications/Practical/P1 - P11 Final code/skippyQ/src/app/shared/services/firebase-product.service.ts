import { Injectable } from '@angular/core';
import * as firebase from 'firebase/app';
import 'firebase/firestore';
import 'firebase/storage';
import { Product } from '../models/product';

@Injectable({
  providedIn: 'root'
})
export class FirebaseProductService {
  allProducts: Product[] = [];
  
  constructor() { }

  getAllProducts() {
    const promise = new Promise<Product[]>((resolve, reject) => {
      const db = firebase.firestore();
      const storageRef = firebase.storage().ref();
 
      // Read from Firebase Database
      const productsRef = db.collection('products');
      productsRef.get().then(itemsSnapshot => {
        this.allProducts = []; // Empty array
        itemsSnapshot.forEach(doc => {
          const p = new Product(doc.data().name, doc.data().price, doc.data().image, doc.data().category);
          p.id = doc.id;
 
          // Read from Firebase Storage
          // Get the image download URL
          if (p.image && p.image.length > 0) {
            const imageRef = storageRef.child(doc.data().image);
            imageRef.getDownloadURL().then(url => {
              p.image = url;
            }).catch(error => {
              console.log('Error: Read image fail ' + error);
            }).finally(() => {
                   // Add to array with image
              this.allProducts.push(p);
            });
          } else {
            // Add to array without image
            this.allProducts.push(p);
          }
        });
        // Fulfil promise by returning the product array
        resolve(this.allProducts);
      });
    });
    return promise;
  }

  getProductById(id: string): Product {
    const result = this.allProducts.find(
      item => item.id === id
    );
    return result;
   }

  add(product: Product) {
    const promise = new Promise<string>((resolve, reject) => {
    const db = firebase.firestore();
    const productsRef = db.collection('products/');

      // Add to Database
      productsRef.add({
        name: product.name,
        price: product.price,
        image: product.image,
        category: product.category
      }).then(docRef => {
        console.log('add new product ' + docRef.id + ' with name ' + product.name);
 
        // Add image to Storage
        if (product.image && product.image.length > 0) {
          const storageRef = firebase.storage().ref();
          const imageRef = storageRef.child(product.image);
          imageRef.put(product.imageFile).then(snapshot => {
            console.log('Uploaded image ' + product.image);
          });
        }
 
        // Fulfil promise by returning the Database generated unique id
        resolve(docRef.id);
      });
    });
    return promise;
  }

  update(product: Product) { 
    const db = firebase.firestore();
    const itemRef = db.collection('products/').doc(product.id);
    // Update everything except the id (which is the unique key)
    // Image and vegetarian is not updated in this simple example
    itemRef.update({
      name: product.name,
      price: product.price,
      category: product.category,
      // vegetarian: product.vegetarian
    });
  }
}
