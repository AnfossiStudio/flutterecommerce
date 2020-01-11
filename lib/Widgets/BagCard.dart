import 'package:ecommerceapp/Models/BagModel.dart';
import 'package:ecommerceapp/Widgets/IconButtonAction.dart';
import 'package:ecommerceapp/providers/ThemeApp.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BagCard extends StatefulWidget {
  final BagModel bagModel;
  EdgeInsetsGeometry margin;

  BagCard({@required this.bagModel});

  @override
  _BagCardState createState() => _BagCardState();
}

class _BagCardState extends State<BagCard> {
  @override
  Widget build(BuildContext context) {
    final ThemeSchema = Provider.of<ThemeApp>(context);
    return Container(
      height: 120,
      decoration: BoxDecoration(
        color: ThemeSchema.primaryColor,
        borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.1),
              blurRadius: 20,
              spreadRadius: 2,
            ),
          ]
      ),
      margin: widget.margin,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Flexible(
            flex: 2,
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                bottomLeft: Radius.circular(10),
              ),
              child: Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(widget.bagModel.image),
                      fit: BoxFit.cover,),
                ),
              ),
            ),
          ),
          Flexible(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    widget.bagModel.title,
                    style: ThemeSchema.title,
                  ),
                  Row(
                    children: <Widget>[
                      RichText(
                        text: TextSpan(children: [
                          TextSpan(
                            text: 'Color :',
                            style: ThemeSchema.helper.copyWith(
                              color: ThemeSchema.grey,
                            ),
                          ),
                          TextSpan(
                              text: 'Black',
                              style: ThemeSchema.helper.copyWith(
                                color: ThemeSchema.textColor,
                              )),
                        ]),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      RichText(
                        text: TextSpan(children: [
                          TextSpan(
                            text: 'Size :',
                            style: ThemeSchema.helper,
                          ),
                          TextSpan(
                            text: 'L',
                            style: ThemeSchema.helper.copyWith(
                              color: ThemeSchema.textColor,
                            ),
                          ),
                        ]),
                      )
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      IconButtonAction(
                        onPressed: () {
                          if (widget.bagModel.quantity < 1) return;

                          setState(() {
                            widget.bagModel.quantity -= 1;
                          });
                        },
                        icon: Icons.remove,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Text(
                          widget.bagModel.quantity.toString(),
                          style: ThemeSchema.text,
                        ),
                      ),
                      IconButtonAction(
                        onPressed: () {
                          setState(() {
                            widget.bagModel.quantity += 1;
                          });
                        },
                        icon: Icons.add,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          Flexible(
            flex : 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                PopupMenuButton(
                  icon: Icon(
                    Icons.more_vert,
                    color: ThemeSchema.iconsColor,
                  ),
                  color: ThemeSchema.backgroundColor,
                  itemBuilder: (_) {
                    return [
                      PopupMenuItem(
                        value: 'favorite',
                        child: Text(
                          'Add To Favorite',
                          style: TextStyle(color: ThemeSchema.textColor),
                        ),
                      ),
                      PopupMenuItem(
                        value: 'delete',
                        child: Text(
                          'Delete from the list',
                          style: TextStyle(color: ThemeSchema.textColor),
                        ),
                      ),
                    ];
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 16.0 , bottom: 16),
                  child: FittedBox(
                    child: Text(
                      '\$${widget.bagModel.fullPrice.toString()}',
                      style: ThemeSchema.text,
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}