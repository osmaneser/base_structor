
import 'dart:convert';

StepItem stepItemFromJson(String str) => StepItem.fromJson(json.decode(str));

String stepItemToJson(StepItem data) => json.encode(data.toJson());

class StepItem {
    StepItem({
        this.stepNo,
        this.title,
        this.content,
    });

    int stepNo;
    String title;
    dynamic content;

    factory StepItem.fromJson(Map<String, dynamic> json) => StepItem(
        stepNo: json["stepNo"],
        title: json["title"],
        content: json["content"],
    );

    Map<String, dynamic> toJson() => {
        "stepNo": stepNo,
        "title": title,
        "content": content,
    };
}
