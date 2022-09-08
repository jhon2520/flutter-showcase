import 'package:flutter/material.dart';
import 'package:showcase_package/widgets/show_case_view.dart';
import 'package:showcaseview/showcaseview.dart';

//https://www.youtube.com/watch?v=C4686LEzxg8
//TOOD: Se le puede agregar con el sharedpreferences una validación de que ya se mostró el showcase para que 
//no se muestre cada vez que se inicia la aplicación

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home:  ShowCaseWidget(
        builder: Builder(builder: (context) => HomePage(),),
        ),
    );
  }
}

class HomePage extends StatefulWidget {


  HomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  List<String> listado = ["Patricio Estrella","Arenita","Calamardo tentaculos","Bob toronja"];

  final GlobalKey globalKey1 = GlobalKey();
  final GlobalKey globalKey2 = GlobalKey();
  final GlobalKey globalKey3 = GlobalKey();
  final GlobalKey globalKey4 = GlobalKey();


  @override
  void initState() {
    
    WidgetsBinding.instance.addPostFrameCallback((_) {
      
      ShowCaseWidget.of(context).startShowCase(
        [globalKey1,globalKey2,globalKey3,globalKey4]
      );

    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        title: const Text('Flutter showcase'),
        actions: <Widget>[
          
          ShowCaseView(
            globalKey: globalKey1,
            overlayColor: Colors.indigo,
            shapeBorder: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
              side: BorderSide( color: Colors.red)
            ),
            title: "Agregar",
            description: "Agregar un nuevo usuario",
            child: IconButton(onPressed: (){}, icon: const Icon(Icons.add))),
          
          ShowCaseView(
            globalKey: globalKey2,
            overlayColor: Colors.black26,
            shapeBorder: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15)
            ),
            title: "Notificaciones",
            description: "Aquí puedes ver todas las notificaciones",
            child: IconButton(onPressed: (){}, icon: const Icon(Icons.notification_add))),
        ],
      ),
      body: Center(
        child: ListView.builder(
          itemCount: listado.length,
          itemBuilder: (BuildContext context, int index) {

            if( index == 0 ) {
              return ListTile(
              leading: ShowCaseView(
                globalKey: globalKey3,
                overlayColor: Colors.black54,
                shapeBorder: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)
                ),
                title: "Foto",
                description: "Foto del usuario",  
                child: CircleAvatar(child: Text(listado[index].toUpperCase()[0]))),
              
              title:ShowCaseView(
                globalKey: globalKey4,
                overlayColor: Colors.green,
                shapeBorder: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)
                ),
                title: "Nombre",
                description: "Nombre del usuario",
                child: Text(listado[index].toString())) ,
            );
            } else {
              return ListTile(
              leading: CircleAvatar(child: Text(listado[index].toUpperCase()[0])),
              
              title:Text(listado[index].toString()) ,
            );
            } 
          },
        ),
      ),
    );
  }
}