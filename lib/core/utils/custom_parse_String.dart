

double parseStringToDouble(String target){

  List<String> parts = target.split('/');

  double numerator = double.parse(parts[0]);
  double denominator = double.parse(parts[1]);


  double result = numerator / denominator;
return result;
}

