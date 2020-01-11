import 'package:ecommerceapp/Screens/Auth/Forgot.dart';
import 'package:ecommerceapp/Screens/ProfileScreens/PasswordChange.dart';
import 'package:ecommerceapp/Widgets/InputText.dart';
import 'package:ecommerceapp/providers/ThemeApp.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  String _value;
  TextEditingController textController;
  Map<String, bool> notification = {
    'sales': true,
    'arrivals': true,
    'delivery': true,
  };

  Future DateBox() async {
//TODO: Make Date picker
//    DateTime picker = await showDatePicker(
//        context: context,
//        initialDate: DateTime.now(),
//        firstDate: DateTime(2016),
//        lastDate: DateTime.now()
//    );
  }

  @override
  initState() {
    textController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeSchema = Provider.of<ThemeApp>(context);
    return Scaffold(
      backgroundColor: ThemeSchema.backgroundColor,
      body: DefaultTabController(
        length: 3,
        child: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              pinned: false,
              floating: false,
              automaticallyImplyLeading: false,
              titleSpacing: 20,
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
              backgroundColor: ThemeSchema.backgroundColor,
              expandedHeight: 130,
              flexibleSpace: FlexibleSpaceBar(
                titlePadding: EdgeInsets.only(left: 16, bottom: 16),
                title: Text(
                  'Settings',
                  style: ThemeSchema.headline2,
                  textAlign: TextAlign.start,
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate([
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(bottom: 16.0),
                        child: Text('Personal Information',
                            style: ThemeSchema.subhead),
                      ),
                      InputText(
                        text: 'Fullname',
                      ),
                      InputText(
                        text: 'Date of Brith',
                        initValue: '12/12/1998',
                        readonly: true,
                        controller: textController,
                        onTap: () async {
                          await DateBox();
                        },
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text('Password', style: ThemeSchema.subhead),
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (_) => PasswordChange()));
                              },
                              child: GestureDetector(
                                onTap : () => Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (_) => Forgot()
                                  )
                                ),
                                child: Text(
                                  'Change',
                                  style: ThemeSchema.text.copyWith(
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      InputText(
                        text: 'Password',
                        password: true,
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Text('Notification', style: ThemeSchema.subhead),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            'Dark Mode',
                            style: ThemeSchema.descriptive,
                          ),
                          Transform.scale(
                            scale: 0.8,
                            child: CupertinoSwitch(
                              value: !ThemeSchema.mode(),
                              onChanged: (v) {
                                setState(() {
                                  ThemeSchema.switchTheme();
                                });
                              },
                              activeColor: ThemeSchema.secondaryColor,
                            ),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            'Sales',
                            style: ThemeSchema.descriptive,
                          ),
                          Transform.scale(
                            scale: 0.8,
                            child: CupertinoSwitch(
                              value: notification['sales'],
                              onChanged: (v) {
                                setState(() {
                                  notification['sales'] = v;
                                });
                              },
                              activeColor: ThemeSchema.secondaryColor,
                            ),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            'New arrivals',
                            style: ThemeSchema.descriptive,
                          ),
                          Transform.scale(
                            scale: 0.8,
                            child: CupertinoSwitch(
                              value: notification['arrivals'],
                              onChanged: (v) {
                                setState(() {
                                  notification['arrivals'] = v;
                                });
                              },
                              activeColor: ThemeSchema.secondaryColor,
                            ),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            'Delivery status changes',
                            style: ThemeSchema.descriptive,
                          ),
                          Transform.scale(
                            scale: 0.8,
                            child: CupertinoSwitch(
                              value: notification['delivery'],
                              onChanged: (v) {
                                setState(() {
                                  notification['delivery'] = v;
                                });
                              },
                              activeColor: ThemeSchema.secondaryColor,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                )
              ]),
            )
          ],
        ),
      ),
    );
  }
}
