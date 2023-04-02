import 'package:flutter/material.dart';
import '../widgets/bottom.dart';

class DiscoverScreen extends StatelessWidget {
  const DiscoverScreen({Key? key}) : super(key: key);

  static const routeName = "/discover";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.menu,
            color: Colors.blue,
          ),
        ),
      ),
      bottomNavigationBar: const Bottom(index: 1),
      body: ListView(
        padding: const EdgeInsets.all(20.0),
        children: [const _DiscoverNews()],
      ),
    );
  }
}

class _DiscoverNews extends StatelessWidget {
  const _DiscoverNews({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Entdecken",
          style: Theme.of(context)
              .textTheme
              .headline4!
              .copyWith(color: Colors.black, fontWeight: FontWeight.w900),
        ),
        const SizedBox(height: 5),
        Text(
          "Nachrichten aus aller Welt",
          style: Theme.of(context).textTheme.bodySmall,
        ),
        const SizedBox(height: 20),
        TextFormField(
          decoration: InputDecoration(
              hintText: "Suche",
              fillColor: Colors.grey.shade200,
              filled: true,
              prefixIcon: const Icon(
                Icons.search,
                color: Colors.grey,
              ),
              suffixIcon: const Icon(
                Icons.tune,
                color: Colors.grey,
              ),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  borderSide: BorderSide.none)),
        )
      ],
    );
  }
}
