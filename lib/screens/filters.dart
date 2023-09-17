import 'package:flutter/material.dart';

enum Filter {
  gluttenFree,
  lactoseFree,
  vegetarian,
}

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key, required this.currentFilters});

  final Map<Filter, bool> currentFilters;

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _gluttenFreeFilterSet = false;
  var _lactoseFilterSet = false;
  var _vegetarianFilterSet = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _gluttenFreeFilterSet = widget.currentFilters[Filter.gluttenFree]!;
    _lactoseFilterSet = widget.currentFilters[Filter.lactoseFree]!;
    _vegetarianFilterSet = widget.currentFilters[Filter.vegetarian]!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Filters'),
        ),
        // drawer: MainDrawer(
        //   onSelectScreen: (identifier) {
        //     Navigator.of(context).pop();
        //     if (identifier == 'meals') {
        //       Navigator.of(context).pushReplacement(
        //         MaterialPageRoute(
        //           builder: (ctx) => const TabsScreen(),
        //         ),
        //       );
        //     }
        //   },
        // ),
        body: WillPopScope(
          onWillPop: () async {
            Navigator.of(context).pop({
              Filter.gluttenFree: _gluttenFreeFilterSet,
              Filter.lactoseFree: _lactoseFilterSet,
              Filter.vegetarian: _vegetarianFilterSet,
            });
            return false;
          },
          child: Column(
            children: [
              //SWITCH FOR SETTINGS TOGGLE
              SwitchListTile(
                value: _gluttenFreeFilterSet,
                onChanged: (isChecked) {
                  setState(() {
                    _gluttenFreeFilterSet = isChecked;
                  });
                },
                title: Text(
                  'Gluttem-free',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Theme.of(context).colorScheme.onBackground,
                      ),
                ),
                subtitle: Text(
                  'Only include gluten-free meals',
                  style: Theme.of(context).textTheme.labelMedium!.copyWith(
                        color: Theme.of(context).colorScheme.onBackground,
                      ),
                ),
                activeColor: Theme.of(context).colorScheme.tertiary,
                contentPadding: EdgeInsets.only(left: 20, right: 20),
              ),

              SwitchListTile(
                value: _vegetarianFilterSet,
                onChanged: (isChecked) {
                  setState(() {
                    _vegetarianFilterSet = isChecked;
                  });
                },
                title: Text(
                  'Vegetarian',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Theme.of(context).colorScheme.onBackground,
                      ),
                ),
                subtitle: Text(
                  'Only include vegetarian meals',
                  style: Theme.of(context).textTheme.labelMedium!.copyWith(
                        color: Theme.of(context).colorScheme.onBackground,
                      ),
                ),
                activeColor: Theme.of(context).colorScheme.tertiary,
                contentPadding: EdgeInsets.only(left: 20, right: 20),
              ),
              SwitchListTile(
                value: _lactoseFilterSet,
                onChanged: (isChecked) {
                  setState(() {
                    _lactoseFilterSet = isChecked;
                  });
                },
                title: Text(
                  'Lactose-free',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Theme.of(context).colorScheme.onBackground,
                      ),
                ),
                subtitle: Text(
                  'Only include lactose-free meals',
                  style: Theme.of(context).textTheme.labelMedium!.copyWith(
                        color: Theme.of(context).colorScheme.onBackground,
                      ),
                ),
                activeColor: Theme.of(context).colorScheme.tertiary,
                contentPadding: EdgeInsets.only(left: 20, right: 20),
              ),
            ],
          ),
        ));
  }
}
