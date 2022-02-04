import 'package:flutter/material.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const LoginPage(),
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
      ),
    );
  }
}


class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with SingleTickerProviderStateMixin {

  late AnimationController _iconAnimationController;
  late Animation<double> _iconAnimation;

  @override
  void initState() {
    super.initState();
    _iconAnimationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 300));
    _iconAnimation = CurvedAnimation(parent: _iconAnimationController, curve: Curves.easeOut);
    _iconAnimation.addListener(() => setState(() {}));
    _iconAnimationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.greenAccent,
        body: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            const Image(image: AssetImage("assets/1.jpeg"),
              fit: BoxFit.cover,
              color: Colors.black87,
              colorBlendMode: BlendMode.darken,),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FlutterLogo(
                  size: _iconAnimation.value * 100,
                ),
                Form(
                  child: Theme(
                      data: ThemeData(
                          brightness: Brightness.dark,
                          primarySwatch: Colors.teal,
                          inputDecorationTheme: const InputDecorationTheme(
                        labelStyle: TextStyle(
                          color:Colors.teal,
                          fontSize: 20.0,
                        )

                      )),
                    child: Container(
                      padding: const EdgeInsets.all(60.0),
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        TextFormField(
                          decoration: const InputDecoration(
                            labelText: "Enter Email",
                          ),
                          keyboardType: TextInputType.emailAddress,
                        ),
                        TextFormField(
                          decoration: const InputDecoration(
                            labelText: "Enter Password",
                          ),
                          keyboardType: TextInputType.text,
                          obscureText: true,
                        ),
                        const Padding(padding: EdgeInsets.only(top: 40.0)),
                        MaterialButton(
                          height: 40.0,
                          minWidth: 80.0,
                          onPressed:() => {} ,
                          color: Colors.teal,
                          textColor: Colors.white,

                          child:const Icon(Icons.arrow_forward_ios_sharp),
                          splashColor: Colors.redAccent,
                        )
                      ],
                    ))))
              ],

            )
          ],
        )
    );
  }
}
