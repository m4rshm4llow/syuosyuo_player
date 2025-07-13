import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:syuosyuo_player/data/enum.dart';
import 'package:syuosyuo_player/provider/data_provider.dart';
import 'package:syuosyuo_player/router.dart';

class AchivesScreen extends HookConsumerWidget {
  const AchivesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sortLabel = useState(SortLabel.newer);
    final filterLabel = useState(FilterLabel.all);
    final archives =
        ref.watch(utawakuAchivesProvider(sortLabel.value, filterLabel.value)).valueOrNull ?? [];

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 66,
            child: Row(
              children: [
                Gap(8),
                DropdownMenu<SortLabel>(
                  width: 144,
                  dropdownMenuEntries: SortLabel.entries,
                  initialSelection: SortLabel.newer,
                  onSelected: (value) {
                    if (value == null) return;
                    sortLabel.value = value;
                    ref.invalidate(utawakuAchivesProvider);
                  },
                ),
                Gap(8),
                DropdownMenu<FilterLabel>(
                  width: 144,
                  dropdownMenuEntries: FilterLabel.entries,
                  initialSelection: FilterLabel.all,
                  onSelected: (value) {
                    if (value == null) return;
                    filterLabel.value = value;
                    ref.invalidate(utawakuAchivesProvider);
                  },
                ),
                Spacer(),
                Text('${archives.length}件', style: TextStyle(fontSize: 16)),
                Gap(16),
              ],
            ),
          ),
          Divider(height: 1.0),
          Expanded(
            child: ListView.separated(
              itemCount: archives.length,
              itemBuilder: (context, index) {
                final videoId = archives[index].videoId;
                return ListTile(
                  title: Text(
                    archives[index].name,
                    maxLines: 2,
                    style: TextStyle(overflow: TextOverflow.ellipsis),
                  ),
                  subtitle: Container(
                    padding: const EdgeInsets.only(top: 4),
                    alignment: Alignment.bottomRight,
                    child: Text(archives[index].date),
                  ),
                  leading: AspectRatio(
                    aspectRatio: 16 / 9,
                    child: Image.network(
                      'https://img.youtube.com/vi/$videoId/0.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                  onTap: () {
                    WatchPageRoute(videoId: videoId).push(context);
                  },
                );
              },
              separatorBuilder: (context, index) => const Divider(height: 1.0),
            ),
          ),
        ],
      ),
    );
  }
}
