
import 'dart:convert';

ToggleItem toggleItemFromJson(String str) => ToggleItem.fromJson(json.decode(str));

String toggleItemToJson(ToggleItem data) => json.encode(data.toJson());

class ToggleItem {
    ToggleItem({
        this.id,
        this.title,
        this.isCheck,
    });

    int id;
    String title;
    bool isCheck;

    factory ToggleItem.fromJson(Map<String, dynamic> json) => ToggleItem(
        id: json["id"],
        title: json["title"],
        isCheck: json["isCheck"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "isCheck": isCheck,
    };
}
