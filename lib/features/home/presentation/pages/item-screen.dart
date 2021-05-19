import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider.dart';

class ItemScreen extends StatelessWidget {
  final String image, name;
  final int amount;

  const ItemScreen({Key key, this.image, this.name, this.amount}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final _provider = Provider.of<FavoriteProvider>(context);
    double deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            color: Colors.grey[350],
            height: MediaQuery.of(context).size.height / 1.65,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 40.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: IconButton(
                          icon: Icon(Icons.arrow_back, color: Colors.black54,size: 25.0,),
                          onPressed: () => Navigator.pop(context),
                        ),
                      ),
                      Text('Overview', style: TextStyle(color: Colors.black54, fontSize: 20.0),),
                      Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
                            child: Icon(Icons.shopping_cart, color: Colors.black, size: 20.0,),
                          ),
                          Positioned(
                              top: 13.0,
                              left: 3.0,
                              child: CircleAvatar(backgroundColor: Colors.green, radius: 3.0,))
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20.0,),
                Stack(
                  children: [
                    CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 110.0,
                  ),
                    Positioned(
                      top: 110.0,
                      left: 27.0,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: Image.network(image,scale: 3.0,),),
                    ),
                 ]
                ),

              ],
            ),
          ),
          Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(name, style: TextStyle(fontSize: 17, color: Colors.black),),
                      Text('\$$amount', style: TextStyle(fontSize: 17, color: Colors.black),),
                    ],
                  ),
                  SizedBox(height: 30.0,),
                  Text('Hand-free help from Google assistant', style: TextStyle(fontSize: 17.0, color: Colors.black),),
                  SizedBox(height: 30.0,),
                  Text(
                    'Get answers, play songs, tackle your day, enjoy your entertainment and control your smart...',
                    style: TextStyle(fontSize: 15.0, color: Colors.grey),
                  ),
                  SizedBox(height: 20.0,),
                  Row(
                    children: [
                      Container(
                        height: 50.0,
                        width: deviceWidth / 4.6,
                        decoration: BoxDecoration(
                          color: Colors.grey[350],
                          borderRadius: BorderRadius.circular(20.0)
                        ),
                        child: IconButton(
                          icon: Icon(_provider.isFavorite ? Icons.favorite : Icons.favorite_border),
                          onPressed: ()=> _provider.toggleFavorite(),
                        ),
                      ),
                      SizedBox(width: 10.0,),
                      Container(
                        height: 50.0,
                        width: deviceWidth / 1.65,
                        decoration: BoxDecoration(
                          color: Colors.greenAccent,
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.shopping_cart, color: Colors.white, size: 18.0,),
                            SizedBox(width: 10.0,),
                            Text('ADD TO CART', style: TextStyle(color: Colors.white,),)
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

          ),
        ],
      ),
    );
  }
}
