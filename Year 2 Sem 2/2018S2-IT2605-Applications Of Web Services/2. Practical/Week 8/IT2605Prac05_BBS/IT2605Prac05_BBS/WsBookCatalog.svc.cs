using System;
using System.Collections.Generic;
using System.Collections;
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
        public MsgContractResponseDataSet GetBooks(MsgContractRequestGetBooks req)
        {
            BLLBookCatalog bizLayerBooks;
            MsgContractResponseDataSet resp;

            // bizLayerBooks = new BLLBookCatalog();
            resp = new MsgContractResponseDataSet();
            ValidateRetailer bllRetailer = new ValidateRetailer();
            // resp.results = bizLayerBooks.GetBooks();

            if (bllRetailer.isValidUser(req.user, req.password))
            {
                if (bllRetailer.isAppUser(req.user))
                {
                    bizLayerBooks = new BLLBookCatalog();
                    resp.results = bizLayerBooks.GetBooks();
                    return resp;
                }
                else
                {
                    throw new FaultException("Not authorised", new FaultCode("AuthorisationFail"));
                }
            }
            else
            {
                throw new FaultException("Invalid crdential", new FaultCode("AuthenticationFail"));
            }
        }

        public MsgContractResponseDataSet GetBookDetails(MsgContractRequestGetBookDetails req)
        {
            BLLBookCatalog bizLayerBooks;
            MsgContractResponseDataSet resp;

            bizLayerBooks = new BLLBookCatalog();
            resp = new MsgContractResponseDataSet();
            resp.results = bizLayerBooks.GetBookDetails(req.bookId);
            return resp;
        }

        public int CreateOrders(String customerid, List<Order> eachorder)
        {
            
            ProcessOrders bizLayerOrder ;
            bizLayerOrder = new ProcessOrders();
            return bizLayerOrder.VerifyOrders(customerid, eachorder);

            
        }
    }
}
