import 'package:ecommerceapp/Screens/HomeScreens/ReviewRate.dart';
import 'package:ecommerceapp/Widgets/Comment.dart';
import 'package:ecommerceapp/Widgets/ProgressBar.dart';
import 'package:ecommerceapp/Widgets/RaitingReview.dart';
import 'package:ecommerceapp/providers/ThemeApp.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Review extends StatelessWidget {
  Widget header(widthColumn , ThemeSchema) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text(
                  '4.3',
                  style: ThemeSchema.headline1,
                ),
                Text(
                  '23 rating',
                  style: ThemeSchema.descriptiveLight,
                ),
              ],
            ),
          ),
          SizedBox(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                RatingReview(
                  size: 16,
                ),
                RatingReview(
                  index: 4,
                  size: 16,
                ),
                RatingReview(
                  index: 3,
                  size: 16,
                ),
                RatingReview(
                  index: 2,
                  size: 16,
                ),
                RatingReview(
                  index: 1,
                  size: 16,
                ),
              ],
            ),
          ),
          SizedBox(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                ProgressBar(
                  width: widthColumn,
                  value: .9,
                ),
                ProgressBar(
                  width: widthColumn,
                  value: .7,
                ),
                ProgressBar(
                  width: widthColumn,
                  value: .4,
                ),
                ProgressBar(
                  width: widthColumn,
                  value: .3,
                ),
                ProgressBar(
                  width: widthColumn,
                  value: .2,
                ),
              ],
            ),
          ),
          SizedBox(
            child: Column(
              children: <Widget>[
                Text('12', style: ThemeSchema.text),
                Text('5', style: ThemeSchema.text),
                Text('4', style: ThemeSchema.text),
                Text('3', style: ThemeSchema.text),
                Text('1', style: ThemeSchema.text),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    dynamic widthColumn = (MediaQuery.of(context).size.width) / 3;
    final ThemeSchema = Provider.of<ThemeApp>(context);

    return Scaffold(
      backgroundColor: ThemeSchema.backgroundColor,
      body: Stack(
        children: <Widget>[
          CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                forceElevated: true,
                automaticallyImplyLeading: false,
                pinned: false,
                actions: <Widget>[
                  IconButton(
                    icon: Icon(
                      Icons.close,
                      size: 28,
                      color: ThemeSchema.textColor,
                    ),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ],
                expandedHeight: 130,
                backgroundColor: ThemeSchema.backgroundColor,
                flexibleSpace: FlexibleSpaceBar(
                  titlePadding: EdgeInsets.only(left: 16, bottom: 16),
                  title: Text(
                    'Rating & Review',
                    style: ThemeSchema.headline2,
                    textAlign: TextAlign.start,
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildListDelegate([
                  header(widthColumn , ThemeSchema),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      '8 Review',
                      style: ThemeSchema.headline2,
                      textAlign: TextAlign.start,
                    ),
                  ),
                  Comment(),
                  Comment(),
                  Comment(),
                  Comment(),
                  Comment(),
                  SizedBox(
                    height: 50,
                  ),
                ]),
              )
            ],
          ),
          Positioned(
            bottom: 0,
            child: Container(
                width: MediaQuery.of(context).size.width,
                height: 150,
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                  ThemeSchema.primaryColor,
                  ThemeSchema.primaryColor.withOpacity(.8),
                  ThemeSchema.primaryColor.withOpacity(0),
                ], begin: Alignment.bottomCenter, end: Alignment.topCenter)),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: RaisedButton(
                      color: ThemeSchema.secondaryColor,
                      textColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                      onPressed: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(
                                builder : (_) => ReviewRate()
                            )
                        );
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Icon(
                            Icons.edit,
                            size: 18,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            'write a review',
                            style: ThemeSchema.descriptive
                                .copyWith(color: Colors.white),
                          )
                        ],
                      ),
                    ),
                  ),
                )),
          ),
        ],
      ),
    );
  }
}