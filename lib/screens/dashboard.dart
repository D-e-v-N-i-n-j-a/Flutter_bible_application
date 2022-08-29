import 'package:bible/screens/search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

import 'bible.dart';
import 'note.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: size.width,
          height: size.height,
          child: Row(
            children: [
              Container(
                width: 65,
                height: size.height,
                decoration: const BoxDecoration(color: Colors.white),
                child: Column(
                  children: [_buildLogoContainer(size), _buildSideBarIcons()],
                ),
              ),
              Expanded(
                child: Container(child: _buildFrontalPage(size)),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLogoContainer(Size size) {
    return Container(
      width: size.width,
      height: size.height * 0.4,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const [
            CircleAvatar(
              backgroundColor: Colors.blue,
              child: Icon(LineIcons.arrowLeft, color: Colors.white),
            ),
            RotatedBox(
              quarterTurns: 3,
              child: Text("bibleapp",
                  style: TextStyle(color: Colors.lime, fontSize: 26)),
            )
          ]),
    );
  }

  Widget _buildSideBarIcons() {
    return Expanded(
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.blueAccent,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
                onPressed: () {
                  Navigator.push(context, CupertinoPageRoute(builder: ((context) => const NoteScreen())));
                },
                icon: const Icon(
                  LineIcons.pen,
                  color: Colors.white,
                )),
            IconButton(
                onPressed: () {},
                icon: const Icon(LineIcons.pray, color: Colors.white)),
            IconButton(
                onPressed: () {
                  Navigator.push(context,
                      CupertinoPageRoute(builder: (ctx) => const Bible()));
                },
                icon: const Icon(LineIcons.bookOpen, color: Colors.white)),
            IconButton(
                onPressed: () {},
                icon: const Icon(LineIcons.bookmark, color: Colors.white)),
            IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      CupertinoPageRoute(
                          builder: (context) => const SearchScreen()));
                },
                icon: const Icon(LineIcons.search, color: Colors.white)),
          ],
        ),
      ),
    );
  }

  Widget _buildFrontalPage(Size size) {
    return Container(
      decoration: const BoxDecoration(
          // gradient: LinearGradient(
          //   colors: [Colors.lightBlue,Colors.blue],
          //     begin:  FractionalOffset(0.0, 0.0),
          //     end:  FractionalOffset(0.5, 0.0),
          //     stops: [0.0, 1.0],
          //     tileMode: TileMode.clamp
          // )
          ),
      child: Column(
        children: [
          Container(
            width: size.width,
            height: 200,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: const [
                Padding(
                  padding: EdgeInsets.only(right: 8.0),
                  child: Text(
                    "Abigail Watson",
                    style: TextStyle(
                      fontFamily: 'roboto',
                      fontSize: 24,
                      color: Colors.blueAccent,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 12.0),
                  child: CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage('assets/me-about.jpg')),
                )
              ],
            ),
          ),

          // SCRIPTURE DISPLAY BOARD
          Container(
            width: size.width * 0.8,
            height: 250,
            decoration: BoxDecoration(
                gradient: const LinearGradient(
                    colors: [Colors.lightBlue, Colors.blue],
                    begin: FractionalOffset(0.0, 0.0),
                    end: FractionalOffset(0.5, 0.0),
                    stops: [0.0, 1.0],
                    tileMode: TileMode.clamp),
                borderRadius: BorderRadius.circular(12)),
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "ou were in Eden, the garden of God; Every precious stone [was] your covering: The sardius, topaz, and diamond, Beryl, onyx, and jasper, Sapphire, turquoise, and emerald with gold. The workmanship of your timbrels and pipes Was prepared for you on the day you were created.",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                    textAlign: TextAlign.justify,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: const [
                      Text('Genesis 1:1',
                          style: TextStyle(
                            fontSize: 24,
                          ))
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
