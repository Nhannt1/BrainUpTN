import 'package:brainup/di/di.dart';
import 'package:brainup/presentation/pages/home/widgets/provider_your_group/bloc/your_group_bloc.dart';
import 'package:brainup/presentation/pages/home/widgets/provider_your_group/bloc/your_group_event.dart';
import 'package:brainup/presentation/pages/videos_lecture/provider/provider_video_player/bloc/video_player_bloc.dart';
import 'package:brainup/presentation/pages/videos_lecture/provider/provider_video_player/repository/video_lecture_repository.dart';
import 'package:brainup/presentation/pages/your_group/widget/provider_group_activity/bloc/group_activity_bloc.dart';
import 'package:brainup/presentation/pages/your_group/widget/provider_group_activity/repository/repository.dart';
import 'package:brainup/presentation/pages/your_group/widget/provider_group_header/bloc/group_lesson_bloc.dart';
import 'package:brainup/presentation/pages/your_group/widget/provider_group_header/repository/lesson_repository.dart';
import 'package:brainup/presentation/pages/your_group/widget/provider_group_member/bloc/group_member_bloc.dart';
import 'package:brainup/presentation/pages/your_group/widget/provider_group_member/group_member.dart';
import 'package:brainup/presentation/pages/your_group/widget/provider_group_member/repository/member_repository.dart';
import 'package:brainup/presentation/pages/your_group/widget/provider_group_state/bloc/group_state_bloc.dart';
import 'package:brainup/presentation/pages/your_group/widget/provider_group_state/responsitory/fetch_score.dart';
import 'package:brainup/presentation/pages/your_group/widget/provider_study_material/bloc/study_material_bloc.dart';
import 'package:brainup/presentation/resources/gen/colors.gen.dart';
import 'package:brainup/presentation/resources/l10n/app_localizations.dart';
import 'package:brainup/router/app_router.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupDependenceInjection();
  await Firebase.initializeApp();
  runApp(
    ProviderScope(
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => LessonBloc(LessonRepository())),
          BlocProvider(create: (_) => GroupStatsBloc(GroupStatsRepository())),
          BlocProvider(
              create: (_) => GroupMembersBloc(GroupMemberRepository())),
          BlocProvider(create: (_) => RecentActivityBloc(ActivityRepository())),
          BlocProvider(create: (_) => StudyMaterialBloc()),
          BlocProvider(create: (_) => VideoBloc(VideoLectureRepository())),
          BlocProvider(
            create: (_) =>
                GroupBloc(FirebaseFirestore.instance)..add(LoadGroups()),
          ),

          // thêm bloc khác nếu cần
        ],
        child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  @override
  Widget build(BuildContext context) {
    final appRouter = ref.watch(appRouterProvider);

    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp.router(
          routerConfig: appRouter,
          title: 'Flutter Demo',
          theme: ThemeData(
            scaffoldBackgroundColor: AppColors.backgroundColor1,
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
            useMaterial3: true,
          ),
          locale: null,
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: AppLocalizations.supportedLocales),
    );
  }
}
