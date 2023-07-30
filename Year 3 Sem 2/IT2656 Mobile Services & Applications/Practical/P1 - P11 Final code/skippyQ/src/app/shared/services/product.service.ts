import { Injectable } from '@angular/core';
import { Product } from '../models/product';

@Injectable({
  providedIn: 'root'
})
export class ProductService {
  allProducts: Product[] = [];
  constructor() { 
    this.allProducts = [
      new Product('Burger', 6.7, 'assets/burger.jpg', 'Main', false, '5'),
      new Product('Coffee', 5.9, 'assets/coffee.jpeg', 'Beverage', true, '1'),
      new Product('Rainbow Shake', 7.2, 'assets/mermaid.jpg', 'Beverage', true, '1'),
      new Product('Sandwich', 5.5, 'assets/sandwich.jpg', 'Main', false, '4'),
      new Product('Taco', 4.5, 'assets/taco.jpeg', 'Main', false, '3')
    ]
  }

  getAllProducts() {
    const promise = new Promise<Product[]>((resolve, reject) => {
      resolve(this.allProducts);
    });
    return promise;
  }
  
  getProductById(id: string): Product {
    const result = this.allProducts.find(
      item => item.id === id
    );
    return result;
  }

  add(product: Product){
    const id = this.allProducts.length + 100;
    product.id = id.toString();
    this.allProducts.push(product);
  }

  update(product: Product) {
    // Find the array index which starts from 0
    const index = this.allProducts.findIndex(
      item => item.id === product.id
    );

    const ref = this.allProducts[index];
    // Update everything except the id (which is the unique key)
    ref.name = product.name;
    ref.price = product.price;
    ref.image = product.image;
    ref.category = product.category;
    ref.vegeterian = product.vegeterian;
  }
}
