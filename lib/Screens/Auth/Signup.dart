import 'package:ecommerceapp/Screens/Home.dart';
import 'package:ecommerceapp/Screens/auth/Signin.dart';
import 'package:ecommerceapp/Utilities/Manger.dart';
import 'package:ecommerceapp/Widgets/Button.dart';
import 'package:ecommerceapp/Widgets/InputText.dart';
import 'package:ecommerceapp/providers/ThemeApp.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ThemeSchema = Provider.of<ThemeApp>(context);
    return Manager(
      child: Scaffold(
        backgroundColor: ThemeSchema.backgroundColor,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('Sign up', style: ThemeSchema.headline1),
                SizedBox(
                  height: 50,
                ),
                InputText(text: 'Name'),
                InputText(text: 'E-mail'),
                InputText(text: 'Password', password: true),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (_) => SignIn()));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical : 10.0),
                        child: Text(
                          'Already have an account ?',
                          style: ThemeSchema.descriptiveLight,
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward,
                        color: ThemeSchema.secondaryColor,
                        size: 16,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Button(
                  text: 'SIGN UP',
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (_) => Home()));
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  width: double.infinity,
                  child: Text(
                    'Or sign up with socila account',
                    style: ThemeSchema.descriptiveLight,
                    textAlign: TextAlign.center,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                        margin: EdgeInsets.only(right: 20),
                        decoration: BoxDecoration(
                          color: ThemeSchema.primaryColor,
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(.1),
                              blurRadius: 20,
                              spreadRadius: 3,
                            ),
                          ],
                        ),
                        child: Image(
                          image: AssetImage('assets/images/googleIcon.png'),
                          width: 30,
                          height: 30,
                        )),
                    Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                        decoration: BoxDecoration(
                          color: ThemeSchema.primaryColor,
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(.1),
                              blurRadius: 20,
                              spreadRadius: 3,
                            ),
                          ],
                        ),
                        child: Image(
                          image: AssetImage('assets/images/facebook.png'),
                          width: 30,
                          height: 30,
                        ))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
