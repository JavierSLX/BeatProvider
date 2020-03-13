import 'package:beats/src/models/ProductoModel.dart';
import 'package:beats/src/providers/ProductoProvider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class CardsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final productosProvider = Provider.of<ProductosProvider>(context);
 
    return Container(
      width: double.infinity,
      height: 460,
      child: PageView(
        controller: PageController(viewportFraction: 0.8),
        //Convierte la lista de providers en una lista obteniendo una card en cada uno
        children: productosProvider.productos.map((producto) => _Card(producto)).toList(), 
      )
    );
  }
}

class _Card extends StatelessWidget {

  final ProductoModel producto;

  //Constructor
  _Card(this.producto);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: <Widget>[
          //Coloca los elementos de la tarjeta
          Row(
            children: <Widget>[
              _PrimeraDescripcion(producto),
              SizedBox(width: 55,),
              _TarjetaDescripcion(producto),
            ],
          ),
          //Coloca la imagen de la tarjeta
          Positioned(
            top: 90,
            left: 50,
            child: Image(
              image: AssetImage("assets/${producto.url}"),
              width: 160,
            ),
          )
        ],
      ),
    );
  }
}

//Parte izquierda de la tarjeta que se muestra
class _PrimeraDescripcion extends StatelessWidget {

  final ProductoModel producto;

  _PrimeraDescripcion(this.producto);

  @override
  Widget build(BuildContext context) {
    //Da espacio al widget para que no quede pegado a los bordes
    return Padding(
      padding: EdgeInsets.all(10),
      //Rota el contenido de manera que se muestra de forma vertical
      child: RotatedBox(
        quarterTurns: 3,
        //Organiza el texto e iconos por medio de row
        child: Row(
          //Centra el contenido a lo ancho del row
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(FontAwesomeIcons.batteryFull, size: 15,),
            SizedBox(width: 10,),
            Text("${producto.bateria}", style: TextStyle(fontSize: 12),),

            SizedBox(width: 30,),

            Icon(FontAwesomeIcons.wifi, size: 15,),
            SizedBox(width: 10,),
            Text("wireless", style: TextStyle(fontSize: 12),),
          ],
        ),
      ),
    );
  }
}

//Parte derecha de la tarjeta
class _TarjetaDescripcion extends StatelessWidget {

  final ProductoModel producto;

  _TarjetaDescripcion(this.producto);
  
  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    //Tarjeta
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      //Corta los bordes
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: Container(
          width: size.width * 0.55,
          height: 340,
          //Color azul en hexadecimal
          color: Color(producto.color),
          child: Column(
            children: <Widget>[
              SizedBox(height: 25,),
              //Título de la tarjeta girado y mostrado de manera vertical
              RotatedBox(
                quarterTurns: 3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Text(producto.titulo, style: TextStyle(color: Colors.white60, fontSize: 30, fontWeight: FontWeight.bold)),
                    Text(producto.subtitulo, style: TextStyle(color: Colors.white38, fontSize: 30, fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
              //Da un espacio para que los demás elementos se distribuyan
              Spacer(),
              //Texto del contenido de la tarjeta
              Padding(
                padding: EdgeInsets.all(10),
                child: Row(
                  children: <Widget>[
                    Text(producto.nombre, style: TextStyle(color: Colors.white),),
                    Spacer(),
                    Icon(producto.favorito ? FontAwesomeIcons.heartbeat : FontAwesomeIcons.heart, color: Colors.white,)
                  ],
                ),
              ),
              Row(
                //Alinea al final el contenido
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Container(
                    child: Text("\$${producto.precio}", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                    width: 80,
                  ),
                  //Crea el botón Rojo
                  Container(
                    child: Center(
                      child: Text("Add to bag", style: TextStyle(color: Colors.white),),
                    ),
                    width: 120,
                    height: 45,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(15))
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}