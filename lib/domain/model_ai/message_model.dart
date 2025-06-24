import 'dart:io';
import 'package:google_generative_ai/google_generative_ai.dart';

class MessageModel {
  final String text;
  final String time;
  final bool isUser;
  final File? imageFile;
  MessageModel({
    required this.text,
    required this.time,
    required this.isUser,
    required this.imageFile,
  });
}
