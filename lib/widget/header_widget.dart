import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/services.dart';

class HeaderAppBar extends StatefulWidget {
  const HeaderAppBar({Key? key}) : super(key: key);

  @override
  State<HeaderAppBar> createState() => _HeaderAppBarState();
}

class _HeaderAppBarState extends State<HeaderAppBar> {
  @override
  Widget build(BuildContext context) {
    
    DateTime datetime = DateTime.now();
    String datetime3 = DateFormat.MMMMEEEEd().format(datetime);
    print(datetime3);


    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Museum Historical",
              style: GoogleFonts.poppins(
                textStyle: TextStyle(color: Colors.black, fontSize: 26),
              ),
            ),
            Text(
              datetime3,
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                  color: Colors.black54,
                ),
              ),
            ),
          ],
        ),
        CircleAvatar(
          backgroundImage: NetworkImage(
              "https://i.pinimg.com/originals/9d/0a/0e/9d0a0e0f1798ad455cb4be47f8da992d.jpg"),
          radius: 30,
        ),
      ],
    );
  }
}
