import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:syuosyuo_player/data/data.dart';
import 'package:syuosyuo_player/provider/data_provider.dart';
import 'package:syuosyuo_player/router.dart';
import 'package:syuosyuo_player/utils/debouncer.dart';

class SearchScreen extends HookConsumerWidget {
  const SearchScreen({this.query = '', super.key});

  final String? query;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final archives = ref.watch(dataProvider).valueOrNull?.archives ?? [];
    final result = useState<List<Archive>>([]);
    final controller = useTextEditingController(text: query);
    final debouncer = useMemoized(() => Debouncer(milliseconds: 500));

    void performSearch(String query) {
      debouncer.run(() {
        if (query.isEmpty) {
          result.value = [];
          return;
        }
        result.value =
            archives
                .where(
                  (e) =>
                      e.name.contains(query) ||
                      e.songs.any((s) => s.title.contains(query) || s.artist.contains(query)),
                )
                .toList();
      });
    }

    useEffect(() {
      if (query == null) return;
      performSearch(query!);
      return;
    }, const []);

    useOnListenableChange(controller, () {
      performSearch(controller.text);
    });

    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                labelText: 'タイトル, 曲名, アーティスト名',
                border: OutlineInputBorder(),
                suffixIcon: Icon(Icons.search),
              ),
              textAlignVertical: TextAlignVertical.bottom,
            ),
          ),
          Expanded(
            child: ListView.separated(
              itemCount: result.value.length,
              itemBuilder: (context, index) {
                final video = result.value[index];
                final videoId = video.url.split('v=')[1].split('&')[0];
                return ListTile(
                  minTileHeight: 66,
                  title: Text(
                    video.name,
                    maxLines: 2,
                    style: TextStyle(overflow: TextOverflow.ellipsis),
                  ),
                  subtitle: Container(
                    padding: const EdgeInsets.only(top: 4),
                    alignment: Alignment.bottomRight,
                    child: Text(video.date),
                  ),
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(2),
                    child: Image.network(
                      'https://img.youtube.com/vi/$videoId/0.jpg',
                      width: 100,
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
