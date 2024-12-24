import 'package:flutter/material.dart';
import 'dart:ui';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Restaurant App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      // home: const MyHomePage(title: 'Apple Store'),
      home: const MyHomePage(title: 'Mürren Restaurant'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 211, 211, 211),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10000.0, sigmaY: 10000.0), // เพิ่มเบลอ
            child: AppBar(
              elevation: 0, // ลบเงา
              backgroundColor: Colors.white.withOpacity(0.3), // โปร่งใส
              surfaceTintColor: Colors.transparent, // ลบสีเงา
              title: Text(title),
              centerTitle: true,
            ),
          ),
        ),
      ),
      floatingActionButton:  FloatingActionButton(
        onPressed: () => print("add button clicked"),
        backgroundColor: Colors.white,
        child: const Icon(Icons.add_shopping_cart_rounded, color: Color.fromARGB(255, 39, 39, 39)),
      ),
      body: ListView(children: const [
        Column(children: <Widget>[
          ProductBox(
            name: "Prime Rib Steak",
            description:
                "Succulent prime rib steak served with a gourmet sauce and seasonal vegetables.",
            price: 399,
            image: "1.jpg",
            star: 5,
          ),
          ProductBox(
            name: "Truffle Mashed Potatoes",
            description:
                "Velvety mashed potatoes infused with premium truffle oil and fresh chives.",
            price: 349,
            image: "2.jpg",
            star: 4,
          ),
          ProductBox(
            name: "Signature Lobster Bisque",
            description:
                "Rich and creamy lobster bisque garnished with fresh herbs and a hint of sherry.",
            price: 429,
            image: "3.jpg",
            star: 3,
          ),
          ProductBox(
            name: "Herb-Crusted Sea Bass",
            description:
                "Delicately grilled sea bass with a fragrant herb crust and a citrus beurre blanc.",
            price: 1099,
            image: "4.jpg",
            star: 5,
          ),
        ]),
      ]),
    );
  }
}

class ProductBox extends StatelessWidget {
  const ProductBox({
    Key? key,
    required this.name,
    required this.description,
    required this.price,
    required this.image,
    required this.star,
  }) : super(key: key);

  final String name;
  final String description;
  final int price;
  final String image;
  final int star;

  @override
  Widget build(BuildContext context) {
    return Container( 
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10)),
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(255, 191, 191, 191),
            blurRadius: 2.0,
            spreadRadius: 0.1,
            offset: Offset(3.0, 3.0),
          ),
        ],
      ),
      margin: const EdgeInsets.all(10),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 250,
              width: 350,
              margin: EdgeInsets.fromLTRB(0, 15, 0, 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                image: DecorationImage(
                  image: AssetImage("assets/images/$image"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Text(
              name,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 20, 0, 20),
              width: 200,
              child: Text(
                description,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Text("Price: \$${price.toString()}"),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 20, 0, 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(star, (index) {
                  return const Icon(
                    Icons.star,
                    color:
                        Color.fromARGB(255, 243, 186, 0), // ตั้งค่าเป็นสีเหลือง
                    size: 15.0,
                  );
                }),
              ),
            ),
            Container(
                margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      child: Icon(
                        Icons.remove_circle_outline_sharp,
                        size: 20.0,
                      color: Color.fromARGB(255, 88, 88, 88),
                      ),
                    ),
                    SizedBox(width: 20),
                    Text(
                      "1",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                        color: Color.fromARGB(255, 88, 88, 88),
                      ),
                    ),
                    SizedBox(width: 20),
                    Icon(
                      Icons.add_circle_outline_sharp,
                      size: 20.0,
                      color: Color.fromARGB(255, 88, 88, 88),
                    )
                  ],
                ))
          ]),
    );
  }
}
