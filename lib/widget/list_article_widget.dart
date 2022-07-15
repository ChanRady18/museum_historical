import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:museum_test_api/provider/data_provider.dart';
import 'package:provider/provider.dart';

import 'detail_page_list_widget.dart';

class ListArticle extends StatelessWidget {
  const ListArticle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var e = Provider.of<DataProvider>(context, listen: false);
    e.getDataList();

    return Container(
      height: 350,
      child: Consumer<DataProvider>(
        builder: (context, dt, child) {
          return ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: dt.dataList.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 5),
                  child: InkWell(
                    onTap: () {
                     Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) => DetailPageList(
                                      dm: dt.dataList[index]))));
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.7,
                      margin: EdgeInsets.only(right: 12),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(13),
                              child: Image.network(
                                dt.dataList[index].image.toString(),
                                width: 120,
                                height: 200,
                                fit: BoxFit.fitHeight,
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            SizedBox(
                              width: 170.0,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    dt.dataList[index].title.toString(),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 22,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    dt.dataList[index].place.toString(),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 13,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    dt.dataList[index].content.toString(),
                                    maxLines: 5,
                                    overflow: TextOverflow.ellipsis,
                                    style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                        color: Colors.black54,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              });
        },
      ),
    );
  }
}
