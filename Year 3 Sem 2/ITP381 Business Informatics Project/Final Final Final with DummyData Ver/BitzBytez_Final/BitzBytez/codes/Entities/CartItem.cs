using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BitzBytez.codes.Entities
{
	public class CartItem
	{
        private string thumbnailURL, itemName;
        double price;
        int cartItemID, comboID, quantity, stockLevel;
        public CartItem(int cartitemid, int comboid, int qtyLeft, string url, string itemname, double price_, int qty)
        {
            this.cartItemID = cartitemid;
            this.comboID = comboid;
            this.stockLevel = qtyLeft;
            this.thumbnailURL = url;
            this.itemName = itemname;
            this.price = price_;
            this.quantity = qty;
        }

        public int ComboID
        {
            get
            {
                return comboID;
            }

            set
            {
                comboID = value;
            }
        }

        public string ItemName
        {
            get
            {
                return itemName;
            }

            set
            {
                itemName = value;
            }
        }

        public double Price
        {
            get
            {
                return price;
            }

            set
            {
                price = value;
            }
        }

        public int Quantity
        {
            get
            {
                return quantity;
            }

            set
            {
                quantity = value;
            }
        }

        public string ThumbnailURL
        {
            get
            {
                return thumbnailURL;
            }

            set
            {
                thumbnailURL = value;
            }
        }

        public int StockLevel
        {
            get
            {
                return stockLevel;
            }

            set
            {
                stockLevel = value;
            }
        }

        public int CartItemID
        {
            get
            {
                return cartItemID;
            }

            set
            {
                cartItemID = value;
            }
        }
    }
}