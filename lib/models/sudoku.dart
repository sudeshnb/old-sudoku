final String tableSudokus = 'sudokus';

class SudokuFields {
  static final List<String> values = [
    /// Add all fields
    id, isImportant, level, sudokustring, createdTime, time
  ];

  static final String id = '_id';
  static final String level = 'level';
  static final String sudokustring = 'sudokustring';
  static final String time = 'time';

  static final String isImportant = 'isImportant';
  static final String createdTime = 'createdTime';
}

class Sudoku {
  final int? id;
  final int level;
  final String sudokustring;
  final String time;
  final DateTime createdTime;

  final bool isImportant;

  const Sudoku({
    this.id,
    required this.isImportant,
    required this.level,
    required this.sudokustring,
    required this.time,
    required this.createdTime,
  });

  Sudoku copy({
    int? id,
    bool? isImportant,
    int? level,
    String? title,
    String? time,
    DateTime? createdTime,
  }) =>
      Sudoku(
        id: id ?? this.id,
        isImportant: isImportant ?? this.isImportant,
        level: level ?? this.level,
        sudokustring: title ?? this.sudokustring,
        time: time ?? this.time,
        createdTime: createdTime ?? this.createdTime,
      );

  static Sudoku fromJson(Map<String, Object?> json) => Sudoku(
        id: json[SudokuFields.id] as int?,
        isImportant: json[SudokuFields.isImportant] == 1,
        level: json[SudokuFields.level] as int,
        sudokustring: json[SudokuFields.sudokustring] as String,
        time: json[SudokuFields.time] as String,
        createdTime: DateTime.parse(json[SudokuFields.createdTime] as String),
      );

  Map<String, Object?> toJson() => {
        SudokuFields.id: id,
        SudokuFields.sudokustring: sudokustring,
        SudokuFields.isImportant: isImportant ? 1 : 0,
        SudokuFields.level: level,
        SudokuFields.time: time,
        SudokuFields.createdTime: createdTime.toIso8601String(),
      };
}
