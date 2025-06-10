import 'package:brainup/data/repository/source/local/preference/share_pref_login.dart';
import 'package:brainup/presentation/pages/genrate_gallery_saver/generate_gallery_saver_page.dart';
import 'package:brainup/presentation/pages/home/home_page.dart';
import 'package:brainup/presentation/pages/login/login_page.dart';
import 'package:brainup/presentation/pages/login/verify_mail_page.dart';
import 'package:brainup/presentation/pages/photo_preview/photo_preview_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final appRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: LoginPage.rootLocation,
    redirect: (context, state) async {
      final check = await SharePrefLogin.instance.isLoggedIn();
      final loggingIn = state.matchedLocation == LoginPage.rootLocation;

      if (!check && !loggingIn) return LoginPage.rootLocation;

      if (check && loggingIn) return Home.rootLocation;

      return null;
    },
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
        path: LoginPage.rootLocation,
        builder: (context, state) => LoginPage(),
      ),
      GoRoute(
        path: Home.rootLocation,
        builder: (context, state) => Home(),
      ),
      GoRoute(
        path: VerifyEmailPage.rootLocation,
        builder: (context, state) => VerifyEmailPage(),
      ),
    ],
  );
});
