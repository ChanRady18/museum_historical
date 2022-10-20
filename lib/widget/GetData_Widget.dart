import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../model/data_model.dart';
import '../provider/data_provider.dart';

class DataListWidget extends StatelessWidget {
  const DataListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var mc = Provider.of<DataProvider>(context, listen:false);
    mc.getDataList();

    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("TRENDING STORIES",
            style: GoogleFonts.poppins(
              textStyle: const TextStyle(
              color: Colors.black54,
              ),
            ),
          ),
          SizedBox(
            height: 500,
            child: Consumer<DataProvider>(
              builder: (context, mz, child) {
                if(mz.dataList.isNotEmpty){
                  return ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: mz.dataList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 5),
                          child: InkWell(
                            onTap: (){
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: ((context) => DataDetailPage(
                                          dm: mz.dataList[index]))));
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.7,
                              margin: const EdgeInsets.only(right: 12),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(vertical: 3.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(13),
                                      child: Image.network(
                                        mc.dataList[index].image.toString(),
                                        width: 120,
                                        height: 200,
                                        fit: BoxFit.fitHeight,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width * 0.52,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            mc.dataList[index].title.toString(),
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            style: GoogleFonts.poppins(
                                              textStyle: const TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w600,
                                                fontSize: 20,
                                              ),
                                            ),
                                          ),
                                          Text(
                                            mc.dataList[index].place.toString(),
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            style: GoogleFonts.poppins(
                                              textStyle: const TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 12,
                                              ),
                                            ),
                                          ),
                                          Text(
                                            mc.dataList[index].content.toString(),
                                            maxLines: 3,
                                            overflow: TextOverflow.ellipsis,
                                            style: GoogleFonts.poppins(
                                              textStyle: const TextStyle(
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

                      }
                  );
                }else{
                  return Container(
                    height: 450,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Colors.grey
                    ),
                    child: const Center(
                      child: CircularProgressIndicator(color: Colors.black,),
                    ),
                  );
                }
              },
            ),
          )
        ],

    );
  }
}

class DataDetailPage extends StatefulWidget {
  const DataDetailPage({Key? key, required this.dm}) : super(key: key);
  final DataModel dm;

  @override
  State<DataDetailPage> createState() => _DataDetailPageState();
}

class _DataDetailPageState extends State<DataDetailPage> {
  @override
  Widget build(BuildContext context) {

    var mc = Provider.of<DataProvider>(context, listen:false);
    mc.getDataList();

    return Scaffold(
      body: Consumer<DataProvider>(
        builder: (context, st, child) {
          if(st.dataList.isNotEmpty){
            return CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 33.0, horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //title
                        Text(
                          widget.dm.title.toString(),
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
                        //PLACE
                        Text(
                          widget.dm.place.toString(),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                              color: Colors.grey,
                              fontSize: 18,
                            ),
                          ),
                        ),
                        //PERIOD
                        Text(
                          widget.dm.period.toString(),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                              color: Colors.grey,
                              fontSize: 18,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        //image
                        Image.network(widget.dm.image.toString(),),
                        const SizedBox(
                          height: 18,
                        ),

                        //CONTENT

                        Text(
                          widget.dm.content.toString(),
                          style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          } else{
            return const Text("In Progress");
          }
        },
      ),
    );

  }
}
