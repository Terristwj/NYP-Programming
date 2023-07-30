import { Component } from '@angular/core';

import { Platform, MenuController, ModalController } from '@ionic/angular';
import { SplashScreen } from '@ionic-native/splash-screen/ngx';
import { StatusBar } from '@ionic-native/status-bar/ngx';

import * as firebase from 'firebase/app';
import 'firebase/auth';
import { LoginPage } from './login/login.page';
import { AuthService } from './shared/services/auth.service';

@Component({
  selector: 'app-root',
  templateUrl: 'app.component.html',
  styleUrls: ['app.component.scss']
})
export class AppComponent {
  public appPages = [
    {
      title: 'Home',
      url: '/home',
      icon: 'home'
    },
    {
      title: 'List',
      url: '/list',
      icon: 'list'
    },
    {
      title: 'Cart',
      url: '/cart',
      icon: 'cart'
    }
  ];

  public appPagesAuthenticated = [
    {
      title: 'Home',
      url: '/home',
      icon: 'home'
    },
    {
      title: 'List',
      url: '/list',
      icon: 'list'
    },
    {
      title: 'Cart',
      url: '/cart',
      icon: 'cart'
    },
    {
      title: 'Profile',
      url: '/profile',
      icon: 'happy'
    }
  ];

  constructor(
    private platform: Platform,
    private splashScreen: SplashScreen,
    private statusBar: StatusBar,
    private menuController: MenuController,
    private modalController: ModalController
  ) {
    this.initializeApp();
  }

  initializeApp() {
    this.platform.ready().then(() => {
      this.statusBar.styleDefault();
      this.splashScreen.hide();

      const firebaseConfig = {
        apiKey: "AIzaSyDnUrODXFhzrtVEhRpZYQZY63k4y5QOKtM",
        authDomain: "skippy-q-demo.firebaseapp.com",
        databaseURL: "https://skippy-q-demo.firebaseio.com",
        projectId: "skippy-q-demo",
        storageBucket: "skippy-q-demo.appspot.com",
        messagingSenderId: "693144192636",
        appId: "1:693144192636:web:b044cea5c78ed6077debf9"
      };
      // Initialize Firebase
      firebase.initializeApp(firebaseConfig);
      AuthService.initialize();

      firebase.auth().onAuthStateChanged((firebaseUser: firebase.User) => {
        if (firebaseUser) {
          this.menuController.enable(true, 'authenticated');
        } else {
          this.menuController.enable(true, 'unauthenticated');
        }
      });

      firebase.auth().onAuthStateChanged((firebaseUser: firebase.User) => {
        let menuId = 'unauthenticated';
        if (firebaseUser) {
          if (firebaseUser.email === 'admin@nyp.sg') {
            menuId = 'admin';
          } else {
            menuId = 'authenticated';
          }
        }
        this.menuController.enable(true, menuId);
      });
    });
  }
  
  async login() {
    const modal = await this.modalController.create({
      component: LoginPage
    });
    return await modal.present();
  }
}
