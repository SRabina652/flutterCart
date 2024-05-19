import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shopping_cart_provider/api/rest_api.dart';
import 'package:shopping_cart_provider/pages/cart_page.dart';
import 'package:shopping_cart_provider/utils/color.dart';
import 'package:badges/badges.dart' as badges;

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Product Section",
          style: TextStyle(color: whiteColor),
        ),
        centerTitle: true,
        elevation: 5,
        backgroundColor: primaryColor,
        actions: [
          InkWell(
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => CartPage()));
            },
            child: badges.Badge(
              badgeContent: Text("4",style: TextStyle(
                color: primaryColor,
              ),),
              badgeAnimation: badges.BadgeAnimation.slide(
                animationDuration: Duration(seconds: 1),
              ),
              badgeStyle: badges.BadgeStyle(
                padding: EdgeInsets.all(4),
                borderRadius: BorderRadius.circular(50),
                badgeColor: whiteColor
              ),
              child: Icon(
                Icons.shopping_cart_outlined,
                color: whiteColor,
              ),
            ),
          ),
          SizedBox(
            width: 20,
          ),
        ],
        leading: InkWell(
            onTap: () {
              Navigator.of(context).popUntil((route) => route.isFirst);
            },
            child: Icon(
              Icons.arrow_back_ios,
              color: whiteColor,
            )),
      ),
      body: Container(
        child: FutureBuilder(
          future: HttpRestApi.getProductApi(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data?.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        ListTile(
                            title: Text(
                              snapshot.data![index].title.toString(),
                              textAlign: TextAlign.justify,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w500),
                            ),
                            subtitle: Text(
                                "Price:  Rs.${snapshot.data![index].price}"),
                            trailing: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              decoration: BoxDecoration(
                                color: primaryColor,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: InkWell(
                                child: Text(
                                  "Add",
                                  style: TextStyle(color: whiteColor),
                                ),
                              ),
                            ),
                            leading: Container(
                              height: 120,
                              width: 80,
                              child: CachedNetworkImage(
                                imageUrl:
                                    snapshot.data![index].image.toString(),
                                placeholder: (context, uri) =>
                                    Center(child: CircularProgressIndicator()),
                                errorWidget: (context, uri, error) =>
                                    Icon(Icons.error),
                              ),
                            )),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    );
                  });
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(
                  color: Colors.grey,
                ),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Container(
                  child: Text(snapshot.error.toString()),
                ),
              );
            } else {
              return Center(
                child: CircularProgressIndicator(
                  color: Colors.grey,
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
