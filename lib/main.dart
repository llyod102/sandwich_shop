import 'package:flutter/material.dart';

void main(){
  runApp(const App());
  
}
class App extends StatelessWidget{
   const App({super.key});

   @override
   Widget build(BuildContext context){
    return MaterialApp(
      title: 'Sandwich Shop App',
      

      home: Scaffold(
        appBar: AppBar(title: const Text('Sandwich Counter')),
        body: const Center(
        child: OrderItemDisplay(5,'Club',3,2,'BLT','Veggie'),
          ),
      ),
      
    );




   }
   
}
class OrderItemDisplay extends StatelessWidget {
  final String itemType;
  final String itemType2;
  final String itemType3;
  final int clubQuantity;
  final int bltQuantity;
  final int veggieQuantity;

  const OrderItemDisplay(this.clubQuantity, this.itemType, this.bltQuantity,this.veggieQuantity, this.itemType2,this.itemType3,{super.key});

  @override
  Widget build(BuildContext context) {
   return Container(
    color: Colors.blue,
    width: 800,
    height: 200,
    alignment: Alignment.topLeft,

    child:  Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Flexible(child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('$clubQuantity $itemType  sandwich(es): ${'🥪' * clubQuantity}',
          softWrap: true,

     

        ))),
         Flexible(child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('$bltQuantity $itemType2 sandwich(es): ${'🥪' * bltQuantity}',
          softWrap: true,

        ))),
        Flexible(child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('$veggieQuantity $itemType3 sandwich(es): ${'🥪' * veggieQuantity}',

          softWrap: true,

        ))),





      ]

   ));
  }
}



