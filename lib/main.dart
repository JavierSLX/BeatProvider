import 'package:beats/src/pages/HomePage.dart';
import 'package:beats/src/providers/ProductoProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
 
//https://www.uplabs.com/

void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Permite usar multiples providers (Permite centralizar la informacion e informar cuando existen cambios)
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (BuildContext context) => ProductosProvider(),)
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Beats App',
        initialRoute: "home",
        routes: {
          "home": (BuildContext context) => HomePage(),
        },
      ),
    );
  }
}