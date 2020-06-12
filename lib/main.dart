import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(title: 'Tip Calculator', home: TipCalculator()) );
}


class TipCalculator extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _TipCalculatorState();
  }
}

class _TipCalculatorState extends State{
  double billAmount = 0.0;
  double tipPercentaje = 0.0;
  double _total = 0.0;
 // double _propina = 0.0;
  final TextStyle textStyle = TextStyle(
      fontSize: 25,
      
  );


  @override
  Widget build(BuildContext context) {


    
    TextField billAmountField = TextField(
      keyboardType: TextInputType.number,
      onChanged: (String value){
        try {
          billAmount = double.parse(value);
        }
        catch(exception){
          billAmount = 0.0;
        }
      }
    );
  

   TextField tipPercentageField = TextField(
      decoration: InputDecoration(labelText: "tip %", hintText: "15"),
      keyboardType: TextInputType.number,
      onChanged: (String value){
        try{
          tipPercentaje = double.parse(value);
        }
        catch(exception){
          tipPercentaje = 0.0;
        }
      },
    );


    
    

    RaisedButton calculateButton = RaisedButton (
      child: Text("Calculate"),
      onPressed: (){
        double calculatedTip = billAmount * tipPercentaje / 100.0;
        double totale = billAmount + calculatedTip;
        
      
        
        setState(() {
             //_propina=calculatedTip;
             _total = totale;
          });
         

        

            
         //viewTotal.onChanged= parse.toString(total);
        /*AlertDialog dialog = AlertDialog(
          content: Text("Tip: \$$calculatedTip \n"
                        " Total: \$$total"));
        showDialog(context: context, builder:(BuildContext context) => dialog);*/
      });

      
     


   

    Container container = Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [billAmountField, tipPercentageField, calculateButton,
                   Text(" Total: \$$_total", textAlign: TextAlign.center, style: textStyle)]));

      
    AppBar appBar = AppBar(title: Text("Tip Calculator"));
    Scaffold scaffold = Scaffold(appBar: appBar, body: container);
    return scaffold;
  }


}

