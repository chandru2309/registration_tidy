import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DataBaseHelper {
  static const dataBaseName = 'Registration.db';
  static const dataBaseVersion = 9;
  static const dataBaseTableName = '_registrationTable';

  static const columnId = 'id';
  static const columnStudentName = '_studentName';
  static const columnFatherName = '_fatherName';
  static const columnMotherName = '_motherName';
  static const columnDateOfBirth = '_dateOfBirth';
  static const columnEmail = '_email';
  static const columnPhone = '_phone';
  static const columnGender = '_gender';
  static const columnQualification = '_qualification';
  late Database _db;

  Future<void> initialization() async {
    final documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, dataBaseTableName);
    _db = await openDatabase(
      path,
      version: dataBaseVersion,
      onCreate: _onCreate,
      onUpgrade: _onUpgrade,
    );
  }

  Future _onCreate(Database dataBase, int version) async {
    await dataBase.execute('''
CREATE TABLE $dataBaseTableName(
$columnId INTEGER PRIMARY KEY,
$columnStudentName TEXT,
$columnFatherName TEXT,
$columnMotherName TEXT,
$columnDateOfBirth TEXT,
$columnEmail TEXT,
$columnPhone TEXT,
$columnGender TEXT,
$columnQualification TEXT
)
''');
  }

  Future _onUpgrade(Database database, int oldVersion, int newVersion) async {
    await database.execute('DROP TABLE $dataBaseTableName');
    _onCreate(database, newVersion);
  }

  Future<int> insertregistrationdetails(Map<String, dynamic> row) async {
    return await _db.insert(dataBaseTableName, row);
  }

  Future<List<Map<String, dynamic>>> getAllRegistrationDetails() async {
    return await _db.query(dataBaseTableName);
  }
  Future<int> updateRegistrationDetails(Map<String, dynamic> row) async {
    int id = row[columnId];
    return await _db.update(
      dataBaseTableName,
      row,
      where: '$columnId = ?',
      whereArgs: [id],
    );
  }
  Future<int> deleteRegistrationDetails(int id) async {
    return await _db.delete(
      dataBaseTableName,
      where: '$columnId = ?',
      whereArgs: [id],
    );
  }
}
