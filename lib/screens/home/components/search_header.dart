import 'package:flutter/material.dart';

class SearchHeader extends StatefulWidget {
  const SearchHeader({
    Key key,
    this.onInput,
  }) : super(key: key);

  final Function onInput;

  @override
  _SearchHeaderState createState() => _SearchHeaderState();
}

class _SearchHeaderState extends State<SearchHeader> {
  bool _showSearch = false;

  void _toggleSearch() {
    _showSearch = !_showSearch;

    if (!_showSearch) widget.onInput("");

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: _showSearch ? TextField(
            decoration: InputDecoration(
              hintText: "Suchen"
            ),
            autofocus: true,
            onChanged: widget.onInput,
          ) : Text("wir glauben, dass dir diese filme gefallen könnten",  style: Theme.of(context).textTheme.headline4,),
        ),
        IconButton(
          icon: Icon(_showSearch ? Icons.close : Icons.search),
          onPressed: _toggleSearch,
        )
      ],
    );
  }
}