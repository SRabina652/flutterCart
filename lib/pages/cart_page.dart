import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shopping_cart_provider/utils/color.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text(
          "CartPage",
          style: TextStyle(color: whiteColor),
        ),
        centerTitle: true,
        leading: InkWell(
          onTap: () {
            Navigator.of(context).popUntil((route) => route.isFirst);
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: whiteColor,
          ),
        ),
      ),
      body: ListView.builder(
          itemCount: 4,
          itemBuilder: (context,index){
        return Column(
          children: [
            ListTile(
                title: Text(
                  "Cap",
                  textAlign: TextAlign.justify,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                subtitle: Text("Price:  Rs.100"),
                trailing: Container(
                  width: 90,
                  padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                  decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                          child: Icon(Icons.add,size: 20,color: whiteColor,)
                      ),
                      SizedBox(width: 3,),
                      Text(" 1 ",style: TextStyle(
                        fontSize: 18,
                        color: whiteColor,
                      ),),
                      SizedBox(width: 3,),
                      InkWell(
                          child: Icon(Icons.remove,color: whiteColor,)
                      ),
                    ],
                  )
                ),
                leading: Container(
                  height: 120,
                  width: 80,
                  child: CachedNetworkImage(
                    imageUrl: "",
                    placeholder: (context, uri) =>
                        Center(child: CircularProgressIndicator()),
                    errorWidget: (context, uri, error) => Icon(Icons.error),
                  ),
                )),
            SizedBox(
              height: 10,
            ),
          ],
        );
      })
    );
  }
}
