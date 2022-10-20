import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';


import '../model/data_model.dart';
import '../provider/data_provider.dart';
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
            textStyle: const TextStyle(
              color: Colors.black54,
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
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
                                  builder: ((context) => DetailBannerPage(
                                      m: mz.bannerList[index]))));
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.7,
                          margin: const EdgeInsets.only(right: 12),
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
                              const SizedBox(
                                height: 5,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  mz.bannerList[index].title.toString(),
                                  style: GoogleFonts.poppins(
                                    textStyle: const TextStyle(
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

class DetailBannerPage extends StatefulWidget {
  const DetailBannerPage({Key? key, required this.m}) : super(key: key);
  final BannerModel m;

  @override
  State<DetailBannerPage> createState() => _DetailBannerPageState();
}

class _DetailBannerPageState extends State<DetailBannerPage> {
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

                //TITLE
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical:28.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          widget.m.title.toString(),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 32,
                            ),
                          ),
                        ),

                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Icon(Icons.location_pin,color: Colors.grey,),
                            Text(
                              widget.m.subtitle.toString(),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.poppins(
                                textStyle: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(
                          height: 30,
                        ),
                        //image
                        Image.network(widget.m.image.toString()),

                        const SizedBox(
                          height: 18,
                        ),

                        Text(
                          widget.m.description.toString(),
                          //maxLines: 5,
                          //overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                              color: Colors.black87,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ],
                    ),
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

