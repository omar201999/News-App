import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:news_app/modules/web_view/webview_screen.dart';

Widget defaultFormField({
  required TextEditingController controller,
  required TextInputType type,
  Function? onSubmit,
  ValueChanged<String>? onChanged,
  VoidCallback? onTap,
  required FormFieldValidator<String>? onValidate,
  VoidCallback? suffixPressed,
  required String label,
  required IconData prefix,
  bool isPassword = false,
  IconData? suffix,
}) =>
    TextFormField(
      controller: controller,
      keyboardType: type,
      obscureText: isPassword,
      onFieldSubmitted: (s) {
        onSubmit;
      },
      onChanged: onChanged,

      onTap: onTap,
      validator: onValidate,
      decoration: InputDecoration(
        labelText: label,
        filled: true,
        fillColor: Colors.grey.shade100,
        prefixIcon: Icon(
          prefix,
        ),
        suffixIcon: IconButton(
          onPressed: suffixPressed,
          icon: Icon(
            suffix,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: const BorderSide(
            color: Colors.teal,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: BorderSide(
            color: Colors.grey.shade300,
            width: 2.0,
          ),
        ),
      ),
    );

Widget myDivider() => Padding(
  padding: const EdgeInsets.symmetric(horizontal: 20.0),
  child: Container(
    width: double.infinity,
    height: 1.0,
    color: Colors.grey[300],
  ),
);

Widget buildArticleItem(article, context) => InkWell(
  onTap: () {
    navigateTo(context, WebViewScreen(article['url']));
  },
  child: Padding(
    padding: const EdgeInsets.all(20.0),
    child: Row(
      children: [
        if(article['urlToImage'] != null)
          Container(
          width: 120.0,
          height: 120.0,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              image: DecorationImage(
                image: NetworkImage('${article['urlToImage']}'),
                fit: BoxFit.cover,
              )),
        ),
        if(article['urlToImage'] == null)
          Container(
          width: 120.0,
          height: 120.0,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              image: const DecorationImage(
                image: NetworkImage('https://icon-library.com/images/image-gallery-icon/image-gallery-icon-14.jpg'),
                fit: BoxFit.cover,
              )),
        ),
        const SizedBox(
          width: 20.0,
        ),
        Expanded(
          child: Container(
            height: 120.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    '${article['title']}',
                    style: Theme.of(context).textTheme.bodyText1,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Text(
                  '${article['publishedAt']}',
                  style: const TextStyle(
                    color: Colors.grey,
                  ),
                )
              ],
            ),
          ),
        )
      ],
    ),
  ),
);

Widget articleBuilder(list, context,{isSearch = false}) => ConditionalBuilder(
  condition: list.length > 0,
  builder: (context) => ListView.separated(
    physics: const BouncingScrollPhysics(),
    itemBuilder: (context, index) => buildArticleItem(list[index], context),
    separatorBuilder: (context, index) => myDivider(),
    itemCount: list.length,
  ),
  fallback: (context) =>isSearch? Container() : const Center(child: CircularProgressIndicator()),
);

void navigateTo(context, widget) => Navigator.push(
  context,
  MaterialPageRoute(
    builder: (BuildContext context) => widget,
  ),
);