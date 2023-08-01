using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BitzBytez.codes.Entities
{
    public class CategoryPair
    {
        string category, displayType;

        public CategoryPair(string category, string displayType)
        {
            this.category = category;
            this.displayType = displayType;
        }

        public string Category
        {
            get
            {
                return category;
            }

            set
            {
                category = value;
            }
        }

        public string DisplayType
        {
            get
            {
                return displayType;
            }

            set
            {
                displayType = value;
            }
        }
    }
}