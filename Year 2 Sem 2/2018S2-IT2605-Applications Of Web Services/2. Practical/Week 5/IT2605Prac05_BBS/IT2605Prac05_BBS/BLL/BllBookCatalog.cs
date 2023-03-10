using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using IT2605Prac05_BBS.DAL;

namespace IT2605Prac05_BBS.BLL
{
    public class BLLBookCatalog
    {
        public DataSet GetBooks()
        {
            DalBooks dataLayerBooks;

            dataLayerBooks = new DalBooks();
            return dataLayerBooks.GetAll();
        }

        public DataSet GetBookDetails(int bookId)
        {
            DalBooks dataLayerBooks;

            dataLayerBooks = new DalBooks();
            return dataLayerBooks.GetBookDetails(bookId);
        }
    }
}