using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DataAccessLayer;

namespace BusinessLogicLayer
{
    public class ProductBLL
    {
        public Product getProdDetail(decimal prodID)
        {
            Product prodDetail = new Product();

            return prodDetail.getProduct(prodID);
        }
        public List<Product> getAllProduct()
        {
            List<Product> allProduct = new List<Product>();
            Product product = new Product();

            allProduct = product.getProductAll();

            return allProduct;
        }

        public void updateProdRO(decimal prodID, int cartQty)
        {
            Product prodDetail = new Product();
            prodDetail.updateProductRO(prodID, cartQty);
        }
    }
}
