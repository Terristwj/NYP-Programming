import { Component, OnInit } from '@angular/core';
import { ProductService } from '../shared/services/product.service';
import { Product } from '../shared/models/product';
import { ActivatedRoute, Router } from '@angular/router';
import { FormGroup, FormControl, Validators } from '@angular/forms';
import { FirebaseProductService } from '../shared/services/firebase-product.service';

@Component({
  selector: 'app-edit-product',
  templateUrl: './edit-product.page.html',
  styleUrls: ['./edit-product.page.scss'],
})

export class EditProductPage implements OnInit {
  productId: string;
  productImage: string;
  editProductForm: FormGroup;
  categories: string[]; 
  submitted: boolean;

  static positiveNumber(fc: FormControl) {
    if (fc.value <= 0) {
      return ({ positiveNumber: true });
    } else {
      return (null);
    }
  }

  constructor(private productService: FirebaseProductService
    // private productService: ProductService
    , private route: ActivatedRoute
    , private router: Router) {
    this.productId = this.route.snapshot.params.id;
    const product = this.productService.getProductById(this.productId);
    this.productImage = product.image;

    this.submitted = false;
    this.categories = ['Main', 'Beverage', 'Dessert'];
    this.editProductForm = new FormGroup({
      name: new FormControl(product.name, [Validators.required]),
      price: new FormControl(product.price, [EditProductPage.positiveNumber]),
      category: new FormControl(product.category),
      vegetarian: new FormControl(product.vegeterian)
    });
  }

  update() {
    this.submitted = true;

    if (this.editProductForm.valid) {
      const prod = new Product(this.editProductForm.value.name,
        this.editProductForm.value.price,
        this.productImage,
        this.editProductForm.value.category,
        this.editProductForm.value.vegetarian,
        this.productId);
      this.productService.update(prod);
      this.router.navigate(['/list']);
    }
  }

  ngOnInit() {
  }
}