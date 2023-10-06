import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kakashi/providers/poviders.dart';

class RiverPodPincode extends ConsumerStatefulWidget {
  const RiverPodPincode({super.key});

  @override
  ConsumerState<RiverPodPincode> createState() => _RiverPodPincodeState();
}

class _RiverPodPincodeState extends ConsumerState<RiverPodPincode> {
  TextEditingController pinController =TextEditingController();
  @override
  Widget build(BuildContext context) {
    final apiData = ref.watch(pinProvider(pinController.text));
    return apiData.when(data: (data){
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextFormField(
                controller: pinController,
                onChanged: (val){
                  try{
                    ref.refresh(pinProvider(val));
                    ref.watch(pinProvider(val));

                  }catch(e){
                    print(e);
                  }


                  print(val

                );},
              ),
              Container(
                child: Text(data.toString()),
              ),
            ],
          ),
        ),
      );
    }, error: (error,x){
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
        ),
        body: Center(child: Column(
          children: [
            Text(error.toString()),
            Text(x.toString()),
          ],
        )),
      );
    }, loading: (){
      return Scaffold(body: Center(child: CircularProgressIndicator()));
    });
  }
}
