import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rwcourses/constants.dart';
import 'package:rwcourses/state/filter_state_container.dart';
import 'package:rwcourses/strings.dart';
import 'package:rwcourses/ui/filter/filter_widget.dart';


class FilterPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {

  FilterState state ;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    state=FilterStateContainer.of(context);
  }


  @override
  Widget build(BuildContext context) {
    return Container(
        child: Scaffold(
          appBar: AppBar(
            title: Text(Strings.filter),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children:<Widget> [
              FilterWidget(
                value: Constants.iosFilter,
                groupValue: state.filterValue,
                onChanged: _handleRadioValueChange ,
                text: Strings.ios,
              ),FilterWidget(
                value: Constants.androidFilter,
                groupValue: state.filterValue,
                onChanged: _handleRadioValueChange ,
                text: Strings.android,
              ),FilterWidget(
                value: Constants.flutterFilter,
                groupValue: state.filterValue,
                onChanged: _handleRadioValueChange ,
                text: Strings.flutter,
              ),FilterWidget(
                value: Constants.sssFilter,
                groupValue: state.filterValue,
                onChanged: _handleRadioValueChange ,
                text: Strings.sss,
              ),FilterWidget(
                value: Constants.unityFilter,
                groupValue: state.filterValue,
                onChanged: _handleRadioValueChange ,
                text: Strings.unity,
              ),FilterWidget(
                value: Constants.macosFilter,
                groupValue: state.filterValue,
                onChanged: _handleRadioValueChange ,
                text: Strings.macos,
              ),FilterWidget(
                value: Constants.allFilter,
                groupValue: state.filterValue,
                onChanged: _handleRadioValueChange ,
                text: Strings.all,
              ),

            ],
          ),
        ),

    );
  }

  void _handleRadioValueChange(int value) async {
   state.updateFilterValue(value);
  }


}
