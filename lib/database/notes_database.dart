import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sudoku02/models/sudoku.dart';

class SudokuDatabase {
  static final SudokuDatabase instance = SudokuDatabase._init();

  static Database? _database;

  SudokuDatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('sudokus.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    final idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    final textType = 'TEXT NOT NULL';
    final boolType = 'BOOLEAN NOT NULL';
    final integerType = 'INTEGER NOT NULL';

    await db.execute('''
CREATE TABLE $tableSudokus (
  ${SudokuFields.id} $idType,
  ${SudokuFields.isImportant} $boolType,
  ${SudokuFields.level} $integerType,
  ${SudokuFields.sudokustring} $textType,
  ${SudokuFields.createdTime} $textType,
  ${SudokuFields.time} $textType
  )
''');
  }

  Future<Sudoku> create(Sudoku note) async {
    final db = await instance.database;

    // final json = note.toJson();
    // final columns =
    //     '${NoteFields.title}, ${NoteFields.description}, ${NoteFields.time}';
    // final values =
    //     '${json[NoteFields.title]}, ${json[NoteFields.description]}, ${json[NoteFields.time]}';
    // final id = await db
    //     .rawInsert('INSERT INTO table_name ($columns) VALUES ($values)');

    final id = await db.insert(tableSudokus, note.toJson());
    return note.copy(id: id);
  }

  Future<Sudoku> readNote(int id) async {
    final db = await instance.database;

    final maps = await db.query(
      tableSudokus,
      columns: SudokuFields.values,
      where: '${SudokuFields.id} = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return Sudoku.fromJson(maps.first);
    } else {
      throw Exception('ID $id not found');
    }
  }

  Future<List<Sudoku>> readAllNotes() async {
    final db = await instance.database;

    final orderBy = '${SudokuFields.time} ASC';
    // final result =
    //     await db.rawQuery('SELECT * FROM $tableNotes ORDER BY $orderBy');

    final result = await db.query(tableSudokus, orderBy: orderBy);

    return result.map((json) => Sudoku.fromJson(json)).toList();
  }

  Future<int> update(Sudoku note) async {
    final db = await instance.database;

    return db.update(
      tableSudokus,
      note.toJson(),
      where: '${SudokuFields.id} = ?',
      whereArgs: [note.id],
    );
  }

  Future<int> delete() async {
    final db = await instance.database;

    return await db.delete(tableSudokus);
  }

  Future close() async {
    final db = await instance.database;

    db.close();
  }
}
