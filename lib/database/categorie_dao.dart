
import 'package:sqflite/sqflite.dart';
import '../models/categorie.dart';
import 'database_helper.dart';

class CategorieDao {
  static const String table = 'categories';

  Future<int> insererCategorie(Categorie categorie) async {
    // Récupère la connexion à la base de données.
    final Database db = await DatabaseHelper().database;

    // Insère la catégorie et récupère son identifiant généré.
    final int id = await db.insert(table, categorie.toMap());

    // Retourne l'identifiant de la catégorie insérée.
    return id;
  }
}
