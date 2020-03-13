import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.transparent,
      //Opciones de la appbar
      child: Row(
        children: <Widget>[
          IconButton(
            icon: Icon(FontAwesomeIcons.arrowLeft),
            onPressed: (){},
          ),
          Spacer(),
          IconButton(
            icon: Icon(FontAwesomeIcons.search),
            onPressed: (){},
          ),
          Stack(
            children: <Widget>[
              //Icono de cesta
              IconButton(
                icon: Icon(FontAwesomeIcons.shoppingBag),
                onPressed: (){},
              ),
              //Elemento que representa si hay elementos en la bolsa
              Container(
                child: Center(
                  child: Text("99", style: TextStyle(color: Colors.white),),
                ),
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(20)
                ),
              )
            ],
          ),
          IconButton(
            icon: Icon(FontAwesomeIcons.ellipsisV, size: 15,),
            onPressed: (){},
          ),
          //Avatar
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Container(
              width: 50,
              height: 50,
              color: Colors.blue,
            ),
          ),
          SizedBox(width: 15,)
        ],
      ),
    );
  }
}