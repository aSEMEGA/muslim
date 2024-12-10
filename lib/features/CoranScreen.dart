import 'package:flutter/material.dart';
import 'package:muslim/featuresDetailsScreen/ReadQuranPage.dart';
import 'package:muslim/featuresDetailsScreen/RecitationPage.dart';

class Coranscreen extends StatefulWidget {
  const Coranscreen({super.key});

  @override
  State<Coranscreen> createState() => _CoranscreenState();
}

class _CoranscreenState extends State<Coranscreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Coran'),
        ),
      ),
      body: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.book),
            title: Text('Lire le coran'),
            onTap: (){
              Navigator.push(context, 
                  MaterialPageRoute(builder: (context) => ReadQuranPage()));
            },
          ),
          ListTile(
            leading: Icon(Icons.headset),
            title: Text('Ecouter le Coran'),
            onTap: (){
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => RecitationPage())
              );
            },
          )
        ],
      ),
    );
  }
}
