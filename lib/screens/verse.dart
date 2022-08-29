import 'package:bible/screens/bible.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Verse extends StatefulWidget {
  List<dynamic>? verseText;
  dynamic? chapter;
  dynamic? name;
  Verse({Key? key, this.verseText, this.name, this.chapter}) : super(key: key);

  @override
  State<Verse> createState() => _VerseState();
}

class _VerseState extends State<Verse> {
  @override
  void initState() {
    super.initState();
    print(widget.name);
    print(widget.chapter);
    print(widget.verseText);
  }

  void loadJson() {
    print('it works for me');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(color: Colors.white),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _buildHeader(),
              const SizedBox(
                height: 30,
              ),
              _buildBibleContent()
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        IconButton(onPressed: () {}, icon: const Icon(Icons.arrow_back_ios)),
        GestureDetector(
          onTap: () {
            Navigator.push(context,
                CupertinoPageRoute(builder: ((context) => const Bible())));
          },
          child: Text(
            "${widget.name} ${widget.chapter}",
            style: const TextStyle(
              fontSize: 20,
              color: Colors.pinkAccent,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
        IconButton(
            onPressed: () {
              int chap = int.parse(widget.chapter);
              setState(() {
                //chap += 1;
                // loadJsonData()
              });
              print(chap);
            },
            icon: const Icon(Icons.arrow_forward_ios))
      ],
    );
  }

  Widget _buildBibleContent() {
    return Expanded(
      child: ListView.builder(
        itemCount: widget.verseText!.length,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                    
                },
                child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: widget.verseText![index]['vnumber'],
                              style: widget.verseText![index]['vnumber'] == '1'
                                  ? const TextStyle(
                                      color: Colors.deepOrange,
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                    )
                                  : const TextStyle(
                                      color: Colors.deepOrange,
                                    ),
                            ),

                            TextSpan(
                              text: widget.verseText![index]['text'],
                              style: const TextStyle(fontFamily: 'roboto'),
                            ),
                            // TextSpan(text: ' world!'),
                          ],
                        ),
                        textAlign: TextAlign.justify)),
              ),
            ],
          );
        },
      ),
    );
  }
}
