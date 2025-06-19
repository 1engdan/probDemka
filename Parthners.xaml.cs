using Demka.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Remoting.Contexts;
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
    /// <summary>
    /// Логика взаимодействия для Parthners.xaml
    /// </summary>
    public partial class Parthners : Page
    {
        List<parthner> _parthners = new List<parthner>();
        public Parthners()
        {
            InitializeComponent();
            LoadServiceGrid();
        }

        public void LoadServiceGrid()
        {
            _parthners.Clear();
            var parthnerList = Helper.GetContext().parthner.ToList();
            foreach (parthner parthner in parthnerList)
            {
                int totalSales = Helper.GetContext().parthnerProduct
                    .Where(pp => pp.parthnerId == parthner.parthnerId)
                    .Sum(pp => pp.count);

                parthner.discount = CalculateDiscountPercentage(totalSales);
                _parthners.Add(parthner);
            }
            ParthnersGrid.ItemsSource = _parthners;
        }

        private void BtnAdd_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.Navigate(new FormParthner(this, new parthner()));
        }

        public int CalculateTotalSales(int partnerId)
        {
            using (var context = Helper.GetContext())
            {
                return context.parthnerProduct
                    .Where(pp => pp.parthnerId == partnerId)
                    .Sum(pp => pp.count);
            }
        }

        public int CalculateDiscountPercentage(int totalSales)
        {
            if (totalSales >= 300000) return 15;
            if (totalSales >= 50000) return 10;
            if (totalSales >= 10000) return 5;
            return 0;
        }

        private void ParthnersGrid_MouseDown(object sender, MouseButtonEventArgs e)
        {
            // Проверяем, выбран ли клиент
            parthner selectedPartner = ParthnersGrid.SelectedItem as parthner;
            if (selectedPartner == null)
            {
                MessageBox.Show("Выберите партнера для редактирования");
                return;
            }
            NavigationService.Navigate(new FormParthner(this, selectedPartner));
        }
    }
}
