using BitzBytez.codes.BLL;
using BitzBytez.codes.Entities;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;

namespace BitzBytez
{
    /// <summary>
    /// Summary description for ChatSupport1
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    [System.Web.Script.Services.ScriptService]
    public class ChatSupport1 : System.Web.Services.WebService
    {

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]

        public int createConvo(int accountID, int officerID)
        {
            return ChatBLL.createConvo(accountID, officerID);
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public int getConvoID(string ID)
        {
            return ChatBLL.getConvoID(ID);
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public string getMessages(int convoID)
        {
            return JsonConvert.SerializeObject(ChatBLL.getMessages(convoID), Formatting.Indented);
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public int insertMessage(int convoID, int senderID, int recipientID, string msg)
        {
            return ChatBLL.insertMessage(convoID, senderID, recipientID, msg);
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public int getNoOfMessages(int convoID)
        {
            return ChatBLL.getNoOfMessages(convoID);
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public string getAllCSRequests()
        {
            return JsonConvert.SerializeObject(ChatBLL.getAllCSRequests());
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public int getNoOfCSRequests()
        {
            return ChatBLL.getNoOfCSRequests();
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public int updateCSRequest(int convoID, string status, int CSRequestID)
        {
            return ChatBLL.updateCSRequest(convoID, status, CSRequestID);
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public string getCSRequestDetails(int reqID)
        {
            return JsonConvert.SerializeObject(ChatBLL.getCSRequestDetails(reqID));
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public int createCSRequest(int requestorID, string reqName, string salutation, string issueDesc)
        {
            return ChatBLL.createCSRequest(requestorID, reqName, salutation, issueDesc);
        }
    }
}
