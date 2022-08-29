import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class NoteScreen extends StatefulWidget {
  const NoteScreen({Key? key}) : super(key: key);

  @override
  State<NoteScreen> createState() => _NoteScreenState();
}

class _NoteScreenState extends State<NoteScreen> {
  TextEditingController controller = TextEditingController();
  List<String> data = [];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('it works');
        },
        child: const Icon(LineIcons.plus),
      ),
      body: SafeArea(
          child: Container(
        decoration: const BoxDecoration(color: Colors.white),
        child: GridView.builder(
            itemCount: 12,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, childAspectRatio: 0.5),
            itemBuilder: (context, index) {
              return Card(
                elevation: 9.0,
                child: SizedBox(
                  width: size.width * 0.5,
                  child: Column(
                    children: const [
                      Text("Title"),
                      SizedBox(
                        height: 10,
                      )
                    ],
                  ),
                ),
              );
            }),
      )),
    );
  }

  Widget _buildTodoTitle() {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
          hintText: "Enter title",
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade400),
          ),
          border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade100))),
    );
  }
}
