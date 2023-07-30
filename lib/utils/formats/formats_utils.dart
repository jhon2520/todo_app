class FormatsUtils{

  static String formatDates<T extends DateTime?>(T? dateTime){

    if(dateTime == null){
      return "";
    }

    return  "${dateTime.day.toString().padLeft(2,"0")}/${dateTime.month.toString().padLeft(2,"0")}/${dateTime.year}";
  }

}