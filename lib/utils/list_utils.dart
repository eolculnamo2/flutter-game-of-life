class ListUtils {
  
  static bool isInRange<T>(List<T> list, int index) {
    return index < list.length && index > 0;
  }
  
  static T? getListItem<T>(final int index, final List<T> list) {
    if (isInRange(list, index)) {
      return list[index];
    }
    return null;
  }
}
