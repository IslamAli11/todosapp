import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubit/cubit.dart';
import 'cubit/states.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Todos App",),
        backgroundColor: Colors.teal,
      ),
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if (state is GetTodosSuccessState) {
            return ListView.builder(
                itemCount: 100,
                itemBuilder: (context, index) =>
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Container(
                        height: 200,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: Colors.grey[300]),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Column(
                                children: [
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text(
                                    "UserId",
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 18),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  CircleAvatar(
                                    radius: 30,
                                    child: Text(
                                        "${HomeCubit
                                            .get(context)
                                            .data[index]["id"]}"),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    const Text(
                                      "Title",
                                      style: TextStyle(
                                          color: Colors.red, fontSize: 25),
                                      textAlign: TextAlign.end,
                                    ),
                                    Text(
                                        "${HomeCubit
                                            .get(context)
                                            .data[index]["title"]}"),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      children: [
                                        const Text(
                                          'Completed',
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        const Spacer(),
                                        Text(
                                          "${HomeCubit
                                              .get(context)
                                              .data[index]["completed"]}",
                                          style:
                                          const TextStyle(color: Colors.orange,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ));
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
