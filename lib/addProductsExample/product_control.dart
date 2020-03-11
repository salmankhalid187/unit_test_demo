import 'package:flutter/material.dart';

class  ProductControl extends StatelessWidget {

  final Function addProduct;

  ProductControl(this.addProduct);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
            color: Theme.of(context).primaryColor,
            onPressed: () {
              this.addProduct('Flash drive');
            },
            child: Text("Add Product"),
          );
  }
}
