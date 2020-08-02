import 'package:flutter/material.dart';
import 'package:online_store/product.dart';
import 'dart:io';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  //File  mef=  File("online_store/catalog");

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title:  'Welcome to Flutter',
      home: Catalog(),

    );
  }
}



class Catalog extends StatefulWidget {
  @override
  _CatalogState createState() => _CatalogState();
}

class _CatalogState extends State<Catalog> {
  List<Product> _catalog=<Product>[];
  final _styleFont = TextStyle(fontSize: 18.0);
  final _styleBarFont = TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold);
  @override
  Widget build(BuildContext context) {
    _catalog=_getListProduct();
    return  Scaffold(
      appBar: AppBar(
        title: Text('Интернет магазин'),
      ),
      body: _buildCatalog(),
    );
  }

  Widget _buildCatalog(){
    return ListView.builder(
      padding: EdgeInsets.all(16.0),
      itemCount: _catalog.length*2,
      itemBuilder: (context,i){
        if (i.isOdd)return  Divider();
        else {
          final index = i ~/ 2;
          return _buildRow(_catalog[index]);
        }
      },
    );
  }
  Widget _buildRow(Product product){
    return  ListTile(
      title: Text(product.name,
      style: _styleFont,),
      trailing: Image.asset(product.path),
      subtitle: Text("Цена: "+product.price.toString()),
      onTap: (){
        _pushView(product);
      },
    );
  }
  void _pushView(Product product){
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (BuildContext context){
          return Scaffold(
            appBar: AppBar(
              title: Text(product.name),
            ),
            body: ListView(children: <Widget>[
              Image.asset(product.path),
              Divider(),
              Center(
                child: Text("Описание",
                    style: _styleBarFont),
              ),
              Divider(),
              Container(
                padding: EdgeInsets.all(16.0),
               child:Text(
                 product.description,
                 style: _styleFont),
              ),
              Container(
                padding: EdgeInsets.all(16.0),
                child:Text( "Цена: "+
                    product.price.toString(),
                    style: _styleFont),
              ),
            ]
            )
          );
        }
      )
    );
  }
}



List<Product> _getListProduct(){
  List<Product> _catalog=<Product>[];
  Product p1=Product("Стул", "Деревянный стул", "images/chair.jpg", 150);
  Product p2=Product("Стол", "Деревянный стол", "images/table.jpg", 500);
  Product p3=Product("Полка", "Деревянная полка", "images/shelf.jpg", 50);
  Product p4=Product("Шкаф", "Деревянный шкаф", "images/wardrobe.jpg", 1000);
  Product p5=Product("Диван", "Кожаный диван", "images/sofa.jpg", 3000);
  Product p6=Product("Кресло", "Кожаное кресло", "images/armchair.jpg", 1500);
  Product p7=Product("Дверь", "Деревянная дверь", "images/door.jpg", 1500);
  Product p8=Product("Тумба", "Деревянная тумба", "images/pedestal.jpg", 200);
  Product p9=Product("Табурет", "Деревянный табурет", "images/stool.jpg", 25);
  Product p10=Product("Скамья", "Деревянная скамья", "images/bench.jpg", 150);
  _catalog.add(p1);
  _catalog.add(p2);
  _catalog.add(p3);
  _catalog.add(p4);
  _catalog.add(p5);
  _catalog.add(p6);
  _catalog.add(p7);
  _catalog.add(p8);
  _catalog.add(p9);
  _catalog.add(p10);
  return  _catalog;
}


