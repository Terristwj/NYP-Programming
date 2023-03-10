using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using BusinessLogicLayer;
using DataAccessLayer;
using ABCHealth.bbs_svc;

namespace ABCHealth.ShoppingCart
{
    public class ShoppingCart
    {
        public List<ShoppingCartItem> Items { get; private set; }
        //public static readonly ShoppingCart Instance;
        public static ShoppingCart Instance;
        static ShoppingCart()
        {
            if (HttpContext.Current.Session["CSharpShoppingCart"] == null)
            {
                Instance = new ShoppingCart();
                Instance.Items = new List<ShoppingCartItem>();
                HttpContext.Current.Session["CSharpShoppingCart"] = Instance;
            }
            else
            {
                Instance = (ShoppingCart)HttpContext.Current.Session["CSharpShoppingCart"];
            }
        }

        protected ShoppingCart() { }

 
        public void AddItem(int ProductID,Product prod)
        {
            //ShoppingCartItem newItem = new ShoppingCartItem(ProductID);
            ShoppingCartItem newItem = new ShoppingCartItem(ProductID, prod);

            if (Items.Contains(newItem))
            {
                foreach (ShoppingCartItem item in Items)
                {
                    if (item.Equals(newItem))
                    {
                        item.Quantity++;
                        return;
                    }
                }
            }
            else
            {
                newItem.Quantity = 1;
                Items.Add(newItem);
            }
        }

        public void SetItemQuantity(int ProductID, int quantity)
        {
            if (quantity==0)
            {
                RemoveItem(ProductID);
                return;
            }

            ShoppingCartItem updatedItem = new ShoppingCartItem(ProductID);

            foreach (ShoppingCartItem Item in Items)
            {
                if(Item.Equals(updatedItem))
                {
                    Item.Quantity = quantity;
                    return;
                }
            }
        }

        public void RemoveItem(int ProductID)
        {

            ProductBLL prodBLL = new ProductBLL();
            Product prod = null;
            prod = prodBLL.getProdDetail(ProductID);
            ShoppingCartItem removedItem = new ShoppingCartItem(ProductID,prod);

            //ShoppingCartItem removedItem = new ShoppingCartItem(ProductID);
            Items.Remove(removedItem);

        }

        public decimal GetSubTotal()
        {
            decimal subTotal = 0;
            foreach (ShoppingCartItem item in Items)
            {
                subTotal += item.TotalPrice;
            }
            return subTotal;
        }

        public void CheckStock()
        {
            List<Order> PurchaseOrder = new List<Order>();
            foreach (ShoppingCartItem item in Items)
            {
                ABCHealth.bbs_svc.Order cusOrd = new ABCHealth.bbs_svc.Order();

                ProductBLL prodBLL = new ProductBLL();

                Product prod = null;

                prod = prodBLL.getProdDetail(item.ItemID);

                if ((prod.Stock_Level - item.Quantity < prod.Reorder_Point) && (prod.Reorder_Status.Equals(String.Empty)))
                {
                    cusOrd.ordBookisbn = prod.Product_ISBN;
                    cusOrd.ordBookQty = prod.Reorder_Qty;

                    PurchaseOrder.Add(cusOrd);
                    prodBLL.updateProdRO(item.ItemID, item.Quantity);
                }
            }
            if (PurchaseOrder.Count > 0)
            {
                WsBookCatalogClient ws = new WsBookCatalogClient();
                Order[] PO = PurchaseOrder.ToArray();
                int result = ws.CreateOrders("ABCH", PO);
            }
        }

    }
}