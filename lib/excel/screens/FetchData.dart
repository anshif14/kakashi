import 'package:csv/csv.dart';
import 'package:excel/excel.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kakashi/models/user_model.dart';
import 'package:kakashi/models/users_model.dart';

class FetchData extends StatefulWidget {
  const FetchData({super.key});

  @override
  State<FetchData> createState() => _FetchDataState();
}

class _FetchDataState extends State<FetchData> {

  List <User> userList =[];

  List<User> data = [
    User(age: 22, name: "Anshif"),
    User(age: 14, name: "Nabeel"),
    User(age: 10, name: "Anas"),
    User(age: 35, name: "Smijith"),
  ];

  createExcel() {
    ///create excel
    var excel = Excel.createExcel();

    /// intialize cell index
    int i = 1;

    ///create sheet
    Sheet sheetObject = excel['flit'];

    ///create cell style
    CellStyle cellStyle = CellStyle();
    CellStyle redcellStyle = CellStyle(
      backgroundColorHex: '#ff0800',
    );

    CellStyle greencellStyle = CellStyle(
      backgroundColorHex: '#00ff1a',
    );

    ///create heading

    var cell = sheetObject.cell(CellIndex.indexByString('A1'));
    cell.value = 'SL';
    cell.cellStyle = cellStyle;

    var cell1 = sheetObject.cell(CellIndex.indexByString('B1'));
    cell1.value = 'name';
    cell1.cellStyle = cellStyle;

    var cell2 = sheetObject.cell(CellIndex.indexByString('C1'));
    cell2.value = "Age";
    cell2.cellStyle = cellStyle;

    ///insert data
    for (var docs in data) {
      var row = sheetObject.cell(CellIndex.indexByString('A${i + 1}'))
        ..value = i.toString()
        ..cellStyle = cellStyle;
      var row2 = sheetObject.cell(CellIndex.indexByString('B${i + 1}'))
        ..value = docs.name.toString()
        ..cellStyle = cellStyle;
      var row3 = sheetObject.cell(CellIndex.indexByString('C${i + 1}'))
        ..value = docs.age.toString()
        ..cellStyle = docs.age < 18 ? redcellStyle : greencellStyle;
      i++;
      // row.value = TextCellValue(docs.name)
    }

    ///set default sheet
    excel.setDefaultSheet('flit');

    ///save excel
    excel.save(fileName: 'Excel ${DateTime.now()}.xlsx');
  }

  readExcel() async {
    var result = await FilePicker.platform.pickFiles(

      allowMultiple: false
    );
    if(result == false){
      return;
    }
    final file = result!.files.first;
    _openFile(file);
  }
  _openFile(PlatformFile file){
    List<List<dynamic>> listData=
        CsvToListConverter().convert(String.fromCharCodes(file.bytes!));

    print(listData);

    int i =1;
    userList =[];

    for(var docs in listData){
      if(docs!=null && docs !=''){

        if(docs[2].runtimeType == int){
          userList.add(User(name: docs[1], age: docs[2]));

        }

      }
      i++;
    }
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  createExcel();
                },
                child: Text("Get Data")),
            ElevatedButton(
                onPressed: () {
                  readExcel();
                },
                child: Text("Read From Data")),

            Column(
              children: List.generate(userList.length, (index) => Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text((index+1).toString()),
                  Text(userList[index].name),
                  Text(userList[index].age.toString())
                ],
              )),
            )


          ],
        ),
      ),
    );
  }
}
