import 'package:flutter/material.dart';

/*class InputDecorations{
static InputDecoration inputDecoration({
String labeltext,
Icon icon
}){
  return InputDecorations(enebledBorder: UnderlineInputBorder(
    borderSide: BorderSide(color: Colors.red),),
    foc: const UnderlineInputBorder(borderSide: BorderSide(color: Colors.red, width: 2),

    
  ),
  labelText: labeltext,
  prefixIcon: icon,
   );
}



}
*/
/*import 'package:provider/provider.dart';
import '../providers/userlista_provider.dart';

class RefreshPage extends StatefulWidget {
  const RefreshPage({Key key}) : super(key: key);

  @override
  State<RefreshPage> createState() => _RefreshPageState();
}

class _RefreshPageState extends State<RefreshPage> {
  @override
  Widget build(BuildContext context) {
    final userprovider = Provider.of<AUserList_provider>(context);

    return Scaffold(
        appBar: AppBar(
          title: Text("Flutter Refresh Indicator"),
        ),
        body: RefreshIndicator(
          onRefresh: () async {
            await Future.delayed(Duration(seconds: 2));
            userprovider.getauserlists();
          },
          color: Colors.white,
          backgroundColor: Colors.purple,
          triggerMode: RefreshIndicatorTriggerMode.anywhere,
        ));
  }
}*/
