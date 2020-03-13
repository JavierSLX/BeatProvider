import 'package:beats/src/widgets/CardsView.dart';
import 'package:beats/src/widgets/CustomAppBar.dart';
import 'package:beats/src/widgets/FondoCircular.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          //Circulo gris del fondo
          FondoCircular(),
          //Appbar y cabecera de la app
          SafeArea(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 10,),
                  CustomAppBar(),
                  _Header(),
                  CardsView(),
                ],
              ),
            ),
          ),
          //Boton de compra
          BuyButton()
        ],
      )
    );
  }
}

//Cabecera que contiene un titulo en la app
class _Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 45,),
          Text("Beats", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),),
          Text("By Dre", style: TextStyle(fontWeight: FontWeight.w100, fontSize: 18),),
        ],
      ),
    );
  }
}

//Widget de boton de compra
class BuyButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Stack(
      children: <Widget>[
        Positioned(
          bottom: 0.0,
          right: 0.0,
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Buy", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 30),),
                SizedBox(width: 5,),
                Icon(FontAwesomeIcons.arrowRight, color: Colors.white,)
              ],
            ),
            width: size.width * 0.3,
            height: 75,
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(50))
            ),
          ),
        )
      ],
    );
  }
}