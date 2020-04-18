import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'coin_data.dart';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  
  String selectedCurrency =  "USD";
  List<String> prices = List<String>();

  
  void setPrice()async{
    print("in setprice");
    prices.clear();
    
    this.setState((){
      cryptoList.map((crypto){
        prices.add('?');
      });
    });
    final pricesData = await CoinData.getCoinData(this.selectedCurrency);
    this.setState((){
      prices=pricesData;
    });
    print(pricesData);
  }

  void initState(){
    super.initState();
    setPrice();
  }

  Text getText({int index}){
    try{
      return
          Text(
            '1 ${cryptoList[index]} = ${prices[index]} ${this.selectedCurrency}',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.white,
            ),
          );
    }catch(e){
      return
          Text(
            '1 ${cryptoList[index]} = ? ${this.selectedCurrency}',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.white,
            ),
          );
    }
    
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: PreferredSize(
          child: Container(
            color:Colors.deepPurple,
            height: 1,
          ),
          preferredSize: Size.fromHeight(1),
        ),
        title: Text('Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Column(
              children: 
              cryptoList.asMap().entries.map((crypto)=>
                Container(
                  width: double.infinity,
                  child: Card(
                    elevation: 5.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                      child: getText(index:crypto.key),
                    ),
                  ),
                )
              ).toList(),
            ),
          ),
          
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color:Colors.deepPurple,
            child: CupertinoPicker(
              scrollController: FixedExtentScrollController(initialItem: currenciesList.indexOf(this.selectedCurrency)),
              backgroundColor: Colors.deepPurple,
              itemExtent: 45.0, 
              onSelectedItemChanged: (selectedIndex){
                this.setState((){
                  selectedCurrency = currenciesList[selectedIndex];
                });
                setPrice();
              }, 
              children: currenciesList.map((currency)=>Center(child: Text(currency,style:TextStyle(color: Colors.white)))).toList()
            )
          ),
        ],
      ),
    );
  }
}
/* 
DropdownButton<String>(
              value:this.selectedCurrency,
              items: currenciesList.map((currency)=>DropdownMenuItem(child:Text('$currency'),value:'$currency')).toList(),
              onChanged: (value){
                this.setState((){
                  this.selectedCurrency = value;
                });
              }) */