import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:syuosyuo_player/data/data.dart';
import 'package:syuosyuo_player/data/enum.dart';
import 'package:syuosyuo_player/gen/assets.gen.dart';
import 'package:syuosyuo_player/provider/data_provider.dart';
import 'package:syuosyuo_player/router.dart';
import 'package:syuosyuo_player/utils/debouncer.dart';

class SongsScreen extends HookConsumerWidget {
  const SongsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final eraLabel = useState(EraLabel.all);
    final titleCount = ref.watch(titleCountProvider(eraLabel.value));

    final result = useState<Map<Song, int>>(titleCount);
    useEffect(() {
      result.value = titleCount;
      return;
    }, [titleCount]);

    final controller = useTextEditingController();
    final debouncer = useMemoized(() => Debouncer(milliseconds: 500));

    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 66,
            child: Row(
              children: [
                Gap(8),
                Expanded(
                  child: TextField(
                    controller: controller,
                    decoration: InputDecoration(labelText: '曲名', border: OutlineInputBorder()),
                    textAlignVertical: TextAlignVertical.bottom,
                    onChanged: (value) {
                      debouncer.run(() {
                        if (value.isEmpty) {
                          result.value = titleCount;
                          return;
                        }
                        result.value = titleCount.keys
                            .where((song) => song.title.contains(value))
                            .fold<Map<Song, int>>({}, (map, song) {
                              map[song] = titleCount[song]!;
                              return map;
                            });
                      });
                    },
                  ),
                ),
                Gap(8),
                DropdownMenu<EraLabel>(
                  width: 144,
                  dropdownMenuEntries: EraLabel.entries,
                  initialSelection: EraLabel.all,
                  onSelected: (value) {
                    if (value == null) return;
                    eraLabel.value = value;
                  },
                ),
                Gap(16),
                Text('${result.value.length}件', style: TextStyle(fontSize: 16)),
                Gap(16),
              ],
            ),
          ),
          Divider(height: 1.0),
          if (result.value.isEmpty)
            Expanded(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Assets.images.mochiSyuoCrying.image(width: 100),
                    Gap(8),
                    Text('該当する曲がありません', style: TextStyle(fontSize: 16)),
                  ],
                ),
              ),
            )
          else
            Expanded(
              child: ListView.separated(
                itemCount: result.value.length,
                itemBuilder: (_, index) {
                  final song = result.value.keys.elementAt(index);
                  return GestureDetector(
                    onTap: () {
                      SearchPageRoute(q: song.title).go(context);
                    },
                    child: ListTile(
                      title: Text(song.title, overflow: TextOverflow.ellipsis),
                      subtitle: Text(
                        eraLabel.value == EraLabel.all
                            ? song.artist
                            : '${song.artist} (${song.year})',
                        overflow: TextOverflow.ellipsis,
                      ),
                      trailing: Text(
                        '${result.value[song]}枠',
                        style: TextStyle(fontSize: 14, height: 1),
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) => Divider(height: 1.0),
              ),
            ),
        ],
      ),
    );
  }
}
