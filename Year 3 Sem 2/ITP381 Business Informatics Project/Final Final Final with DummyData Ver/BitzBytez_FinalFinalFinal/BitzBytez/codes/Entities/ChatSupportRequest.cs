using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BitzBytez.codes.Entities
{
    public class ChatSupportRequest
    {
        private int id, requestorID, convoID;
        private string requestorName, salutation, issueDescription, status, dateTimeCreated;
        public ChatSupportRequest(int id, int reqID, string reqName, string sal, string issueDesc, int convoID, string status, string dtc)
        {
            this.id = id;
            this.requestorID = reqID;
            this.convoID = convoID;
            this.requestorName = reqName;
            this.salutation = sal;
            this.issueDescription = issueDesc;
            this.status = status;
            this.dateTimeCreated = dtc;
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

        public string DateTimeCreated
        {
            get
            {
                return dateTimeCreated;
            }

            set
            {
                dateTimeCreated = value;
            }
        }

        public int Id
        {
            get
            {
                return id;
            }

            set
            {
                id = value;
            }
        }

        public string IssueDescription
        {
            get
            {
                return issueDescription;
            }

            set
            {
                issueDescription = value;
            }
        }

        public int RequestorID
        {
            get
            {
                return requestorID;
            }

            set
            {
                requestorID = value;
            }
        }

        public string RequestorName
        {
            get
            {
                return requestorName;
            }

            set
            {
                requestorName = value;
            }
        }

        public string Salutation
        {
            get
            {
                return salutation;
            }

            set
            {
                salutation = value;
            }
        }

        public string Status
        {
            get
            {
                return status;
            }

            set
            {
                status = value;
            }
        }
    }
}