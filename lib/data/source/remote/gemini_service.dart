import 'dart:convert';
import 'dart:io';

import 'package:brainup/domain/model_ai/message_model.dart';
import 'package:http/http.dart' as http;

class GeminiService {
  final String apiKey = 'AIzaSyBenwZ4frHSXfZ6xHNmCqvbmiunhJkgm6Y';

  Future<String> generateSmart({
    required String prompt,
    required List<MessageModel> messages,
    File? imageFile,
  }) async {
    final url = Uri.parse(
      'https://generativelanguage.googleapis.com/v1/models/gemini-2.0-flash-lite:generateContent?key=$apiKey',
    );
    final headers = {'Content-Type': 'application/json'};
    final recentMessages = messages.length > 10
        ? messages.sublist(messages.length - 10)
        : messages;
    final historyContents = recentMessages.map((message) {
      final parts = <Map<String, dynamic>>[];

      if (message.text.isNotEmpty) {
        parts.add({"text": message.text});
      }

      if (message.imageFile != null) {
        final imageBytes = message.imageFile!.readAsBytesSync();
        final base64Image = base64Encode(imageBytes);

        final ext = message.imageFile!.path.split('.').last.toLowerCase();
        String mimeType;
        switch (ext) {
          case 'jpg':
          case 'jpeg':
            mimeType = 'image/jpeg';
            break;
          case 'png':
            mimeType = 'image/png';
            break;
          case 'webp':
            mimeType = 'image/webp';
            break;
          default:
            mimeType = 'image/jpeg';
        }

        parts.add({
          "inlineData": {
            "mimeType": mimeType,
            "data": base64Image,
          }
        });
      }

      return {
        "role": message.isUser ? "user" : "model",
        "parts": parts,
      };
    }).toList();

    List<Map<String, dynamic>> parts = [];
    if (imageFile != null) {
      parts.add({"text": prompt.isEmpty ? "Hãy mô tả bức tranh" : prompt});
      final imageBytes = await imageFile.readAsBytes();
      final base64Image = base64Encode(imageBytes);

      final extension = imageFile.path.split('.').last.toLowerCase();
      String mimeType;
      switch (extension) {
        case 'jpg':
        case 'jpeg':
          mimeType = 'image/jpeg';
          break;
        case 'png':
          mimeType = 'image/png';
          break;
        case 'webp':
          mimeType = 'image/webp';
          break;
        default:
          mimeType = 'image/jpeg';
          break;
      }

      parts.add({
        "inlineData": {
          "mimeType": mimeType,
          "data": base64Image,
        }
      });
    } else {
      parts.add({"text": prompt});
    }
    historyContents.add({
      "role": "user",
      "parts": parts,
    });
    final body = jsonEncode({
      "contents": historyContents,
    });

    final response = await http.post(url, headers: headers, body: body);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final text = data['candidates'][0]['content']['parts'][0]['text'];
      return text;
    } else {
      print('❌ Lỗi gọi Gemini API: ${response.statusCode} - ${response.body}');
      if (response.statusCode == 429) {
        throw Exception('Gemini API error: Too Many Requests (429)');
      }
      throw Exception('Gemini API error: ${response.reasonPhrase}');
    }
  }

  Future<List<String>> generateSuggestions(
      List<MessageModel> chatHistory) async {
    final List<MessageModel> historyForSuggestions = List.from(chatHistory);

    historyForSuggestions.add(MessageModel(
      text:
          '''Dựa trên đoạn trò chuyện trước đó, gợi ý 4 câu hỏi ngắn gọn (tối đa 10 chữ mỗi câu) mà người dùng có thể hỏi để tiếp tục cuộc trò chuyện với bạn.
      Ví dụ: "Làm sao để...", "Giải thích thêm về...", "Cho tôi biết thêm...", "Cách thức hoạt động..."
      Mỗi gợi ý trên một dòng, không đánh số, không giải thích,không cần phải ghi lại đề tài gợi ý đây là gợi ý 4 câu hỏi tiếp theo.''',
      isUser: true,
      time: '',
      imageFile: null,
    ));
    try {
      await Future.delayed(Duration(seconds: 1));
      final responseText = await generateSmart(
        prompt:
            "Gợi ý câu hỏi tiếp theo của người sử dụng chat ai dựa trên đoạn hội thoại,không cần phải ghi lại gợi ý đây là gợi ý 4 câu hỏi tiếp theo.",
        messages: historyForSuggestions,
      );

      final lines = responseText
          .split('\n')
          .map((e) => e.replaceFirst(RegExp(r'^[-•]\s*'), '').trim())
          .where((line) => line.isNotEmpty)
          .toList();

      return lines;
    } catch (e) {
      print("❌ Lỗi khi tạo gợi ý: $e");
      return [];
    }
  }
}
