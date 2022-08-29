import 'dart:convert';
import 'package:bible/screens/chapter.page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Bible extends StatefulWidget {
  const Bible({Key? key}) : super(key: key);

  @override
  State<Bible> createState() => _BibleState();
}

class _BibleState extends State<Bible> {
  List? data;


  @override
  void initState() {
    super.initState();
    loadJsonData();

  }

  Future<String> loadJsonData() async {
    var jsonText = await rootBundle.loadString('assets/bible_kjv.json');
    setState(() => {data = json.decode(jsonText)});
    return 'success';
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bible'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: data == null ? 0 : data!.length,
        itemBuilder: (BuildContext context, int index) {
          var name = data![index]['name'];
          List<dynamic> chapter = data![index]['CHAPTER'];
          // var email = data[index]['email'];
          // print("$index $name");
          

          return Column(
            children: <Widget>[
              ListTile(
                onTap: () {
                  for (var item in chapter) {
                    print(item['cnumber']);
                  }
                  Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: ((context) => ChapterPage(
                            chapter: chapter,
                            name:name
                          )),
                    ),
                  );
                },

                title: Text(name),
                // subtitle: Text(email),
              ),
              const Divider(),
            ],
          );
        },
      ),
    );
  }

}
