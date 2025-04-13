import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:syuosyuo_player/data/data.dart';
import 'package:syuosyuo_player/gen/assets.gen.dart';
import 'package:syuosyuo_player/provider/data_provider.dart';
import 'package:syuosyuo_player/router.dart';
import 'package:syuosyuo_player/utils/debouncer.dart';

class ArtistsScreen extends HookConsumerWidget {
  const ArtistsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final artistCounts = ref.watch(artistCountProvider);

    final result = useState<Map<Song, int>>(artistCounts);
    useEffect(() {
      result.value = artistCounts;
      return;
    }, [artistCounts]);

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
                    decoration: InputDecoration(labelText: 'アーティスト名', border: OutlineInputBorder()),
                    textAlignVertical: TextAlignVertical.bottom,
                    onChanged: (value) {
                      debouncer.run(() {
                        if (value.isEmpty) {
                          result.value = artistCounts;
                          return;
                        }
                        result.value = artistCounts.keys
                            .where((song) => song.artist.contains(value))
                            .fold<Map<Song, int>>({}, (map, song) {
                              map[song] = artistCounts[song]!;
                              return map;
                            });
                      });
                    },
                  ),
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
                    Text('該当するアーティストがありません', style: TextStyle(fontSize: 16)),
                  ],
                ),
              ),
            )
          else
            Expanded(
              child: ListView.separated(
                itemBuilder: (_, index) {
                  final song = result.value.keys.elementAt(index);
                  return GestureDetector(
                    onTap: () {
                      SearchPageRoute(q: song.artist).go(context);
                    },
                    child: ListTile(
                      title: Text(song.artist, overflow: TextOverflow.ellipsis),
                      trailing: Text(
                        '${result.value[song]}枠',
                        style: TextStyle(fontSize: 14, height: 1),
                      ),
                    ),
                  );
                },
                itemCount: result.value.length,
                separatorBuilder: (context, index) => Divider(height: 1.0),
              ),
            ),
        ],
      ),
    );
  }
}
