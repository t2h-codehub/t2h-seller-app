import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taptohello/core/app_export.dart';
import 'package:taptohello/presentation/profileScreen/ManageStore/AddProduct/editProductListScreen/editProductListScreen.dart';






class ManageInventoryPriceAndSKUIdDialog extends ConsumerStatefulWidget {
  const ManageInventoryPriceAndSKUIdDialog({
    super.key,
    required this.size,
    this.color,
    required this.stock,
    required this.firstVariantName,
    required this.secondVariantName,
    required this.body,
    required this.skuid,
    required this.mrp,
    this.image,
    required this.discountPrice,
    required this.productId,
  });

  final String productId;
  final String firstVariantName;
  final String secondVariantName;
  final String size;
  final String? color;
  final String stock;
  final String skuid;
  final String mrp;
  final List<String>? image;
  final String discountPrice;
  final Function(Map<String, dynamic>) body;

  @override
  _ManageInventoryPriceAndSKUIdDialogState createState() =>
      _ManageInventoryPriceAndSKUIdDialogState();
}

class _ManageInventoryPriceAndSKUIdDialogState
    extends ConsumerState<ManageInventoryPriceAndSKUIdDialog> {
  TextEditingController stockController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController discountController = TextEditingController();
  TextEditingController skuIdController = TextEditingController();
  bool isUnlimitedStock = false;

  List<String> selectedImages = [];
   List<String> startImage1 = [];

  @override
  void initState() {
    super.initState();
    stockController.text = widget.stock;
    priceController.text = widget.mrp;
    discountController.text = widget.discountPrice;
    skuIdController.text = widget.skuid;
    isUnlimitedStock = widget.stock == "unlimited"; 

    // Initialize selected images with widget.image
    selectedImages = widget.image ?? [];
  }

  @override
  Widget build(BuildContext context) {
    // final selectedImagesDynamic = ref.watch(manageVariantProvider);

    // List<String> selectedImagesAsString = List<String>.from(
    //     selectedImagesDynamic.map((item) => item.toString()));
    final selectedImagesDynamic = ref.watch(manageVariantProvider);
final List<String> selectedImagesAsString = List<String>.from(selectedImagesDynamic ?? []);


    return AlertDialog(
      title: Text('Manage Inventory', style: TextStyle(fontSize: 18)),
      content: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            
            
              if (widget.firstVariantName.isNotEmpty == true)
  Text(
    '${widget.firstVariantName}: ${widget.size ?? ""}',
    style: TextStyle(fontSize: 16),
  ),
SizedBox(height: 8),
if (widget.secondVariantName.isNotEmpty == true)
  Text(
    '${widget.secondVariantName}: ${widget.color ?? ""}',
    style: TextStyle(fontSize: 16),
  ),
SizedBox(height: 8),

              TextField(
                controller: stockController,
                decoration: InputDecoration(
                  labelText: 'Stock',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 8),
              TextField(
                controller: priceController,
                decoration: InputDecoration(
                  labelText: 'Price',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.numberWithOptions(decimal: true),
              ),
              SizedBox(height: 8),
              TextField(
                controller: discountController,
                decoration: InputDecoration(
                  labelText: 'Discount Price',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.numberWithOptions(decimal: true),
              ),
              SizedBox(height: 8),
              TextField(
                controller: skuIdController,
                decoration: InputDecoration(
                  labelText: 'SKU ID',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),

              selectedImages.isNotEmpty
                  ? Wrap(
                      spacing: 8.0,
                      children: selectedImages.map((imageUrl) {
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.network(
                            imageUrl,
                            width: 60,
                            height: 60,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Icon(Icons.error);
                            },
                          ),
                        );
                      }).toList(),
                    )
                  : Text('No images selected', style: TextStyle(fontSize: 14)),

              SizedBox(height: 16),
             InkWell(
  onTap: () async {
   
    List<String>? selected = await showDialog<List<String>>(
      
      context: context,
      builder: (BuildContext context) {
        return ImagePickerDialog(
          selectedImages: selectedImagesAsString, // Ensure it's properly converted
          initialImages: widget.image, // Ensure widget.image is also a List<String>
          startImage: startImage1,
        );
      },
    );

    if (selected != null) {
      setState(() {
        startImage1 = selected;
        selectedImages = selected;
      });
    }
  },
  child: Row(
    children: [
      Icon(Icons.add_a_photo, size: 24),
      SizedBox(width: 8),
      Text('Select Images', style: TextStyle(fontSize: 16)),
    ],
  ),
),

            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            widget.body({
              'price': priceController.text,
              'sku_id': skuIdController.text,
              'discount': discountController.text,
              'stock': stockController.text,
              'selectedImages': selectedImages,
            });
          },
          child: Text('Submit'),
        ),
      ],
    );
  }
}


