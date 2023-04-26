class Items implements Comparable<Items> {
  final String itemImage, itemName, itemCost, itemCategory, categoryId;

  const Items(
    this.itemImage,
    this.itemName,
    this.itemCost,
    this.itemCategory,
    this.categoryId,
  );

  @override
  int compareTo(Items other) => itemName.compareTo(other.itemName);
}
