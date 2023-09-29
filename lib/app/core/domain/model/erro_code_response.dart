
class ErroCodeResponse {
  late String code;
  late String message;

  ErroCodeResponse({required this.code, required this.message});

  factory ErroCodeResponse.fromJson(Map<String, dynamic> json) => ErroCodeResponse(code: json["code"], message: json["message"]);
  Map<String, dynamic> toMap() => {
    "code": code,
    "message": message,
  };
}