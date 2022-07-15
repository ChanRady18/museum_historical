import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:museum_test_api/model/data_model.dart';
import 'package:museum_test_api/provider/data_provider.dart';
import 'package:provider/provider.dart';

class BannerWidget extends StatelessWidget {
  const BannerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var e = Provider.of<DataProvider>(context, listen: false);
    e.getBannerList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "FEATURED STORIES",
          style: GoogleFonts.poppins(
            textStyle: TextStyle(
              color: Colors.black54,
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          height: 250,
          child: Consumer<DataProvider>(
            builder: (context, mz, child) {
              return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: mz.bannerList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 5),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) => DetailPageBanner(
                                      m: mz.bannerList[index]))));
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.7,
                          margin: EdgeInsets.only(right: 12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(9),
                                child: Image.network(
                                  mz.bannerList[index].image.toString(),
                                  height: 150,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  mz.bannerList[index].title.toString(),
                                  style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  });
            },
          ),
        )
      ],
    );
  }
}

class DetailPageBanner extends StatefulWidget {
  const DetailPageBanner({Key? key, required this.m}) : super(key: key);
  final BannerModel m;

  @override
  State<DetailPageBanner> createState() => _DetailPageBannerState();
}

class _DetailPageBannerState extends State<DetailPageBanner> {
  @override
  Widget build(BuildContext context) {
    var e = Provider.of<DataProvider>(context, listen: false);
    e.getBannerList();

    return Scaffold(
      body: Consumer<DataProvider>(
        builder: (context, bd, child) {
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: CustomScrollView(
              slivers: [
                //IMAGE
                SliverToBoxAdapter(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 300,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(widget.m.image.toString()),
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

                //TITLE
                SliverToBoxAdapter(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        widget.m.title.toString(),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(Icons.location_pin),
                          Text(
                            widget.m.subtitle.toString(),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Text(
                        widget.m.description.toString(),
                        //maxLines: 5,
                        //overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                            color: Colors.black87,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
