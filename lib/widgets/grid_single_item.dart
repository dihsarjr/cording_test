import 'package:cached_network_image/cached_network_image.dart';
import 'package:coding_app/details_page.dart';
import 'package:coding_app/models/product_model.dart';
import 'package:coding_app/utils.dart';
import 'package:flutter/material.dart';

class GridSingleItem extends StatefulWidget {
  List<Datum> media;
  int index;
  GridSingleItem({Key key, this.media, this.index}) : super(key: key);

  @override
  _GridSingleItemState createState() => _GridSingleItemState();
}

class _GridSingleItemState extends State<GridSingleItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15, left: 15),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (ctx) => DetailsPage(
                          name: widget.media[widget.index].name,
                          id: widget.media[widget.index].id.toString(),
                          price: widget.media[widget.index].price.toString(),
                          image: widget.media[widget.index].category.media !=
                                      null &&
                                  widget.media[widget.index].category.media
                                          .length >
                                      0
                              ? widget.media[widget.index].category.media[0].url
                              : "https://images.unsplash.com/photo-1584824486509-112e4181ff6b?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80",
                          dis: removeAllHtmlTags(
                              widget.media[widget.index].description != null
                                  ? widget.media[widget.index].description
                                  : ""),
                        )));
          },
          child: Padding(
            padding: const EdgeInsets.all(1.0),
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: Container(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              IconButton(
                                  icon: Icon(
                                    Icons.favorite_border_rounded,
                                    color: Utils.iconsColor,
                                  ),
                                  onPressed: () {}),
                            ],
                          ),
                          Expanded(child: SizedBox()),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.35,
                            child: Text(
                              "${widget.media[widget.index].name}",
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                "₹ ${widget.media[widget.index].price}",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              Expanded(child: SizedBox()),
                              IconButton(
                                  icon: Icon(
                                    Icons.add,
                                    color: Utils.iconsColor,
                                  ),
                                  onPressed: () {})
                            ],
                          ),
                          Text(
                            "${removeAllHtmlTags(widget.media[widget.index].description != null ? widget.media[widget.index].description : "")}",
                            style: TextStyle(
                                fontSize: 10,
                                color: Colors.black12,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            offset: Offset(6.0, 6.0),
                            blurRadius: 16.0,
                          ),
                        ],
                        color: Utils.primary,
                        borderRadius: BorderRadius.circular(6)),
                  ),
                ),
                Positioned(
                  top: 15,
                  right: 0,
                  child: Hero(
                    tag: "${widget.media[widget.index].id}",
                    child: Container(
                      height: MediaQuery.of(context).size.width * 0.25,
                      width: MediaQuery.of(context).size.width * 0.25,
                      child: widget.media[widget.index].category.media !=
                                  null &&
                              widget.media[widget.index].category.media.length >
                                  0
                          ? CachedNetworkImage(
                              imageUrl: widget
                                  .media[widget.index].category.media[0].url,
                              fit: BoxFit.cover,
                              progressIndicatorBuilder:
                                  (context, url, downloadProgress) => Padding(
                                padding: EdgeInsets.all(40),
                                child: CircularProgressIndicator(
                                  value: downloadProgress.progress,
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                      Utils.iconsColor),
                                ),
                              ),
                              errorWidget: (context, url, error) =>
                                  Icon(Icons.error),
                            )
                          : Center(
                              child: Icon(Icons.error),
                            ),
                      decoration: BoxDecoration(boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.15),
                          offset: Offset(6.0, 6.0),
                          blurRadius: 16.0,
                        ),
                      ], shape: BoxShape.circle, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String removeAllHtmlTags(String htmlText) {
    RegExp exp = RegExp(r"<[^>]*>", multiLine: true, caseSensitive: true);

    return htmlText.replaceAll(exp, '');
  }
}
