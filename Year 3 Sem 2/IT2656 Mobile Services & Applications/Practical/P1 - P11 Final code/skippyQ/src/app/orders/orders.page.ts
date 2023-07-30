import { Component, OnInit } from '@angular/core';
import { BarcodeScanner } from '@ionic-native/barcode-scanner/ngx';
import { FirebaseCartService } from '../shared/services/firebase-cart.service';
import { CartItem } from '../shared/models/cartitem';

@Component({
  selector: 'app-orders',
  templateUrl: './orders.page.html',
  styleUrls: ['./orders.page.scss'],
})
export class OrdersPage implements OnInit {
  orderItems: CartItem[];
  orderId = '';

  constructor(private barcodeScanner: BarcodeScanner,
    private cartService: FirebaseCartService) { }

  ngOnInit() {
  }

  scan() {
    this.barcodeScanner.scan().then(barcodeData => {
    this.orderId = barcodeData.text;
     this.retrieveOrder(this.orderId);
    }).catch(err => {
        alert('Error ' + err);
    });
 }

 retrieveOrder(orderId) {
   this.cartService.getCartOrderById(orderId).then(items => {
     this.orderItems = items;
   });
 }
}
