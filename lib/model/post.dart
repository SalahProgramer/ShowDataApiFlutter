class post{

  int id;
  int userId;
  String title;
  String body;
  post({required this.id,required this.userId, required this.title, required this.body});
 factory post.fromJson(Map<String,dynamic> json){
   return post(id: json['id'], userId: json['userId'], title: json['title'], body: json['body']);






  }
}