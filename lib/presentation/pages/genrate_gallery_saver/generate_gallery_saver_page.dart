import 'package:brainup/presentation/base/view_model_ext.dart';
import 'package:brainup/presentation/pages/genrate_gallery_saver/generate_gallery_saver_view_model.dart';
import 'package:brainup/presentation/pages/photo_preview/photo_preview_page.dart';
import 'package:brainup/presentation/resources/gen/assets.gen.dart';
import 'package:brainup/shared/components/chammy_toolbar.dart';
import 'package:brainup/shared/themes/chammy_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class GenerateGallerySaverPage extends ConsumerStatefulWidget {
  const GenerateGallerySaverPage({super.key});

  static const rootLocation = "/generateGallerySaverPage";

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _GenerateGallerySaverState();
}

class _GenerateGallerySaverState
    extends ConsumerState<GenerateGallerySaverPage> {
  final String today = DateFormat('dd/MM/yyyy').format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: ChammyToolbar(
              title: "Gallery",
            ),
          ),
          SizedBox(
            height: 12.h,
          ),
          Expanded(child: _buildImageByDay())
        ],
      )),
    );
  }

  Widget _buildImageByDay() {
    return Consumer(builder: (context, ref, child) {
      final imageFolders = ref.watch(generateGallerySaverViewModelProvider
          .selectUiState((state) => state.datas));
      if (imageFolders?.entries.isNotEmpty != true) {
        return Center(
          child: Text("No images have been created yet.",
              style: BrainUpTextStyles.text14Bold),
        );
      }
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: ListView(
          children: imageFolders!.entries.map((entry) {
            final date = entry.key;
            final images = entry.value;
            final isToday = _isSameDay(date);
            final title = isToday ? 'Today' : date;

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: BrainUpTextStyles.text14Bold),
                SizedBox(height: 8.h),
                GridView.count(
                  crossAxisCount: 3,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisSpacing: 6.w,
                  mainAxisSpacing: 4.w,
                  children: images.map((image) {
                    return GestureDetector(
                      onTap: () {
                        context.push(
                          PhotoPreviewPage.rootLocation,
                          extra: {
                            PhotoPreviewPage.imageUrlKey: image.imageURL,
                            PhotoPreviewPage.backgroundColorKey:
                                image.bgColor ?? Assets.images.bg1
                          },
                        );
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Container(
                          decoration: BoxDecoration(
                            image: image.bgColor?.isNotEmpty == true
                                ? DecorationImage(
                                    image: AssetImage(image.bgColor ??
                                        Assets.images.bg1.path),
                                    fit: BoxFit.fill)
                                : null,
                          ),
                          child: Image.network(
                            image.imageURL ?? "",
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
                SizedBox(height: 16.h),
              ],
            );
          }).toList(),
        ),
      );
    });
  }

  bool _isSameDay(String dateTimeS) {
    return dateTimeS == today;
  }
}