class ImagePickerDialog extends StatefulWidget {
  final List<String>? selectedImages; // Previously selected images
  final List<String>? initialImages;  // Initial set of images
  List<String>? startImage;  // List to store the initial set of images (not final)

  ImagePickerDialog({
    Key? key,
    this.selectedImages,
    this.initialImages,
    this.startImage,
  }) : super(key: key);

  @override
  _ImagePickerDialogState createState() => _ImagePickerDialogState();
}

class _ImagePickerDialogState extends State<ImagePickerDialog> {
  late List<String> pickedImages; // Tracks selected images
  late List<String> allAvailableImages; // Displays all available images
  late List<String> startImage; // Non-nullable list to store the images

  @override
  void initState() {
    super.initState();

    // Initialize startImage: Use widget.startImage if available, else use widget.initialImages
    startImage = widget.startImage?.isNotEmpty == true
        ? List.from(widget.startImage!)
        : (widget.initialImages ?? []);

    // Initialize pickedImages to only contain the startImage (non-nullable list)
    pickedImages = List.from(startImage);

    // Ensure allAvailableImages contains only unique images from initial and selected images
    allAvailableImages = {
      ...startImage,
      ...(widget.selectedImages ?? []),
    }.toList();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Select Images'),
      content: allAvailableImages.isNotEmpty
          ? Container(
            width: 450,
              height: 300, // Fixed height for the content area
              child: SingleChildScrollView(
                child: Wrap(
                  spacing: 8.0, // Space between items horizontally
                  runSpacing: 8.0, // Space between items vertically
                  children: allAvailableImages.map((imageUrl) {
                    bool isSelected = pickedImages.contains(imageUrl);

                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          if (isSelected) {
                            pickedImages.remove(imageUrl);  // Deselect image
                          } else {
                            pickedImages.add(imageUrl); // Select image
                          }
                        });
                      },
                      child: Stack(
                        alignment: Alignment.topRight,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.network(
                              imageUrl,
                              width: 80,
                              height: 80,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) => Icon(Icons.error),
                            ),
                          ),
                          if (isSelected)
                            Positioned(
                              top: 4,
                              right: 4,
                              child: Icon(Icons.check_circle, color: Colors.green, size: 24),
                            ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ),
            )
          : Text(
              "No images available",
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
      actions: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0),
          child: ElevatedButton(
            onPressed: () {
              // Return updated picked images (no duplicates)
              Navigator.pop(context, pickedImages);
            },
            child: Text('Done', style: TextStyle(fontSize: 18)),
            style: ElevatedButton.styleFrom(
              minimumSize: Size(120, 50), // Set button size
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ),
      ],
    );
  }
}












// class ImagePickerDialog extends StatefulWidget {
//   final List<String> selectedImages;

//   const ImagePickerDialog({Key? key, required this.selectedImages}) : super(key: key);

//   @override
//   _ImagePickerDialogState createState() => _ImagePickerDialogState();
// }

// class _ImagePickerDialogState extends State<ImagePickerDialog> {
//   List<String> pickedImages = [];

//   @override
//   void initState() {
//     super.initState();
//     pickedImages = []; // No images selected by default
//   }

