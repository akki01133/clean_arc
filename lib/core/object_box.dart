import 'package:clean_arc/features/notes/data/model/note_table.dart';
import 'package:clean_arc/objectbox.g.dart';


/// this is base class for the objectbox
/// 1. add all the Boxes here as private
/// 2. initialize them in the [ObjectBox._init] constructor
/// 3. add the getter for the created box
/// 4. in feature/data/db/$feature_box.dart file add extension on [ObjectBox]
/// 5. implement all the methods and properties for that feature
class ObjectBox{
    late final Store _store;
    late final Box<NoteTable> _noteBox;
    Box<NoteTable> get noteBox => _noteBox;

    ObjectBox._init(this._store){
      _noteBox = Box<NoteTable>(_store);
    }

    static Future<ObjectBox> init() async{
      final store = await openStore();
      return ObjectBox._init(store);
    }
}
