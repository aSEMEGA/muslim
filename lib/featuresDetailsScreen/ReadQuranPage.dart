import 'dart:async';

import 'package:flutter/material.dart';
import 'package:muslim/featuresDetailsScreen/SurahDetailsPage.dart';
import 'dart:convert';

import 'package:muslim/services/QuranService.dart';


class ReadQuranPage extends StatefulWidget {
  const ReadQuranPage({super.key});

  @override
  State<ReadQuranPage> createState() => _ReadQuranPageState();
}

class _ReadQuranPageState extends State<ReadQuranPage> {

  final QuranService _quranService = QuranService();
  List<dynamic> surahs = [];

  @override
  void initState() {
    super.initState();
    loadSurah();
  }

  Future<void> loadSurah() async {
    try {
      final data = await _quranService.fetchSuraFromJon();
      debugPrint('Données des sourates : $data');
      setState(() {
        surahs = data;
      });
    } catch (e) {
      print('Erreur lors du chargement des sourates : $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Lire le Coran"),
        ),
      ),
      body: surahs.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: surahs.length,
        itemBuilder: (context, index) {
          final surah = surahs[index];

          // Extraire les informations nécessaires
          final surahId = surah['id'] ?? 0;
          final surahName = surah['name'] ?? 'Nom indisponible';
          final transliteration = surah['transliteration'] ?? 'transliteration manquante';
          final type = surah['type'];

          return ListTile(
            title: Text(surahName),
            subtitle: Text(transliteration),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SurahDetailsPage(
                    surahNumber: surahId,
                    surahName: surahName,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }


}
