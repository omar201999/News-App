import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/shared/components/components.dart';
import 'package:news_app/shared/cubit/cubit.dart';
import 'package:news_app/shared/cubit/states.dart';
import 'package:news_app/shared/news_icons.dart';

class SearchScreen extends StatelessWidget {

  var searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
        listener: (context, state) {},
        builder: (context, state) {
        var list = NewsCubit.get(context).search;
          return Scaffold(
           appBar: AppBar(
             leading: IconButton(
                 onPressed: () {
                   Navigator.pop(context);
                 },
                 icon: const Icon(
                     Icons.arrow_back_ios_rounded,
                     color: Color(0xFF1F948B),
                 )
             ),
             title: Row(
               children: const [
                  SizedBox(
                   width: 70,
                 ),
                 Text(
                   'News',
                   style: TextStyle(
                       fontSize: 25
                   ),
                 ),
                 Text(
                   'App',
                   style: TextStyle(
                       fontWeight: FontWeight.w800,
                       color: Color(0xFF1F948B),
                       fontSize: 25
                   ),
                 )
               ],
             ),
             centerTitle: true,
           ),
           body: Column(
              children: [
                Padding(
                   padding: const EdgeInsets.all(20.0),
                   child: defaultFormField(
                      controller: searchController,
                      type:TextInputType.text,
                      onChanged: (value) {
                        NewsCubit.get(context).getSearch(value);
                      },
                      onValidate: (String? value) {
                        if(value!.isEmpty) {
                          return 'search must not be empty';
                        }
                        return null;
                      },
                      label: 'Search',
                      prefix: NewsIcons.search
                  )
            ),
                Expanded(child: articleBuilder(list, context, isSearch: true, )),
        ],
      ),
    );
      }

    );
  }


}