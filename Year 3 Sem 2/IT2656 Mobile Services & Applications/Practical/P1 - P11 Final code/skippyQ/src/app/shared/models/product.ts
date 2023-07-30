export class Product {
    name: string;
    price: number;
    image: string;
    imageFile: File; // Image file
    category: string;
    vegeterian: boolean;
    id: string;

    constructor(name: string, price: number, image: string
        , category?: string, vegeterian?: boolean
        , id?: string) {
        this.name = name;
        this.price = price;
        this.image = image;
        this.category = category;
        this.vegeterian = vegeterian;
        this.id = id;

         // Add an image placeholder if there's no image
        if (this.image === undefined) {
            switch (this.category) {
                case 'Main':
                    this.image = 'assets/image/main.png';
                    break;
                case 'Beverage':
                    this.image = 'assets/image/beverage.png';
                    break;
                case 'Dessert':
                    this.image = 'assets/image/dessert.png';
                    break;
                default:
                    this.image = 'assets/icon/icon.png';
            }
        }
    }
}