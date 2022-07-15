import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:museum_test_api/model/data_model.dart';
import 'package:provider/provider.dart';

import '../provider/data_provider.dart';

class DetailPageList extends StatefulWidget {
  const DetailPageList({Key? key, required this.dm}) : super(key: key);

  final DataModel dm;

  @override
  State<DetailPageList> createState() => _DetailPageListState();
}

class _DetailPageListState extends State<DetailPageList> {
  @override
  Widget build(BuildContext context) {
    var e = Provider.of<DataProvider>(context, listen: false);
    e.getBannerList();

    return Scaffold(
      body: Consumer<DataProvider>(
        builder: (context, st, child) {
          return CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 500,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(widget.dm.image.toString()),
                        fit: BoxFit.cover,
                      ),
                      color: Color.fromARGB(255, 31, 31, 31),
                      borderRadius: BorderRadius.all(
                        Radius.circular(13),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            icon: Icon(Icons.arrow_back),
                            onPressed: () => Navigator.of(context).pop(),
                            iconSize: 38,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //title
                      Text(
                        widget.dm.title.toString(),
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                      //PLACE
                      Text(
                        widget.dm.place.toString(),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                            fontSize: 16,
                            color: Colors.black87,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),

                      //PERIOD
                      Text(
                        widget.dm.period.toString(),
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                            fontSize: 16,
                            color: Colors.black87,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      //CONTENT

                      Text("- "+
                        widget.dm.content.toString(),
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                            fontSize: 14,
                            color: Colors.black54,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
