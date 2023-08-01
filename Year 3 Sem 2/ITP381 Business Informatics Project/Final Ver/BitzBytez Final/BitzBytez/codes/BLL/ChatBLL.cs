using BitzBytez.codes.DAL;
using BitzBytez.codes.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BitzBytez.codes.BLL
{
    public class ChatBLL
    {
        public static int createConvo(int accountID, int officerID)
        {
            return ChatDA.createConvo(accountID, officerID);
        }

        public static int getConvoID(string ID)
        {
            return ChatDA.getConvoID(ID);
        }

        public static List<Message> getMessages(int convoID)
        {
            return ChatDA.getMessages(convoID);
        }

        public static int insertMessage(int convoID, int senderID, int recipientID, string msg)
        {
            return ChatDA.insertMessage(convoID, senderID, recipientID, msg);
        }

        public static int getNoOfMessages(int convoID)
        {
            return ChatDA.getNoOfMessages(convoID);
        }

        public static List<ChatSupportRequest> getAllCSRequests()
        {
            return ChatDA.getAllCSRequests();
        }

        public static int getNoOfCSRequests()
        {
            return ChatDA.getNoOfCSRequests();
        }

        public static int updateCSRequest(int convoID, string status, int CSRequestID)
        {
            return ChatDA.updateCSRequest(convoID, status, CSRequestID);
        }

        public static ChatSupportRequest getCSRequestDetails(int reqID)
        {
            return ChatDA.getCSRequestDetails(reqID);
        }

        public static int createCSRequest(int requestorID, string reqName, string salutation, string issueDesc)
        {
            return ChatDA.createCSRequest(requestorID, reqName, salutation, issueDesc);
        }
    }
}