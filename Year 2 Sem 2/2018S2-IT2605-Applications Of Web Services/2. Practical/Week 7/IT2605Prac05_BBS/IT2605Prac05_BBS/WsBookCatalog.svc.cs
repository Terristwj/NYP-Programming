using System;
using System.Collections.Generic;
using System.Collections;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;
using System.Data;
using IT2605Prac05_BBS.BLL;
using IT2605Prac05_BBS.DAL;

namespace IT2605Prac05_BBS
{
    // NOTE: You can use the "Rename" command on the "Refactor" menu to change the class name "WsBookCatalog" in code, svc and config file together.
    // NOTE: In order to launch WCF Test Client for testing this service, please select WsBookCatalog.svc or WsBookCatalog.svc.cs at the Solution Explorer and start debugging.
    public class WsBookCatalog : IWsBookCatalog
    {
        public DataSet GetBooks()
        {
            IT2605Prac05_BBS.BLL.BLLBookCatalog bizLayerBooks;

            bizLayerBooks = new IT2605Prac05_BBS.BLL.BLLBookCatalog();
            return bizLayerBooks.GetBooks();
        }

        // write GetBookDetails method here
        public DataSet GetBookDetails(int bookId)
        {
            IT2605Prac05_BBS.BLL.BLLBookCatalog bizLayerBooks;

            bizLayerBooks = new IT2605Prac05_BBS.BLL.BLLBookCatalog();
            return bizLayerBooks.GetBookDetails(bookId);
        }

        public int CreateOrders(String customerid, List<Order> eachorder)
        {
            IT2605Prac05_BBS.BLL.ProcessOrders bizLayerOrder;
            bizLayerOrder = new IT2605Prac05_BBS.BLL.ProcessOrders();
            return bizLayerOrder.VerifyOrders(customerid, eachorder);
        }
    }
}
