export class User {
    photoURL: string;
  
    constructor(
      public name?: string,
      public email?: string,
      public password?: string
    ) { }
  }