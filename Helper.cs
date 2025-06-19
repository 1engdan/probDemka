using Demka.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Demka
{
    public class Helper
    {
        public static master_paulEntities ent;
        public static master_paulEntities GetContext()
        {
            if (ent == null)
            {
                ent = new master_paulEntities();
            }
            return ent;
        }
    }
}
