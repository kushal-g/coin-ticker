import 'dart:convert';

import "package:http/http.dart" as http;

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

class CoinData {
  static Future<List<String>> getCoinData(String selectedCurrency)async{
    List<String> prices = List<String>();
    String url;
    for(int i=0;i<cryptoList.length;i++){
      
      url = 'https://apiv2.bitcoinaverage.com/indices/global/ticker/${cryptoList[i]}$selectedCurrency';
      http.Response response = await http.get(url,headers:{'x-ba-key': 'YTVjZDJmOTA3ODFjNGY1NWIyYmY1MTQ2ZDdiYjkwMzU'});
      prices.add(jsonDecode(response.body)['last'].toString());
    }
    return prices;
  }
}
