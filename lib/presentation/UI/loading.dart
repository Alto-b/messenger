import 'package:flutter/material.dart';
import 'package:messenger/presentation/UI/homepage.dart';

class LoadingPage extends StatelessWidget {
   LoadingPage({super.key});

  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration:  BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.red.shade200,Colors.blue.shade200])
        ),
        child: Center(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.network('https://static.vecteezy.com/system/resources/previews/012/872/330/original/bubble-chat-icon-3d-png.png',
                height: 200,
                ),const SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child:Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)
                    ),
                    elevation: 30,
                    child: TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                        controller: nameController,
                        validator:validateName,
                        keyboardType:TextInputType.name ,
                        decoration: const InputDecoration(
                          hintText: "Enter your name",
                          filled: true,
                          fillColor: Colors.white,
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            borderSide: BorderSide(color: Colors.red,width: 3)
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            borderSide: BorderSide.none
                          )
                        ),
          
                      ),
                  ),
                  ),
                const SizedBox(height: 40,),
                IconButton.filled(onPressed: (){
                  proceed(context);
                }, icon: const Icon(Icons.arrow_circle_right_outlined,size: 50,color:Colors.white,))
              ],
            ),
          ),
        ),
      ),
    );
  }
Future<void> proceed(BuildContext context)async{
  if(_formKey.currentState!.validate()){
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage(name: nameController.text),));
  }
}
  //to validate password
String? validateName(String? value) {
  final trimmedValue = value?.trim();

  if (trimmedValue == null || trimmedValue.isEmpty) {
    return 'Name cannot be empty';
  }
  return null;
}

}