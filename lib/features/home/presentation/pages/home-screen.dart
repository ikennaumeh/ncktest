import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:ncktestapp/features/home/data/models/item-model.dart';
import 'package:ncktestapp/features/home/presentation/pages/item-screen.dart';
import 'package:provider/provider.dart';
import '../provider.dart';
class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _provider = Provider.of<FavoriteProvider>(context);
    Item _item = Item();
    double deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: CircleAvatar(
            radius: 10.0,
            backgroundColor: Colors.purple[800],
            child: Icon(Icons.perm_identity, size: 20.0,),
          ),
        ),
        actions: [
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
      body: Container(
        height: deviceHeight,
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'All', style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold,color: Colors.black),
                          ),
                          TextSpan(
                            text: 'Products', style: TextStyle(color: Colors.grey, fontSize: 20.0)
                          ),
                        ]
                      ),
                    ),
                    Text(
                      'Filter items',
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Colors.black,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: StaggeredGridView.countBuilder(
                     shrinkWrap: true,
                     physics: BouncingScrollPhysics(),
                     scrollDirection: Axis.vertical,
                     staggeredTileBuilder: (index) => new StaggeredTile.fit(2),
                     itemCount: _item.length,
                     mainAxisSpacing: 10.0,
                     crossAxisSpacing: 10.0,
                     crossAxisCount: 4,
                     itemBuilder: (context, index){
                       return InkWell(
                         onTap: (){
                           Navigator.push(context, MaterialPageRoute(builder: (context) =>
                               ItemScreen(
                                 image: _item.images[index],
                                 amount: _item.amount[index],
                                 name: _item.names[index],
                               )));
                         },
                         child: Container(
                           height: 230,
                           width: 160,
                           margin: index % 2 == 0 ? EdgeInsets.only(top: 10.0) : EdgeInsets.only(top: 50.0),
                           decoration: BoxDecoration(
                             color: Colors.grey[300],
                             borderRadius: BorderRadius.circular(15.0),
                           ),
                           child: Column(
                             children: [
                               Row(
                                 mainAxisAlignment: MainAxisAlignment.end,
                                 children: [
                                   Padding(
                                     padding: const EdgeInsets.only(top: 13.0, left: 13.0),
                                     child: IconButton(
                                       icon: Icon(_provider.isFavorite ? Icons.favorite : Icons.favorite_border),
                                       color: Colors.black54,
                                       onPressed: ()=>_provider.toggleFavorite(),
                                     ),
                                   ),
                                 ],
                               ),
                               Stack(
                                 children: [
                                 CircleAvatar(
                                   backgroundColor: Colors.white,
                                   radius: 60,
                                 ),
                                 Positioned(
                                   top: 50.0,
                                   left: 9.0,
                                   child: ClipRRect(
                                     borderRadius: BorderRadius.circular(10.0),
                                     child: Image.network(_item.images[index],scale: 5.0,),),
                                 ),
                                 ]
                               ),
                               SizedBox(height: 7.0,),
                               Text(_item.names[index], style: TextStyle(color: Colors.black54),),
                               SizedBox(height: 4.0,),
                               Text('\$${_item.amount[index].toString()}',style: TextStyle(color: Colors.black54),),

                             ],
                           ),
                         ),
                       );
                     },
                   ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
