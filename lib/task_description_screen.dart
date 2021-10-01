import 'package:flutter/material.dart';

class DescriptionScreen extends StatefulWidget {
  final String title;
  final String description;
 final  bool isCheckked ;

  const DescriptionScreen({Key? key, required this.title, required this.description,required this.isCheckked})
      : super(key: key);

  @override
  _DescriptionScreenState createState() => _DescriptionScreenState();
}

class _DescriptionScreenState extends State<DescriptionScreen> {
 // bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: const TextStyle(color: Colors.brown, fontSize: 25),
        ),
      ),
      body: Center(
        child: Card(
          child: SizedBox(
            height: 150,
            width: 350,
            child: Row(
              children: [
                Checkbox(
                  checkColor: Colors.brown,
                  value:widget.isCheckked,
                  onChanged: (bool? value){
                    setState(() {
                      widget.isCheckked;

                    });
                  }

                ),
                Center(
                  child: Text(
                    widget.description,
                    style: const TextStyle(color: Colors.brown, fontSize: 20),
                  ),
                ),
              ],
            ),
          ),
          color: Colors.grey[300],
        ),
      ),
    );
  }
}
