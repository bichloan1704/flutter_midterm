import 'package:flutter/material.dart';

class ProducCard extends StatelessWidget {
  final String name, image, category;
  final String price;
  final VoidCallback editPress, deletePress;

  ProducCard(
      {required this.name,
      required this.price,
      required this.image,
      required this.category,
      required this.editPress,
      required this.deletePress
      });
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      padding: EdgeInsets.only(top: 20),
      child: Column(
        children: [
          Flexible(
            flex: 3,
            child: Image.network(
              image,
              fit: BoxFit.cover,
            ),
          ),
          Flexible(
            flex: 1,
            child: Text(
              category,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 20, color: const Color.fromARGB(255, 114, 94, 94)),
            ),
          ),
          Flexible(
            flex: 1,
            child: Text(
              name,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, color: Colors.black),
            ),
          ),
          Flexible(
            flex: 1,
            child: Text(
              '$price',
              style: TextStyle(
                  fontSize: 20, color: const Color.fromARGB(255, 211, 98, 98)),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                child: ElevatedButton(
                    onPressed: editPress, child: Icon(Icons.edit)),
              ),
              SizedBox(width: 10),
              Flexible(
                child: ElevatedButton(
                    onPressed: deletePress, child: Icon(Icons.delete)),
              )
            ],
          )
        ],
      ),
    );
  }
}
