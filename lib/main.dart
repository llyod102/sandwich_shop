import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sandwich Shop App',
      home: OrderScreen(maxQuantity: 5),
    );
  }
}

class OrderScreen extends StatefulWidget {
  final int maxQuantity;

   OrderScreen({super.key, this.maxQuantity = 10});

  @override
  State<OrderScreen> createState() {
    return _OrderScreenState();
  }
}

class _OrderScreenState extends State<OrderScreen> {
  int _quantity = 0;
  String foodType = 'Footlong';
  double _sizeSlider = 0.0;



  TextEditingController sandwichtext = TextEditingController();


  void _increaseQuantity() {
    if (_quantity < widget.maxQuantity) {
      setState(() => _quantity++);
    }
  }

  void _decreaseQuantity() {
    if (_quantity > 0) {
      setState(() => _quantity--);
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sandwich Counter')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            OrderItemDisplay(_quantity,foodType),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                StyleButton(
                  onPressed: _quantity < widget.maxQuantity ? _increaseQuantity : null,
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.black,
                  child: const Text('Add'),
                ),
                StyleButton(
                  onPressed: _quantity > 0 ? _decreaseQuantity : null,
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.blue,
                  child: const Text('Remove'),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Slider(
                  value: _sizeSlider,
                  min: 0,
                  max:1,
                  divisions: 1,
                  label: _sizeSlider == 0? '6 inch' : 'Footlong',
                  onChanged: (value){
                    setState((){
                      _sizeSlider = value;
                      foodType = _sizeSlider == 0? '6-inch' : 'Footlong';
                    });
                  }
                )
              ]

            )
              
        

          ],
        ),
      ),
    );
  }
}

class OrderItemDisplay extends StatelessWidget {
  final int quantity;
  final String itemType;


  const OrderItemDisplay(this.quantity, this.itemType, {super.key});

  @override
  Widget build(BuildContext context) {
    String icon = itemType == '6-inch' ? '🥙' : '🥪';
    return Text('$quantity $itemType sandwich(es): ${icon * quantity}');
  }
}

class StyleButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Widget child;
  final Color backgroundColor;
  final Color foregroundColor;

  const StyleButton({
    Key? key,
    required this.onPressed,
    required this.child,
    this.backgroundColor = Colors.blue,
    this.foregroundColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith<Color?>((states) {
          if (states.contains(MaterialState.disabled)) {
            return backgroundColor.withOpacity(0.5);
          }
          return backgroundColor;
        }),
        foregroundColor: MaterialStateProperty.all(foregroundColor),
      ),
      child: child,
    );
  }
}
