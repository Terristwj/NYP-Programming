using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using IT2605Prac05_ACME.SvcRefBetterBookSupplier;

namespace IT2605Prac05_ACME.DAL
{
    public class DalBetterBookSupplier
    {
        public DataSet GetBooks()
        {
            WsBookCatalogClient betterBookSupplierClient;
            betterBookSupplierClient = new WsBookCatalogClient();
            return betterBookSupplierClient.GetBooks();
        }

        public DataSet GetBookDetails(int bookId)
        {
            WsBookCatalogClient betterBookSupplierClient;
            betterBookSupplierClient = new WsBookCatalogClient();
            return betterBookSupplierClient.GetBookDetails(bookId);
        }
    }
}