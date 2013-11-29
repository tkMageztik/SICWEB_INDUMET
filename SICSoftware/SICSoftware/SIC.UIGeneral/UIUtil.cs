using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using SIC.Data;

namespace SIC.UIGeneral
{
    public class UIUtil
    {
        public UIUtil()
        {

        }

        public static List<int> EnumToList<T>()
        {
            List<int> list = Enum.GetValues(typeof(T))
                           .Cast<int>().ToList();

            return list;
        }
    }
}
