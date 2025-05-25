import 'package:brainup/shared/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:photo_view/photo_view.dart';

class PhotoPreviewPage extends ConsumerStatefulWidget {
  const PhotoPreviewPage({
    super.key,
    this.imageUrl,
    required this.backgroundColor,
  });

  static const rootLocation = "/photoPreviewPage";
  static const imageUrlKey = "imageUrlKey";
  static const backgroundColorKey = "backgroundColorKey";

  final String? imageUrl;
  final String backgroundColor;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PhotoPreviewState();
}

class _PhotoPreviewState extends ConsumerState<PhotoPreviewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PhotoView(
              backgroundDecoration: BoxDecoration(
                image: widget.backgroundColor.isNotEmpty
                    ? DecorationImage(image: AssetImage(widget.backgroundColor), fit: BoxFit.fill)
                    : null,
              ),
              imageProvider: NetworkImage(widget.imageUrl ?? empty)),
          Positioned(
            right: 16.w,
            child: SafeArea(
              child: IconButton(
                icon: Icon(
                  Icons.close,
                  color: widget.backgroundColor.isNotEmpty ? Colors.black : Colors.white,
                  size: 28.w,
                ),
                onPressed: () {
                  context.pop();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
