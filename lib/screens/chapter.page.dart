import 'package:bible/screens/verse.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChapterPage extends StatefulWidget {
  List<dynamic>? chapter;
  String? name;
  ChapterPage({Key? key, this.chapter,this.name}) : super(key: key);

  @override
  State<ChapterPage> createState() => _ChapterPageState();
}

class _ChapterPageState extends State<ChapterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Chapter'),
          centerTitle: true,
        ),
        body: _buildChapterGrid());
  }

  Widget _buildChapterGrid() {
    return GridView.builder(
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
        shrinkWrap: true,
        itemCount: widget.chapter!.length,
        itemBuilder: (context, index) {
          return TextButton(
              onPressed: () {
                //print(widget.chapter![index]['VERS']);
                Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: ((context) => Verse(
                          verseText: widget.chapter![index]['VERS'],
                          name: widget.name,
                          chapter: widget.chapter![index]['cnumber'],
                        )),
                  ),
                );
              },
              child: Text(widget.chapter![index]['cnumber']));
        });
  }
}
