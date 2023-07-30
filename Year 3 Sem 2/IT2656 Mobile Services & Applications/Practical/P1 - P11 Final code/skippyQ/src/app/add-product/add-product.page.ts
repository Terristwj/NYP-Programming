import { Component, OnInit } from '@angular/core';
import { FormGroup, FormControl, Validators } from '@angular/forms';
import { Product } from '../shared/models/product';

import { ProductService } from '../shared/services/product.service';
import { FirebaseProductService } from '../shared/services/firebase-product.service';

@Component({
  selector: 'app-add-product',
  templateUrl: './add-product.page.html',
  styleUrls: ['./add-product.page.scss'],
})
export class AddProductPage implements OnInit {
  addProductForm: FormGroup;
  categories: string[];
  submitted: boolean;

  image: string | ArrayBuffer;
  imageFile: File;

  static positiveNumber(fc: FormControl){
    if (fc.value <= 0){
      return ({positiveNumber: true});
    } else{
      return (null);
    }
  }

  constructor(private productService: FirebaseProductService
    // private productService: ProductService
    ) { 
    this.categories = ['Main', 'Beverage', 'Dessert'];
    this.addProductForm = new FormGroup({
      name: new FormControl('', [Validators.required]),
      price: new FormControl(0, [AddProductPage.positiveNumber]),
      category: new FormControl('Main'),
      vegeterian: new FormControl(false),
      image: new FormControl()
    });
  }

  add(){
    this.submitted = true;

    if (this.addProductForm.valid){
      let imageName = '';
      if (this.imageFile) {
        imageName = this.imageFile.name;
      }

      const prod = new Product(this.addProductForm.value.name,
        this.addProductForm.value.price,
        imageName,
        this.addProductForm.value.category,
        this.addProductForm.value.vegeterian
      );
      prod.imageFile = this.imageFile;
      this.productService.add(prod);
    }
  }

  ngOnInit() {
  }

  changeFile(event) {
    // Save the file to add in DB later when user click on 'Add' button
   this.imageFile = event.target.files[0];

   // Show the image on the page
   const fileReader = new FileReader();
   fileReader.readAsDataURL(this.imageFile);
   fileReader.onloadend = (e) => {
     this.image = fileReader.result;
  };

 }

}
