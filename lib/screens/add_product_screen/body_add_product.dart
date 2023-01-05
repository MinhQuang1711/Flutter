import 'package:flutter/material.dart';
import 'package:homework2/api/network_request.dart';
import 'package:homework2/custom_widget/custom_button.dart';
import 'package:homework2/custom_widget/custom_textfields.dart';

class BodyAddProduct extends StatefulWidget {
  const BodyAddProduct({Key? key}) : super(key: key);

  @override
  State<BodyAddProduct> createState() => _BodyAddProductState();
}

class _BodyAddProductState extends State<BodyAddProduct> {
  TextEditingController productName = new TextEditingController();
  TextEditingController price = new TextEditingController();
  TextEditingController rating = new TextEditingController();
  TextEditingController imageUrl = new TextEditingController();

  _addProduct() async {
    var res = await NetworkRequest.postProduct(productName.text, imageUrl.text,
        double.parse(rating.text), double.parse(price.text));
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
          height: size.height * 0.3,
          width: size.width,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30)),
              image: DecorationImage(
                  image: AssetImage('asset/Image/backgroundimage.jpg'),
                  fit: BoxFit.fitWidth)),
        ),
        SizedBox(height: 30),
        CustomTextFields(
          controllrer: productName,
          circular: 30,
          colorOutline: Colors.orange,
          hindtext: ' Product name',
          icon: Icons.drive_file_rename_outline,
          size: size,
          obs: false,
        ),
        CustomTextFields(
          controllrer: price,
          circular: 30,
          colorOutline: Colors.orange,
          hindtext: 'Price',
          icon: Icons.attach_money_outlined,
          size: size,
          obs: false,
        ),
        CustomTextFields(
          controllrer: rating,
          circular: 30,
          colorOutline: Colors.orange,
          hindtext: 'Rating',
          icon: Icons.star,
          size: size,
          obs: false,
        ),
        CustomTextFields(
          controllrer: imageUrl,
          circular: 30,
          colorOutline: Colors.orange,
          hindtext: 'Image Url',
          icon: Icons.image_aspect_ratio_outlined,
          size: size,
          obs: false,
        ),
        CustomButton(
          sizeWidth: size.width * 0.5,
          sizeHeight: 50,
          circular: 30,
          content: Text('Submit'),
          backgroundColor: Colors.orange,
          onPressed: () {
            _addProduct();
            productName.text = "";
            price.text = "";
            rating.text = "";
            imageUrl.text = "";
          },
        )
      ],
    );
  }
}
