import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:gap/gap.dart';
import 'package:syuosyuo_player/gen/assets.gen.dart';
import 'package:url_launcher/url_launcher.dart';

class CreditScreen extends StatelessWidget {
  const CreditScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: const SizedBox.shrink(), title: const Text('クレジット・謝辞')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('当アプリでは、以下の素材・サービスを利用させていただいております。', style: TextStyle(fontSize: 16)),

              _SectionHeader(title: 'VTuber登龍門'),
              Gap(8),
              _TextWithLink(
                text:
                    '当アプリのコンテンツは、「VTuber 登龍門」の切り抜き（原著作物）ガイドライン (https://www.vmon.jp/guideline ) に基づき、ガイドラインの内容を遵守した上で作成しています。',
              ),

              _SectionHeader(title: 'YouTubeチャンネル【秋桜しゅお】'),
              Gap(8),
              _TextWithLink(
                text:
                    '当アプリでは、秋桜しゅおさんのYouTubeチャンネル( https://www.youtube.com/@syuousyuo )の動画およびサムネイル画像を使用させていただいております。いつも素敵な歌声をありがとうございます。',
              ),
              Gap(8),
              Text('動画の著作権は、投稿者および所属先に帰属します。'),

              _SectionHeader(title: 'もちしゅお画像'),
              Gap(8),
              Row(
                children: [
                  for (final iamge in Assets.images.values) ...[
                    Image.asset(iamge.path, width: 66, height: 66, fit: BoxFit.cover),
                  ],
                ],
              ),
              Gap(16),
              _TextWithLink(
                text:
                    '秋桜しゅおさんのファンアート『もちしゅお』画像は、作者のだぼまろさん( https://x.com/dabomaro )に許可をいただいて使用しています。',
              ),
              Gap(8),
              Text('素敵な画像を提供してくださりありがとうございます。'),

              _SectionHeader(title: 'しゅお団の皆様'),
              Gap(8),
              Text(
                'タイムスタンプ情報（曲名・アーティスト名など）を提供していただいた、しゅお団の皆様に感謝申し上げます。',
                style: TextStyle(height: 1.2),
              ),

              _SectionHeader(title: 'pixivFANBOX・BOOTH'),
              Gap(8),
              _TextWithLink(
                text:
                    '活動を応援するため、秋桜しゅおさんのFANBOX ( https://syuousyuo.fanbox.cc/ ) およびBOOTH ( https://syuousyuo.booth.pm/ ) ページのリンクを設置しております。気になる方はぜひチェックしてみてください。販売・支援内容に関しては各サービスの規約をご確認ください。',
              ),
              Gap(8),
              Text(
                '※pixivFANBOX・BOOTHはpixiv株式会社が提供するクリエイターの支援プラットフォームです。',
                style: TextStyle(height: 1.2),
              ),

              _SectionHeader(title: '免責事項（共通）'),
              Gap(8),
              Text(
                '外部リンク先のコンテンツに関しては、当アプリでは一切の責任を負いかねます。ご利用の際はご自身の判断でお願いいたします。',
                style: TextStyle(height: 1.2),
              ),
              Gap(8),
              Text('各サービスの名称・ロゴは、各社の登録商標または商標です。'),

              _SectionHeader(title: 'ご連絡について'),
              Gap(8),
              Text('データ不備の報告・機能要望等ありましたら、お気軽にどうぞ！', style: TextStyle(height: 1.2)),
              Gap(8),
              Text('X(旧Twitter): @masyuomallow'),
            ],
          ),
        ),
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  const _SectionHeader({required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Gap(16),
        Divider(height: 1),
        Gap(16),
        Text(title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
      ],
    );
  }
}

class _TextWithLink extends StatelessWidget {
  const _TextWithLink({required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Linkify(
      onOpen: (link) async {
        await launchUrl(Uri.parse(link.url));
      },
      text: text,
      style: TextStyle(height: 1.2),
      linkStyle: TextStyle(color: Colors.orangeAccent, decoration: TextDecoration.none),
    );
  }
}
