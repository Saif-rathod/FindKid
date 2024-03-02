import 'dart:convert';
import 'dart:typed_data';
import 'package:http/http.dart' as http;

Future<bool> verifyAadhaar(String aadhaarNumber,Uint8List userPhoto) async {
  String apiurl = 'https://uidai.gov.in/en/ecosystem/authentication-devices-documents';
  Map<String, String> headers = {
    'Content-Type': 'application/json',
  };
  Map<String, String> body = {
    'aadhaarNumber': aadhaarNumber,
    'photo':base64Encode(userPhoto)
  };

  final response=await http.post(Uri.parse(apiUrl),body:jsonEncode(requestBody),headers:headers);
  
  if(response.statusCode==200){
    Map<String,dynamic> jsonResponse =jsonDecode(response.body);
    bool isAuthenciated = jsonResponse['data']['isAuthentic'];
  }
  else{
    return false;
  }
}

void main() async{
  String aadharNumber="";
  Uint8List userPhoto=...;
  bool isVerified = await verifyAadhaarWithPhoto(aadharNumber,userPhoto);

  if(isVerified )
{
    print("Aadhaar Verfication successful.");
}

else{
  print("Aadhaar Verification failed");
}
}