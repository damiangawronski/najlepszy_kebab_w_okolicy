import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddOpinionPageContent extends StatefulWidget {
  const AddOpinionPageContent({
    Key? key,
  }) : super(key: key);

  @override
  State<AddOpinionPageContent> createState() => _AddOpinionPageContentState();
}

class _AddOpinionPageContentState extends State<AddOpinionPageContent> {
  var restaurantName = '';
  var kebabName = '';
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            decoration: const InputDecoration(
              hintText: 'podaj nazwę lokalu',
            ),
            onChanged: (newValue) {
              setState(() {
                restaurantName = newValue;
              });
            },
          ),
          TextField(
            decoration: const InputDecoration(
              hintText: 'podaj nazwę kebaba',
            ),
            onChanged: (newValue) {
              setState(() {
                kebabName = newValue;
              });
            },
          ),
          ElevatedButton(
              onPressed: () {
                FirebaseFirestore.instance.collection('places').add({
                  'name': restaurantName,
                  'kebab': kebabName,
                  'rating': 3.0,
                });
              },
              child: const Text('dodaj'))
        ],
      ),
    );
  }
}