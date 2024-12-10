import 'package:dio/dio.dart';
import 'dart:convert';

import 'package:flutter/services.dart';

class QuranService{
  final Dio _dio = Dio();
  Future<List<dynamic>> fetchSurahs() async {
    try {
      final response = await _dio.get(
          'https://api.quran.com/api/v4/chapters?language=fr');
      if (response.statusCode == 200) {
        return response.data['chapters'];
      } else {
        throw Exception('Erreur lors du chargement des sourates.');
      }
    } catch (e) {
      throw Exception('Erreur lors du chargement des sourates: $e');
    }
  }

    Future<List<dynamic>> fetchAyah(int surahNumber) async{
      try{
        final response = await _dio.get('https://api.quran.com/api/v4/verses/by_chapter/$surahNumber?language=fr');
        if(response.statusCode == 200){
          return response.data['data']['verses'];
        }else{
          throw Exception('Erreur lors du chargement des versets.');
        }
      }catch (e){
        throw Exception('Erreurs de chargements');
      }

    }
  Future<List<dynamic>> fetchSuraFromJon() async{
    try{
      final String response = await rootBundle.loadString('assets/json/surahs.json');
      final data = json.decode(response);
      return data['chapters'].map((surah) => {
        'name' : surah['name'],
        'transliteration' : surah['transliteration'],
        'type' : surah['type']
      }).toList();
    }catch (e){
      throw Exception('Erreur lors de la lecture du fichier JSON : $e');
    }
  }

  Future<List<dynamic>> fetchAyatFromJson(int surahId) async{
    try{
      final String response = await rootBundle.loadString('assets/json/surahWithayat.json');
      final data = json.decode(response);
      final surah = data.firstWhere((item) => item['id'] == surahId);
      return surah['verses'];

    }catch (e){
      throw Exception('Erreur de chargement $e');
    }
  }

  Future<List<dynamic>> fetchRecitations() async {
    try {
      final response = await _dio.get('https://api.quran.com/api/v4/resources/recitations');
      if (response.statusCode == 200) {
        return response.data['data']['recitations'];
      } else {
        throw Exception('Erreur lors du chargement des récitations.');
      }
    } catch (e) {
      throw Exception('Erreur lors du chargement des récitations: $e');
    }
  }

}