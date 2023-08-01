using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BitzBytez.codes.Entities
{
    public class Message
    {
        int msgID, convoID, senderID, recipientID;
        string content, dtCreated;

        public Message(int msgID, int convoID, int senderID, int recipientID, string content, string timedateCreated)
        {
            this.msgID = msgID;
            this.convoID = convoID;
            this.senderID = senderID;
            this.recipientID = recipientID;
            this.content = content;
            this.dtCreated = timedateCreated;
        }

        public int MsgID
        {
            get
            {
                return msgID;
            }

            set
            {
                msgID = value;
            }
        }

        public int ConvoID
        {
            get
            {
                return convoID;
            }

            set
            {
                convoID = value;
            }
        }

        public int SenderID
        {
            get
            {
                return senderID;
            }

            set
            {
                senderID = value;
            }
        }

        public int RecipientID
        {
            get
            {
                return recipientID;
            }

            set
            {
                recipientID = value;
            }
        }

        public string Content
        {
            get
            {
                return content;
            }

            set
            {
                content = value;
            }
        }

        public string DtCreated
        {
            get
            {
                return dtCreated;
            }

            set
            {
                dtCreated = value;
            }
        }
        
    }
}