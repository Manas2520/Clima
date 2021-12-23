import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'textstyles.dart';

class InfoTile extends StatefulWidget {
  var first, second;
  InfoTile(this.first, this.second);

  @override
  _InfoTileState createState() => _InfoTileState();
}

class _InfoTileState extends State<InfoTile> {
  var key, value;

  @override
  Widget build(BuildContext context) {
    key = widget.first;
    value = widget.second;
    return Container(
      // decoration: BoxDecoration(
      //   border: Border(
      //     top: BorderSide(
      //       color: Colors.white,
      //       width: 0.5,
      //     ),
      //   ),
      // ),
      padding: EdgeInsets.only(left: 20, right: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '$key',
            style: GoogleFonts.comfortaa(
              textStyle: kInfoTileTextStyle,
            ),
          ),
          Text(
            '$value',
            style: GoogleFonts.comfortaa(
              textStyle: kInfoTileTextStyle,
            ),
          ),
        ],
      ),
    );
  }
}

class Ruler extends StatelessWidget {
  const Ruler({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: 370,
      height: 1,
    );
  }
}
