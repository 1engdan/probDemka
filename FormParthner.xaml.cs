using Demka.Model;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
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
    /// Логика взаимодействия для FormParthner.xaml
    /// </summary>
    public partial class FormParthner : Page
    {
        private parthner _currentParthner;
        private readonly Parthners _parentWindow;
        private bool _isNewParthner = true;

        public FormParthner(Parthners parent, parthner parthnerToEdit)
        {
            InitializeComponent();
            _parentWindow = parent;

            // Если передан партнер - режим редактирования, иначе - создание нового
            _currentParthner = parthnerToEdit ?? new parthner();
            _isNewParthner = parthnerToEdit == null;

            // Загружаем данные формы
            if (parthnerToEdit != null)
                LoadFormData();
        }

        private void LoadFormData()
        {
            try
            {
                using (var context = Helper.GetContext())
                {
                    // Загружаем типы партнеров для ComboBox
                    CbCost.ItemsSource = context.parthnerType.ToList();
                    CbCost.DisplayMemberPath = "title";
                    CbCost.SelectedValuePath = "TypeId";

                    // Если редактируем существующего партнера
                    if (!_isNewParthner)
                    {
                        // Показываем поле ID
                        PanelID.Visibility = Visibility.Visible;
                        TBID.Text = _currentParthner.parthnerId.ToString();

                        // Заполняем остальные поля
                        TBTitle.Text = _currentParthner.title;
                        TBSurname.Text = _currentParthner.surname;
                        TBName.Text = _currentParthner.name;
                        TBPatronymic.Text = _currentParthner.patronymic;
                        TBPhone.Text = _currentParthner.phone;
                        TBEmail.Text = _currentParthner.mail;
                        TBTime.Text = _currentParthner.rate.ToString();
                        TBDescription.Text = _currentParthner.address;

                        // Устанавливаем тип партнера
                        CbCost.SelectedValue = _currentParthner.parthnerType.typeId;
                    }
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show($"Ошибка загрузки данных: {ex.Message}", "Ошибка",
                              MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }

        private void BtnSave_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                // Валидация обязательных полей
                if (string.IsNullOrWhiteSpace(TBTitle.Text))
                {
                    MessageBox.Show("Введите наименование партнера!", "Ошибка",
                                  MessageBoxButton.OK, MessageBoxImage.Warning);
                    return;
                }

                // Обновляем данные партнера
                _currentParthner.title = TBTitle.Text;
                _currentParthner.surname = TBSurname.Text;
                _currentParthner.name = TBName.Text;
                _currentParthner.patronymic = TBPatronymic.Text;
                _currentParthner.phone = TBPhone.Text;
                _currentParthner.mail = TBEmail.Text;
                _currentParthner.address = TBDescription.Text;

                if (int.TryParse(TBTime.Text, out int rate))
                    _currentParthner.rate = rate;

                if (CbCost.SelectedValue != null)
                    _currentParthner.parthnerType.typeId = (int)CbCost.SelectedValue;

                using (var context = Helper.GetContext())
                {
                    if (_isNewParthner)
                    {
                        // Добавляем нового партнера
                        context.parthner.Add(_currentParthner);
                        MessageBox.Show("Новый партнер успешно создан!", "Успех",
                                       MessageBoxButton.OK, MessageBoxImage.Information);
                    }
                    else
                    {
                        // Обновляем существующего партнера
                        context.Entry(_currentParthner).State = EntityState.Modified;
                        MessageBox.Show("Данные партнера обновлены!", "Успех",
                                      MessageBoxButton.OK, MessageBoxImage.Information);
                    }

                    context.SaveChanges();

                    // Обновляем список в родительском окне
                    _parentWindow.LoadServiceGrid();

                    // Закрываем текущую страницу
                    NavigationService?.GoBack();
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show($"Ошибка при сохранении: {ex.Message}", "Ошибка",
                              MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }
    }
}
