// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'router.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [$shellRouteData];

RouteBase get $shellRouteData => StatefulShellRouteData.$route(
  factory: $ShellRouteDataExtension._fromState,
  branches: [
    StatefulShellBranchData.$branch(
      routes: [
        GoRouteData.$route(
          path: '/',

          factory: $HomePageRouteExtension._fromState,
        ),
      ],
    ),
    StatefulShellBranchData.$branch(
      routes: [
        GoRouteData.$route(
          path: '/artists',

          factory: $ArtistsPageRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: '/search',

          factory: $SearchPageRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: '/archives',

          factory: $AchivesPageRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: '/songs',

          factory: $SongPageRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: '/thumbnails',

          factory: $ThumbnailPageRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: '/watch',

          factory: $WatchPageRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: '/credit',

          factory: $CreditPageRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: '/tool',

          factory: $ToolPageRouteExtension._fromState,
        ),
      ],
    ),
  ],
);

extension $ShellRouteDataExtension on ShellRouteData {
  static ShellRouteData _fromState(GoRouterState state) =>
      const ShellRouteData();
}

extension $HomePageRouteExtension on HomePageRoute {
  static HomePageRoute _fromState(GoRouterState state) => const HomePageRoute();

  String get location => GoRouteData.$location('/');

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $ArtistsPageRouteExtension on ArtistsPageRoute {
  static ArtistsPageRoute _fromState(GoRouterState state) =>
      const ArtistsPageRoute();

  String get location => GoRouteData.$location('/artists');

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $SearchPageRouteExtension on SearchPageRoute {
  static SearchPageRoute _fromState(GoRouterState state) =>
      SearchPageRoute(q: state.uri.queryParameters['q']);

  String get location =>
      GoRouteData.$location('/search', queryParams: {if (q != null) 'q': q});

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $AchivesPageRouteExtension on AchivesPageRoute {
  static AchivesPageRoute _fromState(GoRouterState state) =>
      const AchivesPageRoute();

  String get location => GoRouteData.$location('/archives');

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $SongPageRouteExtension on SongPageRoute {
  static SongPageRoute _fromState(GoRouterState state) => const SongPageRoute();

  String get location => GoRouteData.$location('/songs');

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $ThumbnailPageRouteExtension on ThumbnailPageRoute {
  static ThumbnailPageRoute _fromState(GoRouterState state) =>
      const ThumbnailPageRoute();

  String get location => GoRouteData.$location('/thumbnails');

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $WatchPageRouteExtension on WatchPageRoute {
  static WatchPageRoute _fromState(GoRouterState state) =>
      WatchPageRoute(videoId: state.uri.queryParameters['video-id']!);

  String get location =>
      GoRouteData.$location('/watch', queryParams: {'video-id': videoId});

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $CreditPageRouteExtension on CreditPageRoute {
  static CreditPageRoute _fromState(GoRouterState state) =>
      const CreditPageRoute();

  String get location => GoRouteData.$location('/credit');

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $ToolPageRouteExtension on ToolPageRoute {
  static ToolPageRoute _fromState(GoRouterState state) => const ToolPageRoute();

  String get location => GoRouteData.$location('/tool');

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}