//   @override
//   Widget build(BuildContext context) {
//     return AlertDialog(
//       title: Text('Select Images'),
//       content: Container(
//         width: double.maxFinite, // To allow GridView to expand fully
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             widget.selectedImages.isNotEmpty
//                 ? SizedBox(
//                     height: 250, // Adjust height dynamically if needed
//                     child: GridView.builder(
//                       shrinkWrap: true,
//                       physics: BouncingScrollPhysics(),
//                       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                         crossAxisCount: 3, // 3 images per row
//                         crossAxisSpacing: 8,
//                         mainAxisSpacing: 8,
//                         childAspectRatio: 1, // Square images
//                       ),
//                       itemCount: widget.selectedImages.length,
//                       itemBuilder: (context, index) {
//                         String imageUrl = widget.selectedImages[index];
//                         return GestureDetector(
//                           onTap: () {
//                             setState(() {
//                               if (pickedImages.contains(imageUrl)) {
//                                 pickedImages.remove(imageUrl);
//                               } else {
//                                 pickedImages.add(imageUrl);
//                               }
//                             });
//                           },
//                           child: Container(
//                             decoration: BoxDecoration(
//                               border: Border.all(
//                                 color: pickedImages.contains(imageUrl) ? Colors.blue : Colors.transparent,
//                                 width: 3,
//                               ),
//                               borderRadius: BorderRadius.circular(8),
//                             ),
//                             child: ClipRRect(
//                               borderRadius: BorderRadius.circular(8),
//                               child: Image.network(
//                                 imageUrl,
//                                 width: 100,
//                                 height: 100,
//                                 fit: BoxFit.cover,
//                                 errorBuilder: (context, error, stackTrace) => Icon(Icons.error),
//                               ),
//                             ),
//                           ),
//                         );
//                       },
//                     ),
//                   )
//                 : Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Text("No images available", style: TextStyle(fontSize: 16, color: Colors.grey)),
//                   ),
//           ],
//         ),
//       ),
//       actions: [
//         SizedBox(
//           width: double.infinity,
//           child: ElevatedButton(
//             style: ElevatedButton.styleFrom(
//               backgroundColor: AppCol.primary,
//               padding: EdgeInsets.symmetric(vertical: 14), // Bigger pop button
//               shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//             ),
//             onPressed: () {
//               Navigator.pop(context, pickedImages); // Return selected images
//             },
//             child: Text(
//               'Done',
//               style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }













// class ManageInventoryPriceAndSKUIdDialog extends ConsumerStatefulWidget {
//   const ManageInventoryPriceAndSKUIdDialog({
//     super.key,
//     required this.size,
//     this.color,
//     required this.stock,
//     required this.firstVariantName,
//     required this.secondVariantName,
//     required this.body,
//     required this.skuid,
//     required this.mrp,
//     this.image,
//     required this.discountPrice,
//     required this.productId,
//   });

//   final String productId;
//   final String firstVariantName;
//   final String secondVariantName;
//   final String size;
//   final String? color;
//   final String stock;
//   final String skuid;
//   final String mrp;
//   final List<String>? image;
//   final String discountPrice;
//   final Function(Map<String, dynamic>) body;

//   @override
//   _ManageInventoryPriceAndSKUIdDialogState createState() =>
//       _ManageInventoryPriceAndSKUIdDialogState();
// }

// class _ManageInventoryPriceAndSKUIdDialogState
//     extends ConsumerState<ManageInventoryPriceAndSKUIdDialog> {
//   TextEditingController stockController = TextEditingController();
//   TextEditingController priceController = TextEditingController();
//   TextEditingController discountController = TextEditingController();
//   TextEditingController skuIdController = TextEditingController();
//   bool isUnlimitedStock = false;

//   // Start with an empty list
//   List<String> selectedImages = [];

//   @override
//   void initState() {
//     super.initState();
//     stockController.text = widget.stock;
//     priceController.text = widget.mrp;
//     discountController.text = widget.discountPrice;
//     skuIdController.text = widget.skuid;
//     isUnlimitedStock = widget.stock == "unlimited"; // Example logic
//     print(widget.image);
//   }

