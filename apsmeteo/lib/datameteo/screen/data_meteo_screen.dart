import 'package:apsmeteo/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

class DataMeteo extends ConsumerStatefulWidget {
  const DataMeteo({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DataMeteoState();
}

class _DataMeteoState extends ConsumerState<DataMeteo> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Weather'),
        elevation: 10,
        shadowColor: Colors.black,
        centerTitle: true,
      ),
      body: ref.watch(weathers).when(
        data: (data){
          if(data == null){
            return const Center(child:  Text('Aucunes donness...'));
          }
          return Column(
            children: [
              
              Padding(
                padding: const EdgeInsets.only(top: 150),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(data.location.name.toString()),
                    const Text(' , '),
                     Text(data.location.country.toString(),style:const TextStyle(fontWeight: FontWeight.bold)),
                
                  ],
                ),
              ),
            Image.network('http:${data.current.condition!.icon}'),
            Text(data.current.condition!.text.toString()),

              ListTile(
                title: Center(child: Text('${data.current.temp_c.toString()}•c')),
              ),
               const Divider(),
              SizedBox(
                height: 300,
                child: ListView.separated(
                  itemBuilder: (BuildContext context, index){
                    var datas = data.forecast.forecastday[index];
                    return ListTile(
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(datas.date,style:const TextStyle(fontStyle: FontStyle.italic,fontWeight : FontWeight.bold)),
                          Text(datas.day!.daily_chance_of_rain.toString(),style: const TextStyle(color: Colors.deepPurple),)
                        ],
                      ),
                    );
                  }, 
                  separatorBuilder: (BuildContext context, int index) => const Divider(), 
                  itemCount: data.forecast.forecastday.length),
              )
            ],
          );
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
    );
  }
}
Widget loading(){
  return const Center(child: CircularProgressIndicator());
}