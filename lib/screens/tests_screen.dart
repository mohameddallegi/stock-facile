
import 'package:flutter/material.dart';

import '../database/database_helper.dart';
import '../database/categorie_dao.dart';
import '../models/categorie.dart';

class TestsScreen extends StatelessWidget {
  const TestsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tests SQLite'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          ElevatedButton(
            onPressed: () async {
              final db = await DatabaseHelper().database;

              final resultat = await db.rawQuery(
                'SELECT COUNT(*) AS nb FROM categories',
              );

              debugPrint(
                'Nombre de catégories : ${resultat.first['nb']}',
              );
            },
            child: const Text('Ouvrir la base'),
          ),

          ElevatedButton(
            onPressed: () async {
              final nouvelle = Categorie(
                nom: 'Électroménager',
                description: 'Petits appareils',
              );

              final id = await CategorieDao()
                  .insererCategorie(nouvelle);

              debugPrint(
                'Catégorie insérée avec l\'id $id',
              );
            },
            child: const Text('Test : ajouter une catégorie'),
          ),
        ],
      ),
    );
  }
}
