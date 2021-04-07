import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Utils{
  static List<Locale> supportedLanguages = [Locale("tr", "TR"), Locale("en", "US")];
  static Locale currentLocale = Locale("tr");

  static DateFormat _dateFormatter = DateFormat.yMd('tr');
  static NumberFormat _formatCurrency = NumberFormat.currency(locale: "TR", symbol: "₺");

  static String currencyFormat(double price) => _formatCurrency.format(price);

  static String dateFormat(DateTime date) => _dateFormatter.format(date);

  static bool isContainsDate(DateTime date, List<DateTime> listDate) {
    return listDate.where((element) => element == date).length > 0;
  }

  static List<DateTime> getBetweenTwoDates({DateTime startDate, DateTime endDate}) {
    List<DateTime> listDate = [];
    for (int i = 0; i <= startDate.difference(endDate).abs().inDays; i++) {
      listDate.add(startDate.add(Duration(days: i)));
    }
    return listDate;
  }

  static List<DateTime> getOverlapsDates({List<DateTime> firstDates, List<DateTime> secondDates}) {
    return secondDates.where((element) => secondDates.contains(element)).toList();
  }

  static String nameAvatar(String fullName) => fullName.split(' ').length > 1 ? fullName.split(' ')[0] + fullName.split(' ')[1] : fullName.split(' ')[0];

  static bool hasOwnProperty(Map map, Object key) => map.keys.where((element) => element == key).length > 0;

}