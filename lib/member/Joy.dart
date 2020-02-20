class Joy{

  String id;

  String content;

  String time;

  Joy({this.id, this.content,this.time});

  factory Joy.fromJson (Map<String,dynamic> json){
    return new Joy(id: json['id'],content: json['title'],time: json['cTime']);
  }



}