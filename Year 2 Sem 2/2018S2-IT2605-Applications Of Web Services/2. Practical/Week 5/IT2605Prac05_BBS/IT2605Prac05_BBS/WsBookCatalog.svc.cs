using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;
using System.Data;
using IT2605Prac05_BBS.BLL;

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

        public DataSet GetBookDetails(int bookId)
        {
            IT2605Prac05_BBS.BLL.BLLBookCatalog bizLayerBooks;
            bizLayerBooks = new IT2605Prac05_BBS.BLL.BLLBookCatalog();
            return bizLayerBooks.GetBookDetails(bookId);
        }
    }
}
