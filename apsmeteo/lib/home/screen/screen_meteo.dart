import 'package:apsmeteo/datameteo/screen/data_meteo_screen.dart';
import 'package:apsmeteo/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

class ScreenHome extends ConsumerStatefulWidget {
  const ScreenHome({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends ConsumerState<ScreenHome> {
TextEditingController town = TextEditingController();
final key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather'),
        elevation: 10,
        shadowColor: Colors.black,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 100),
              child: Image.asset('images/meteo.png'),
            ),Form(
              key: key,
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: TextFormField(
                   
                    validator: (value) {
                      if(value == null || value.isEmpty){
                        return 'Champs invalides';
                      }
                    },
                    controller: town,
                    decoration: InputDecoration(
                      labelText: 'Entrez le nom d\'une ville...',
                      suffixIcon: IconButton(onPressed: (){
                      
                            if(key.currentState!.validate()){
                          ref.read(weathers.notifier).getDataWeather(town: town.text);
                        

                        }
                      

                      }, icon: const Icon(Icons.search)),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5)
                      )
                    ),
                  ),
                ),
                ref.watch(weathers).when(
                  data: (data){
                    if(data !=null){
                      WidgetsBinding.instance.addPostFrameCallback((_){
                        MaterialPageRoute route = MaterialPageRoute(builder: (BuildContext context){
                          return const DataMeteo();
                        });
                        Navigator.of(context).push(route);

                      });
                    }
                    return const SizedBox.shrink();
                  }, 
                  error: (error, stackTrace){
                     QuickAlert.show(
      context: context,
      type: QuickAlertType.warning,
      text: error.toString(),
      autoCloseDuration: const Duration(seconds: 3),
    );


                    return const SizedBox.shrink();
                  }, 
                  loading: loading)

              ],))
          ],
        ),
      ),
    );
  }
}
Widget loading(){
  return const SizedBox.shrink();
}