class ExampleObj {
  String imageUrl;

  ExampleObj({
    required this.imageUrl,
  });

  factory ExampleObj.fromJson(Map<String, dynamic> json) => ExampleObj(
        imageUrl: json["message"],
      );
}
