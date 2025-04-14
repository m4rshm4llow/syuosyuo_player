import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:syuosyuo_player/gen/assets.gen.dart';
import 'package:syuosyuo_player/provider/data_provider.dart';
import 'package:syuosyuo_player/router.dart';

class HomeScreen extends HookConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final archives = ref.watch(dataProvider).valueOrNull?.archives ?? [];
    final breakpoint = ResponsiveBreakpoints.of(context).breakpoint;
    final (fontSize, imageSize, constraints) = switch (breakpoint.name) {
      MOBILE || TABLET => (20.0, 80.0, BoxConstraints()),
      (_) => (24.0, 100.0, BoxConstraints(maxHeight: MediaQuery.sizeOf(context).height * 0.5)),
    };

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            if (archives.isNotEmpty)
              ConstrainedBox(
                constraints: constraints,
                child: CarouselSlider.builder(
                  itemCount: archives.length,
                  itemBuilder: (context, index, realIndex) {
                    final videoId = archives[index].videoId;
                    return GestureDetector(
                      onTap: () {
                        WatchPageRoute(videoId: videoId).push(context);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: AspectRatio(
                          aspectRatio: 16 / 9,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.network(
                              'https://img.youtube.com/vi/$videoId/0.jpg',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                  options: CarouselOptions(
                    autoPlay: true,
                    autoPlayCurve: Curves.easeInOut,
                    viewportFraction: 1,
                  ),
                ),
              ),
            Gap(16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Gap(32),
                Flexible(
                  child: Text(
                    'しゅおしゅおプレイヤーにようこそ',
                    style: TextStyle(fontSize: fontSize, height: 1.2, fontWeight: FontWeight.bold),
                  ),
                ),
                Assets.images.mochiSyuoSmiling.image(height: imageSize),
                Gap(32),
              ],
            ),
            Gap(32),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: Text(
                '登龍門BOX所属VTuber秋桜しゅおさんの歌枠アーカイブを簡単に閲覧できるファンアプリです。'
                'お気に入りの歌枠を見つけて、しゅおしゅおの魅力をもっと楽しもう！',
                style: TextStyle(fontSize: 16, height: 1.6, fontWeight: FontWeight.bold),
              ),
            ),
            Gap(32),
          ],
        ),
      ),
    );
  }
}

extension StringX on String {
  String formatDate() {
    final date = DateTime.parse(this);
    final formatter = DateFormat('yyyy年MM月dd日');
    return formatter.format(date);
  }

  double toSeconds() {
    List<String> parts = split(':');
    if (parts.length != 3) {
      throw FormatException('Invalid time format. Expected HH:MM:SS');
    }

    double hours = double.parse(parts[0]);
    double minutes = double.parse(parts[1]);
    double seconds = double.parse(parts[2]);

    return hours * 3600 + minutes * 60 + seconds;
  }
}