//   @override
//   Widget build(BuildContext context) {
//     // Watching the provider for dynamic selected images
//     final selectedImagesDynamic = ref.watch(manageVariantProvider);
    
//     // Convert dynamic images to String if needed (assuming the provider returns a list of URLs as dynamic data)
//     List<String> selectedImagesAsString = List<String>.from(
//         selectedImagesDynamic.map((item) => item.toString()));

//     return AlertDialog(
//       title: Text('Manage Inventory', style: TextStyle(fontSize: 18)),
//       content: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text('Size: ${widget.size}', style: TextStyle(fontSize: 16)),
//               SizedBox(height: 8),
//               Text('Color: ${widget.color ?? "N/A"}', style: TextStyle(fontSize: 16)),
//               SizedBox(height: 8),
//               TextField(
//                 controller: stockController,
//                 decoration: InputDecoration(
//                   labelText: 'Stock',
//                   border: OutlineInputBorder(),
//                 ),
//                 keyboardType: TextInputType.number,
//               ),
//               SizedBox(height: 8),
//               TextField(
//                 controller: priceController,
//                 decoration: InputDecoration(
//                   labelText: 'Price',
//                   border: OutlineInputBorder(),
//                 ),
//                 keyboardType: TextInputType.numberWithOptions(decimal: true),
//               ),
//               SizedBox(height: 8),
//               TextField(
//                 controller: discountController,
//                 decoration: InputDecoration(
//                   labelText: 'Discount Price',
//                   border: OutlineInputBorder(),
//                 ),
//                 keyboardType: TextInputType.numberWithOptions(decimal: true),
//               ),
//               SizedBox(height: 8),
//               TextField(
//                 controller: skuIdController,
//                 decoration: InputDecoration(
//                   labelText: 'SKU ID',
//                   border: OutlineInputBorder(),
//                 ),
//               ),
//               SizedBox(height: 16),
//               // Only show images if there are selected images
//               selectedImages.isNotEmpty
//                   ? Wrap(
//                       spacing: 8.0,
//                       children: selectedImages.map((imageUrl) {
//                         return ClipRRect(
//                           borderRadius: BorderRadius.circular(8),
//                           child: Image.network(
//                             imageUrl,
//                             width: 60,
//                             height: 60,
//                             fit: BoxFit.cover,
//                             errorBuilder: (context, error, stackTrace) {
//                               return Icon(Icons.error);
//                             },
//                           ),
//                         );
//                       }).toList(),
//                     )
//                   : Text('No images selected', style: TextStyle(fontSize: 14)),
//               SizedBox(height: 16),
//               InkWell(
//   onTap: () async {
//     List<String>? selected = await showDialog<List<String>>(
//       context: context,
//       builder: (BuildContext context) {
//         return ImagePickerDialog(
//           selectedImages: selectedImagesAsString, // The images from provider
//           initialImages: widget.image, // Default images from widget.image
//         );
//       },
//     );
//     if (selected != null) {
//       setState(() {
//         selectedImages = selected; // Update the selected images after picking
//       });
//     }
//   },
//   child: Row(
//     children: [
//       Icon(Icons.add_a_photo, size: 24),
//       SizedBox(width: 8),
//       Text('Select Images', style: TextStyle(fontSize: 16)),
//     ],
//   ),
// ),

//             ],
//           ),
//         ),
//       ),
//      actions: [
//   // Cancel Button (Same InkWell Design)
//   InkWell(
//     onTap: () {
//       Navigator.pop(context);  // Close the dialog on Cancel
//     },
//     child: Container(
//       width: double.infinity,
//       padding: EdgeInsets.only(top: 14, bottom: 14),
//       margin: EdgeInsets.only(top: 10, bottom: 10),
//       decoration: BoxDecoration(
//         color: Colors.red,  // Red for Cancel
//         borderRadius: BorderRadius.circular(10),
//       ),
//       child: Center(
//         child: Text(
//           'Cancel',
//           style: TextStyle(
//             color: Colors.white,
//             fontSize: 12,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//       ),
//     ),
//   ),

