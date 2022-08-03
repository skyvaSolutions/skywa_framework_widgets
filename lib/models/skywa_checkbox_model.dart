class SkywaCheckBoxModel {
  String id;
  String title;
  String subtitle;
  bool isSelected;

  SkywaCheckBoxModel({
    this.id = 'null',
    required this.title,
    this.subtitle = '',
    required this.isSelected,
  });

  @override
  String toString() {
    return 'SkywaCheckBoxModel{id: $id, title: $title, subtitle: $subtitle, isSelected: $isSelected}';
  }
}
