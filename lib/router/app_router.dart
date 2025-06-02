import 'package:brainup/presentation/pages/genrate_gallery_saver/generate_gallery_saver_page.dart';
import 'package:brainup/presentation/pages/login_brain_up/login_brain_up_screen.dart';
import 'package:brainup/presentation/pages/photo_preview/photo_preview_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final appRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: LoginBrainUpScreen.rootLocation,
    routes: [
      GoRoute(
        path: GenerateGallerySaverPage.rootLocation,
        builder: (context, state) => GenerateGallerySaverPage(),
      ),
      GoRoute(
        path: PhotoPreviewPage.rootLocation,
        builder: (context, state) {
          Map<String, dynamic> args = state.extra as Map<String, dynamic>;
          return PhotoPreviewPage(
            imageUrl: args[PhotoPreviewPage.imageUrlKey],
            backgroundColor: args[PhotoPreviewPage.backgroundColorKey],
          );
        },
      ),
      GoRoute(
        path: GenerateGallerySaverPage.rootLocation,
        builder: (context, state) => GenerateGallerySaverPage(),
      ),
      GoRoute(
        path: LoginBrainUpScreen.rootLocation,
        builder: (context, state) => LoginBrainUpScreen(),
      ),
      // GoRoute(
      //   path: HomeBrainUpScreen.rootLocation,
      //   builder: (context, state) => HomeBrainUpScreen(),
      // ),
      // GoRoute(
      //   path: ChatAiScreen.rootLocation,
      //   builder: (context, state) => ChatAiScreen(),
      // ),
      // GoRoute(
      //   path: SmartAiQuizz.rootLocation,
      //   builder: (context, state) => SmartAiQuizz(),
      // ),
      // GoRoute(
      //   path: QuizzRoomScreen.rootLocation,
      //   builder: (context, state) => QuizzRoomScreen(),
      // ),
      // GoRoute(
      //   path: QuestionAi.rootLocation,
      //   builder: (context, state) => QuestionAi(),
      // ),
      // GoRoute(
      //   path: ProfileScreen.rootLocation,
      //   builder: (context, state) => ProfileScreen(),
      // )
    ],
  );
});
