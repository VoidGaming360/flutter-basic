import 'package:flutter/material.dart';

void main() {
    runApp(const MyApp());
}


class MyApp extends StatelessWidget {
    const MyApp({super.key});

    @override
    Widget build(BuildContext context){
        return const MaterialApp(
            home: HomePage(),
        );
    }
}

class HomePage extends StatefulWidget{
    const HomePage({super.key});

    @override
    State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
    int counter = 0;
    
    void increment() {
        setState(() {
            counter++;
        });
    }

    void decrement() {
        setState (() {
            counter--;
        });
    }

    final TextEditingController nameController = TextEditingController();

    final List<String> names = [];

    void addName(){
        final String text = nameController.text.trim();

        if (text.isEmpty){
            return;
        }

        setState(() {
            names.add(text);
            nameController.clear();
        });
    }

    @override
    void dispose() {
        nameController.dispose();
        super.dispose();
    }

    @override
    Widget build(BuildContext context){
        return Scaffold(
            appBar: AppBar(
                title: const Text('Lesson 2'),
            ), 
            body: Center(
                child: Column(
                    mainAxisSize: MainAxisSize.min, 
                    children: [Text('Counter: $counter'), 
                        const SizedBox(height: 12), 
                        Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                                IconButton(
                                    onPressed: decrement,
                                    icon: const Icon(Icons.remove),
                                ),
                                IconButton(
                                    onPressed: increment,
                                    icon: const Icon(Icons.add),
                                ),
                            ],
                        ),
                        Padding(
                            padding: const EdgeInsets.all(12),
                            child: TextField(
                                controller: nameController,
                                decoration: const InputDecoration(
                                    labelText: 'Enter a name',
                                    border: OutlineInputBorder(),
                                )
                            )
                        ),
                        //IconButton(
                            //onPressed: addName,
                           // icon: const Icon(Icons.add)
                        //),
                        FilledButton(
                            onPressed: addName,
                            Text: const Text('Add')
                        ), 
                        SizedBox(
                            height: 200,
                            child: ListView.builder(
                                itemCount: names.length,
                                itemBuilder: (context, index){
                                    final String name = names[index];

                                    return ListTile(
                                        title: Text(name),
                                        onTap: (){
                                            setState(() {
                                                names.removeAt(index);
                                            });
                                        },
                                    ),
                                },
                            ),
                        ),
                        ],
                        
                ),
            ),
        );
    }

}
 