//   // Submit Button (Same InkWell Design)
//   InkWell(
//                       onTap: () {
//                         // widget.body({
//                         //   'price': priceController.text,
//                         //   'sku_id': skuIdController.text,
//                         //   'discount': discountController.text,
//                         //   'stock': stockController.text,
//                         // });
//                         // Navigator.pop(context);
//                         widget.body({
//   'price': priceController.text,
//   'sku_id': skuIdController.text,
//   'discount': discountController.text,
//   'stock': stockController.text,
//   'selectedImages': selectedImages,
// });
//                       },
//                       child: Container(
//                         width: double.infinity,
//                         padding: EdgeInsets.only(top: 14, bottom: 14),
//                         margin: EdgeInsets.only(top: 10, bottom: 10),
//                         decoration: BoxDecoration(
//                           color: AppCol.primary,
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                         child: Center(
//                           child: Text(
//                             'Submit',
//                             style: TextStyle(
//                               color: Colors.white,
//                               fontSize: 12,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
// ],

//     );
//   }
// }


// class ImagePickerDialog extends StatefulWidget {
//   final List<String> selectedImages;
//   final List<String>? initialImages; // Newly added to hold the initial images

//   const ImagePickerDialog({
//     Key? key,
//     required this.selectedImages,
//     this.initialImages,
//   }) : super(key: key);

//   @override
//   _ImagePickerDialogState createState() => _ImagePickerDialogState();
// }

// class _ImagePickerDialogState extends State<ImagePickerDialog> {
//   List<String> pickedImages = [];

//   @override
//   void initState() {
//     super.initState();
    
//     // Set initially selected images (if they exist in widget.selectedImages)
//     if (widget.initialImages != null) {
//       pickedImages = widget.initialImages!
//           .where((image) => widget.selectedImages.contains(image))
//           .toList();
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return AlertDialog(
//       title: Text('Select Images'),
//       content: Container(
//         width: double.maxFinite, // Allow GridView to expand fully
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             // ✅ Show the default images (from widget.initialImages)
//             if (widget.initialImages != null && widget.initialImages!.isNotEmpty)
//               Wrap(
//                 spacing: 8.0,
//                 children: widget.initialImages!.map((imageUrl) {
//                   return ClipRRect(
//                     borderRadius: BorderRadius.circular(8),
//                     child: Image.network(
//                       imageUrl,
//                       width: 100,
//                       height: 100,
//                       fit: BoxFit.cover,
//                       errorBuilder: (context, error, stackTrace) => Icon(Icons.error),
//                     ),
//                   );
//                 }).toList(),
//               ),

//             SizedBox(height: 12),

//             // ✅ Show the GridView with selectable images
//             widget.selectedImages.isNotEmpty
//                 ? SizedBox(
//                     height: 250, // Adjust height dynamically if needed
//                     child: GridView.builder(
//                       shrinkWrap: true,
//                       physics: BouncingScrollPhysics(),
//                       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                         crossAxisCount: 3, // 3 images per row
//                         crossAxisSpacing: 8,
//                         mainAxisSpacing: 8,
//                         childAspectRatio: 1, // Square images
//                       ),
//                       itemCount: widget.selectedImages.length,
//                       itemBuilder: (context, index) {
//                         String imageUrl = widget.selectedImages[index];
//                         return GestureDetector(
//                           onTap: () {
//                             setState(() {
//                               if (pickedImages.contains(imageUrl)) {
//                                 pickedImages.remove(imageUrl);
//                               } else {
//                                 pickedImages.add(imageUrl);
//                               }
//                             });
//                           },
//                           child: Container(
//                             decoration: BoxDecoration(
//                               border: Border.all(
//                                 color: pickedImages.contains(imageUrl) ? Colors.blue : Colors.transparent,
//                                 width: 3,
//                               ),
//                               borderRadius: BorderRadius.circular(8),
//                             ),
//                             child: ClipRRect(
//                               borderRadius: BorderRadius.circular(8),
//                               child: Image.network(
//                                 imageUrl,
//                                 width: 100,
//                                 height: 100,
//                                 fit: BoxFit.cover,
//                                 errorBuilder: (context, error, stackTrace) => Icon(Icons.error),
//                               ),
//                             ),
//                           ),
//                         );
//                       },
//                     ),
//                   )
//                 : Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Text("No images available", style: TextStyle(fontSize: 16, color: Colors.grey)),
//                   ),
//           ],
//         ),
//       ),
//       actions: [
//         SizedBox(
//           width: double.infinity,
//           child: ElevatedButton(
//             style: ElevatedButton.styleFrom(
//               backgroundColor: Colors.blue,
//               padding: EdgeInsets.symmetric(vertical: 14), // Bigger pop button
//               shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//             ),
//             onPressed: () {
//               Navigator.pop(context, pickedImages); // Return selected images
//             },
//             child: Text(
//               'Done',
//               style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }



// class ImagePickerDialog extends StatefulWidget {
//   final List<String> selectedImages;

//   const ImagePickerDialog({Key? key, required this.selectedImages}) : super(key: key);

//   @override
//   _ImagePickerDialogState createState() => _ImagePickerDialogState();
// }

// class _ImagePickerDialogState extends State<ImagePickerDialog> {
//   List<String> pickedImages = [];

//   @override
//   void initState() {
//     super.initState();
//     pickedImages = []; // No images selected by default
//   }

//   @override
//   Widget build(BuildContext context) {
//     return AlertDialog(
//       title: Text('Select Images'),
//       content: Container(
//         width: double.maxFinite, // To allow GridView to expand fully
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             widget.selectedImages.isNotEmpty
//                 ? SizedBox(
//                     height: 250, // Adjust height dynamically if needed
//                     child: GridView.builder(
//                       shrinkWrap: true,
//                       physics: BouncingScrollPhysics(),
//                       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                         crossAxisCount: 3, // 3 images per row
//                         crossAxisSpacing: 8,
//                         mainAxisSpacing: 8,
//                         childAspectRatio: 1, // Square images
//                       ),
//                       itemCount: widget.selectedImages.length,
//                       itemBuilder: (context, index) {
//                         String imageUrl = widget.selectedImages[index];
//                         return GestureDetector(
//                           onTap: () {
//                             setState(() {
//                               if (pickedImages.contains(imageUrl)) {
//                                 pickedImages.remove(imageUrl);
//                               } else {
//                                 pickedImages.add(imageUrl);
//                               }
//                             });
//                           },
//                           child: Container(
//                             decoration: BoxDecoration(
//                               border: Border.all(
//                                 color: pickedImages.contains(imageUrl) ? Colors.blue : Colors.transparent,
//                                 width: 3,
//                               ),
//                               borderRadius: BorderRadius.circular(8),
//                             ),
//                             child: ClipRRect(
//                               borderRadius: BorderRadius.circular(8),
//                               child: Image.network(
//                                 imageUrl,
//                                 width: 100,
//                                 height: 100,
//                                 fit: BoxFit.cover,
//                                 errorBuilder: (context, error, stackTrace) => Icon(Icons.error),
//                               ),
//                             ),
//                           ),
//                         );
//                       },
//                     ),
//                   )
//                 : Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Text("No images available", style: TextStyle(fontSize: 16, color: Colors.grey)),
//                   ),
//           ],
//         ),
//       ),
//       actions: [
//         SizedBox(
//           width: double.infinity,
//           child: ElevatedButton(
//             style: ElevatedButton.styleFrom(
//               backgroundColor: AppCol.primary,
//               padding: EdgeInsets.symmetric(vertical: 14), // Bigger pop button
//               shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//             ),
//             onPressed: () {
//               Navigator.pop(context, pickedImages); // Return selected images
//             },
//             child: Text(
//               'Done',
//               style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }


