import 'package:ecommerceapp/Screens/Auth/Signup.dart';
import 'package:ecommerceapp/Screens/ProfileScreens/MyOrders.dart';
import 'package:ecommerceapp/Screens/ProfileScreens/PaymentMethod.dart';
import 'package:ecommerceapp/Screens/ProfileScreens/Settings.dart';
import 'package:ecommerceapp/Screens/ProfileScreens/ShippingAddresses.dart';
import 'package:ecommerceapp/providers/ThemeApp.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ThemeSchema = Provider.of<ThemeApp>(context);
    Widget header(ThemeSchema) {
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Stack(
              overflow: Overflow.visible,
              children: <Widget>[
                Container(
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    image: DecorationImage(
                      image: AssetImage('assets/images/model2.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  bottom: -5,
                  right: -5,
                  child: Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: ThemeSchema.secondaryColor,
                      ),
                      child: Icon(
                        Icons.edit,
                        color: Colors.white,
                        size: 16,
                      )),
                )
              ],
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    'Matilda Brown',
                    style: ThemeSchema.headline3,
                  ),
                ),
                Text(
                  'matildabrown@mail.com',
                  style: ThemeSchema.descriptive.copyWith(
                    color: Colors.grey,
                  ),
                )
              ],
            )
          ],
        ),
      );
    }

    Widget itemList(
        ThemeSchema ,{text,
        subtitle,
        onPressed,
        textStyle,
        icon,
        iconLeading = Icons.settings,
        divider = true}) {
      return GestureDetector(
        onTap: onPressed,
        child: Column(
          children: <Widget>[
            ListTile(
              leading: Icon(iconLeading,
                  color: textStyle == null
                      ? Colors.grey
                      : textStyle.color,
                  size: 30),
              title: Text(
                text,
                style: textStyle == null ? ThemeSchema.subhead : textStyle,
              ),
              subtitle: subtitle == null
                  ? null
                  : Text(
                      subtitle,
                      style: ThemeSchema.helper
                          .copyWith(fontWeight: FontWeight.w500),
                    ),
              trailing: icon == null
                  ? Icon(
                      Icons.arrow_forward_ios,
                      size: 18,
                      color: ThemeSchema.iconsColor.withOpacity(.7),
                    )
                  : icon,
            ),
            divider
                ? Divider(
                    height: 2,
                    color: ThemeSchema.divider,
                  )
                : SizedBox.shrink()
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: ThemeSchema.backgroundColor,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            floating: false,
            automaticallyImplyLeading: false,
            titleSpacing: 20,
            actions: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.search,
                  color: ThemeSchema.textColor,
                ),
                onPressed: () {},
              )
            ],
            backgroundColor: ThemeSchema.backgroundColor,
            expandedHeight: 130,
            flexibleSpace: FlexibleSpaceBar(
              titlePadding: EdgeInsets.only(left: 16, bottom: 16),
              title: Text(
                'My Profile',
                style: ThemeSchema.headline2,
                textAlign: TextAlign.start,
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              header(ThemeSchema),
              itemList(ThemeSchema,
                text: 'My orders',
                subtitle: 'Already have 12 orders',
                onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => MyOrders(),
                  ),
                ),
                iconLeading: Icons.shopping_basket,
              ),
              itemList(ThemeSchema,
                text: 'Shipping addresses',
                subtitle: '3 addressed',
                iconLeading: Icons.assignment,
                onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => ShippingAddresses(),
                  ),
                ),
              ),
              itemList(ThemeSchema,
                text: 'Payment methods',
                subtitle: 'Visa **34',
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => PaymentMethod()),
                  );
                },
                iconLeading: Icons.credit_card,
              ),
              itemList(ThemeSchema,
                text: 'Settings',
                subtitle: 'Notification , password',
                onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => Settings(),
                  ),
                ),
              ),
              itemList(ThemeSchema,
                text: 'Log out',
                subtitle: null,
                textStyle: ThemeSchema.subhead.copyWith(
                  color: ThemeSchema.secondaryColor,
                ),
                onPressed: () {
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (_) => SignUp()),
                      ModalRoute.withName('/'));
                },
                icon: SizedBox.shrink(),
                divider: false,
                iconLeading: Icons.exit_to_app,
              ),
              SizedBox(
                height: 100,
              )
            ]),
          )
        ],
      ),
    );
  }
}