import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:muslim/services/QuranService.dart';

class SurahDetailsPage extends StatefulWidget {
  final int surahNumber;
  final String surahName;

  const SurahDetailsPage({required this.surahNumber, required this.surahName});

  @override
  _SurahDetailsPageState createState() => _SurahDetailsPageState();
}

class _SurahDetailsPageState extends State<SurahDetailsPage> {
  final QuranService _quranService = QuranService();
  List<dynamic> verses = [];

  @override
  void initState() {
    super.initState();
    loadAyahs();
  }

  Future<void> loadAyahs() async {
    try {
      final data = await _quranService.fetchAyatFromJson(widget.surahNumber);
      debugPrint('data : $data');
      setState(() {
        verses = data;
      });
    } catch (e) {
      print('Erreur lors du chargement des versets : $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.surahName),
      ),
      body: verses.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: verses.length,
        itemBuilder: (context, index) {
          final verse = verses[index];
          final verseText = verse['text'] ?? 'Verset indisponible';
          final translation = verse['translation'] ?? 'traducion manquant';

          return ListTile(
            title: Text(verseText),
            subtitle: Text(translation),
          );
        },
      ),
    );
  }
}




