// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class RunwaveModel {
  final String? modelCode;
  final String? modelName;
  final double? strength;
  final double? CFGScale;
  RunwaveModel({
    this.modelCode,
    this.modelName,
    this.strength,
    this.CFGScale,
  });

  RunwaveModel copyWith({
    String? modelCode,
    String? modelName,
    double? strength,
    double? CFGScale,
  }) {
    return RunwaveModel(
      modelCode: modelCode ?? this.modelCode,
      modelName: modelName ?? this.modelName,
      strength: strength ?? this.strength,
      CFGScale: CFGScale ?? this.CFGScale,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'modelCode': modelCode,
      'modelName': modelName,
      'strength': strength,
      'CFGScale': CFGScale,
    };
  }

  factory RunwaveModel.fromMap(Map<String, dynamic> map) {
    return RunwaveModel(
      modelCode: map['modelCode'] != null ? map['modelCode'] as String : null,
      modelName: map['modelName'] != null ? map['modelName'] as String : null,
      strength: map['strength'] != null ? map['strength'] as double : null,
      CFGScale: map['CFGScale'] != null ? map['CFGScale'] as double : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory RunwaveModel.fromJson(String source) => RunwaveModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'RunwaveModel(modelCode: $modelCode, modelName: $modelName, strength: $strength, CFGScale: $CFGScale)';
  }

  @override
  bool operator ==(covariant RunwaveModel other) {
    if (identical(this, other)) return true;

    return other.modelCode == modelCode &&
        other.modelName == modelName &&
        other.strength == strength &&
        other.CFGScale == CFGScale;
  }

  @override
  int get hashCode {
    return modelCode.hashCode ^ modelName.hashCode ^ strength.hashCode ^ CFGScale.hashCode;
  }
}
