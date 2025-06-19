INSERT INTO dbo.[product] ([title], [minCost],[typeProductId]) 
    SELECT   [Наименование продукции], [Минимальная стоимость для партнера], [typeProductId]
    FROM dbo.[Products_import$] inner join dbo.[productType] on dbo.[Products_import$].[Тип продукции]=dbo.[productType].[title];  

INSERT INTO dbo.[productType] ([title])
select [Тип продукции]
from [dbo].[Products_import$] group by [Тип продукции]

```
using Demka.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Remoting.Messaging;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace Demka.Pages
{
    public partial class Parthners : Page
    {
        List<Parthner> _parthners = new List<Parthner>();
        public Parthners()
        {
            InitializeComponent();
            LoadServiceGrid();
        }

        void LoadServiceGrid()
        {
            _parthners.Clear();
            var parthnerList = Helper.GetContext().Parthner.ToList();
            foreach (Parthner parthner in parthnerList)
            {
                _parthners.Add(parthner);
            }
            ParthnersGrid.ItemsSource = _parthners;
        }

        private void BtnAdd_Click(object sender, RoutedEventArgs e)
        {
            FormParthner dlg = new FormParthner(this, null);
            dlg.ShowDialog();
        }

        void CalculateProduct(int count)
        {

        }
    }
}

```

