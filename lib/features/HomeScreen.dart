import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:muslim/features/CoranScreen.dart';
import 'package:muslim/features/CultureScreen.dart';
import 'package:muslim/features/DouaScreen.dart';
import 'package:muslim/features/HadithScreen.dart';
import 'package:muslim/features/JurisprudenceScreen.dart';
import 'package:muslim/features/PrayersScreen.dart';
import 'package:muslim/features/QuizScreen.dart';
import 'package:muslim/features/SettingsScreen.dart';
import 'package:muslim/features/TafsirScreen.dart';
import 'package:muslim/features/TasbihScreen.dart';

class Homescreen extends StatelessWidget {
   Homescreen({super.key});


  final List<Map<String , dynamic>> features = [
    { 'title' : 'Coran', 'image' : 'assets/images/core/svg/quran.jpg', 'route' : Coranscreen()},
    { 'title' : 'Hadtih', 'image' : 'assets/images/core/svg/hadith.png', 'route' : HadithScreen()},
    { 'title' : 'Tafsir', 'image' : 'assets/images/core/svg/tafsir.jfif', 'route' : TafsirScreen()},
    { 'title' : 'Doua', 'image' : 'assets/images/core/svg/priere.jfif', 'route' : DouaScreen()},
    { 'title' : 'Prière', 'image' : 'assets/images/core/svg/prieres.jpg', 'route' : PrayerScreen()},
    { 'title' : 'Jurisprudence', 'image' : 'assets/images/core/svg/juris.jfif', 'route' : JurisprudenceScreen()},
    { 'title' : 'Tasbih', 'image' : 'assets/images/core/svg/tasbih.jfif', 'route' : TasbihScreen()},
    { 'title' : 'Culture Géneral', 'image' : 'assets/images/core/svg/culture.png', 'route' : CultureScreen()},
    { 'title' : 'Quiz', 'image' : 'assets/images/core/svg/quiz.jfif', 'route' : QuizScreen()},
    { 'title' : 'Paramètre', 'image' : 'assets/images/core/svg/settings.png', 'route' : SettingsScreen()},




  ];

   @override
   Widget build(BuildContext context) {
     return Scaffold(
       appBar: AppBar(
         title: Center(child: Text('Accueil')),
       ),
       body: SingleChildScrollView(
         scrollDirection: Axis.vertical,
         child: Padding(
           padding: const EdgeInsets.all(8.0),
           child: GridView.builder(
             itemCount: features.length,
             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
               crossAxisCount: 2,
               crossAxisSpacing: 10,
               mainAxisSpacing: 10,
             ),
             itemBuilder: (context, index) {
               final feature = features[index];
               return GestureDetector(
                 onTap: () {
                   Navigator.push(
                     context,
                     MaterialPageRoute(
                       builder: (context) => feature['route'],
                     ),
                   );
                 },
                 child: Card(
                   elevation: 5,
                   child: Column(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                       ClipOval(
                         child: Image.asset(
                           feature['image'],
                           width: 80,
                           height: 80,
                           fit: BoxFit.cover,
                         ),
                       ),
                       SizedBox(height: 10),
                       Text(
                         feature['title'],
                         textAlign: TextAlign.center,
                         style: TextStyle(
                           fontSize: 14,
                           fontWeight: FontWeight.bold,
                         ),
                       ),
                     ],
                   ),
                 ),
               );
             },
             // Permet de réduire la hauteur du GridView
             shrinkWrap: true,
             // Désactive le défilement interne
             physics: NeverScrollableScrollPhysics(),
           ),
         ),
       ),
     );
   }


}
