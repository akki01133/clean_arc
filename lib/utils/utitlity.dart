

class Utility{
  static bool intToBool(int? t){
    if(t == null){return false;}
    return t == 0 ? false : true;
  }
}
