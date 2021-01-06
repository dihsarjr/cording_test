import 'package:coding_app/models/category_model.dart';
import 'package:coding_app/models/product_model.dart';
import 'package:coding_app/providers/category_provider.dart';
import 'package:coding_app/utils.dart';
import 'package:coding_app/widgets/doubleBounceIndicator.dart';
import 'package:coding_app/widgets/grid_single_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder<CategoryModel>(
          future: Provider.of<CategoryProvider>(context, listen: false)
              .getCategory(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return DefaultTabController(
                length: snapshot.data.data.length,
                child: Scaffold(
                  backgroundColor: Utils.primary,
                  appBar: AppBar(
                    backgroundColor: Utils.primary,
                    elevation: 0,
                    centerTitle: true,
                    leading: IconButton(
                        icon: Icon(
                          Icons.arrow_back_rounded,
                          color: Utils.iconsColor,
                        ),
                        onPressed: () {}),
                    title: Text(
                      "Items",
                      style: TextStyle(color: Colors.black),
                    ),
                    actions: [
                      IconButton(
                          icon: Icon(
                            Icons.shopping_bag_outlined,
                            color: Utils.iconsColor,
                          ),
                          onPressed: () {}),
                    ],
                    bottom: TabBar(
                        isScrollable: true,
                        indicatorColor: Utils.iconsColor,
                        labelColor: Utils.iconsColor,
                        unselectedLabelColor: Colors.black,
                        tabs: List.generate(
                          snapshot.data.data.length,
                          (index) => Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Text("${snapshot.data.data[index].name}"),
                          ),
                        )),
                  ),
                  body: TabBarView(
                    children: List.generate(
                      snapshot.data.data.length,
                      (index) => Container(
                        child: FutureBuilder<ProductModel>(
                            future: Provider.of<CategoryProvider>(context,
                                    listen: false)
                                .getCategoryProducts(
                                    id: snapshot.data.data[index].id),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                return Padding(
                                  padding: const EdgeInsets.only(
                                      right: 15, top: 15, bottom: 15),
                                  child: GridView.builder(
                                      gridDelegate:
                                          SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        childAspectRatio: 1.5 / 2,
                                        crossAxisSpacing: 0,
                                        mainAxisSpacing: 0,
                                      ),
                                      itemCount: snapshot.data.data.length,
                                      itemBuilder: (BuildContext ctx, i) {
                                        return GridSingleItem(
                                          index: i,
                                          media: snapshot.data.data,
                                        );
                                      }),
                                );
                              } else {
                                return Center(
                                  child: SpinKitDoubleBounce(
                                    color: Utils.iconsColor,
                                  ),
                                );
                              }
                            }),
                      ),
                    ),
                  ),
                ),
              );
            } else {
              return Scaffold(
                backgroundColor: Utils.primary,
                body: Center(
                  child: SpinKitDoubleBounce(
                    color: Utils.iconsColor,
                  ),
                ),
              );
            }
          }),
    );
  }
}
