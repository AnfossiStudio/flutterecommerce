import 'package:ecommerceapp/Screens/ProfileScreens/AddShippingAddress.dart';
import 'package:ecommerceapp/Widgets/ShippindAddressesCard.dart';
import 'package:ecommerceapp/providers/ThemeApp.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShippingAddresses extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ThemeSchema = Provider.of<ThemeApp>(context);
    return Scaffold(
      backgroundColor: ThemeSchema.backgroundColor,
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (_) => AddShippingAddress()));
        },
        backgroundColor: Colors.black,
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        backgroundColor: ThemeSchema.primaryColor,
        centerTitle: true,
        title: Text('Shipping Addresses',style: TextStyle(
          color: ThemeSchema.textColor,
          fontSize : 18
        )),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: ThemeSchema.textColor,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            ShippingAddressesCard(),
            ShippingAddressesCard(),
            ShippingAddressesCard(),
            ShippingAddressesCard(),
            ShippingAddressesCard(),
            SizedBox(height: 16,)
          ],
        ),
      ),
    );
  }
}
