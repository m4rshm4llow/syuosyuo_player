import 'dart:collection';

import 'package:flutter/material.dart';

typedef FilterEntry = DropdownMenuEntry<FilterLabel>;
typedef EraEntry = DropdownMenuEntry<EraLabel>;
typedef SortEntry = DropdownMenuEntry<SortLabel>;
typedef SongSortEntry = DropdownMenuEntry<SongSortLabel>;

enum SortLabel {
  newer('新しい順'),
  older('古い順');

  const SortLabel(this.label);
  final String label;

  static final List<SortEntry> entries = UnmodifiableListView<SortEntry>(
    values.map<SortEntry>(
      (SortLabel sortLabel) => SortEntry(value: sortLabel, label: sortLabel.label),
    ),
  );
}

enum EraLabel {
  all('すべて', 0, 2100),
  reiwa('令和', 2019, 2100),
  heisei('平成', 1989, 2018),
  showa('昭和', 1926, 1988);

  const EraLabel(this.label, this.start, this.end);
  final String label;
  final int start;
  final int end;

  static final List<EraEntry> entries = UnmodifiableListView<EraEntry>(
    values.map<EraEntry>((EraLabel eraLabel) => EraEntry(value: eraLabel, label: eraLabel.label)),
  );
}

enum FilterLabel {
  all('すべて'),
  singingRelay('歌枠リレー'),
  sleepInduction('睡眠導入'),
  enduranceStream('耐久配信'),
  orisonV('おりそんＶ');

  const FilterLabel(this.label);
  final String label;

  static final List<FilterEntry> entries = UnmodifiableListView<FilterEntry>(
    values.map<FilterEntry>(
      (FilterLabel filterLabel) => FilterEntry(value: filterLabel, label: filterLabel.label),
    ),
  );
}

enum SongSortLabel {
  wNewer('枠:降順'),
  kNewer('曲:降順'),
  wOlder('枠:昇順'),
  kOlder('曲:昇順');

  const SongSortLabel(this.label);
  final String label;

  static final List<SongSortEntry> entries = UnmodifiableListView<SongSortEntry>(
    values.map<SongSortEntry>(
      (SongSortLabel filterLabel) => SongSortEntry(value: filterLabel, label: filterLabel.label),
    ),
  );
}
