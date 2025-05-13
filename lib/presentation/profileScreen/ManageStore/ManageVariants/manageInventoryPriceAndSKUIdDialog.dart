import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taptohello/core/constants.dart';
import 'package:taptohello/presentation/profileScreen/ManageStore/AddProduct/editProductListScreen/editProductListScreen.dart';
import 'package:video_player/video_player.dart';


// The dialog widget to manage inventory and SKU ID
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
    required this.isUnlimitedInventory,
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
  final bool isUnlimitedInventory;

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
    selectedImages = widget.image ?? [];
  }

  bool get isDiscountValid {
    final discountText = discountController.text;
    final priceText = priceController.text;

    if (discountText.isEmpty || priceText.isEmpty) return true;

    try {
      final discount = double.parse(discountText);
      final price = double.parse(priceText);
      return discount <= price;
    } catch (e) {
      return true;
    }
  }

  bool validateInputs() {
    final skuIdText = skuIdController.text.trim();
    final priceText = priceController.text.trim();
    final discountText = discountController.text.trim();

    if (skuIdText.isEmpty) return false;

    if (!widget.isUnlimitedInventory) {
      final stockText = stockController.text.trim();
      if (stockText.isEmpty || int.tryParse(stockText) == null || int.parse(stockText) < 0) {
        return false;
      }
    }

    if (discountText.isNotEmpty && priceText.isNotEmpty) {
      try {
        final discount = double.parse(discountText);
        final price = double.parse(priceText);
        if (discount > price) {
          return false;
        }
      } catch (e) {
        return false;
      }
    }

    return true;
  }

  String? validateDiscountPrice() {
    final discountText = discountController.text;
    final priceText = priceController.text;

    if (discountText.isEmpty || priceText.isEmpty) return null;

    try {
      final discount = double.parse(discountText);
      final price = double.parse(priceText);
      if (discount > price) {
        return 'Discount price cannot be greater than MRP price';
      }
    } catch (e) {
      return null;
    }

    return null;
  }

  void submitForm() {
    widget.body({
      'price': priceController.text,
      'sku_id': skuIdController.text,
      'discount': discountController.text,
      'stock': widget.isUnlimitedInventory ? 'unlimited' : stockController.text,
      'selectedImages': selectedImages,
    });
  }

  @override
  Widget build(BuildContext context) {
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
              if (widget.firstVariantName.isNotEmpty)
                Text(
                  '${widget.firstVariantName}: ${widget.size ?? ""}',
                  style: TextStyle(fontSize: 16),
                ),
              SizedBox(height: 8),
              if (widget.secondVariantName.isNotEmpty)
                Text(
                  '${widget.secondVariantName}: ${widget.color ?? ""}',
                  style: TextStyle(fontSize: 16),
                ),
              SizedBox(height: 8),
              if (!widget.isUnlimitedInventory) ...[
                TextField(
                  controller: stockController,
                  decoration: InputDecoration(
                    labelText: 'Stock',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                  onChanged: (_) => setState(() {}),
                ),
                SizedBox(height: 8),
              ],
              TextField(
                controller: priceController,
                decoration: InputDecoration(
                  labelText: 'Price',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                onChanged: (_) => setState(() {}),
              ),
              SizedBox(height: 8),
              TextField(
                controller: discountController,
                decoration: InputDecoration(
                  labelText: 'Discount Price',
                  border: OutlineInputBorder(),
                  errorText: validateDiscountPrice(),
                ),
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                onChanged: (_) => setState(() {}),
              ),
              SizedBox(height: 8),
              TextField(
                controller: skuIdController,
                decoration: InputDecoration(
                  labelText: 'SKU ID',
                  border: OutlineInputBorder(),
                ),
                onChanged: (_) => setState(() {}),
              ),
              SizedBox(height: 16),
              selectedImages.isNotEmpty
    ? Wrap(
        spacing: 8.0,
        runSpacing: 8.0,
        children: selectedImages.map((mediaUrl) {
          final fullUrl = mediaUrl.contains(AppConstants.imageBaseUrl)
              ? mediaUrl
              : AppConstants.imageBaseUrl + mediaUrl;

          //final isVideo = fullUrl.toLowerCase().endsWith(".mp4");
          final isVideo = fullUrl.toLowerCase().endsWith(".mp4") || fullUrl.toLowerCase().endsWith(".mov");


          return ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: isVideo
                ? Container(
                    width: 60,
                    height: 60,
                    color: Colors.black,
                    child: VideoPlayerWidget(url: fullUrl),
                  )
                : CachedNetworkImage(
                    imageUrl: fullUrl,
                    width: 60,
                    height: 60,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => const SizedBox(
                      width: 60,
                      height: 60,
                      child: Center(child: CircularProgressIndicator(strokeWidth: 2)),
                    ),
                    errorWidget: (context, url, error) => const Icon(Icons.error, size: 24),
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
                        selectedImages: selectedImagesAsString,
                        initialImages: widget.image,
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
          onPressed: validateInputs() ? submitForm : null, 
          child: Text('Submit'),
        ),
      ],
    );
  }
}



class ImagePickerDialog extends StatefulWidget {
  final List<String>? selectedImages;
  final List<String>? initialImages;
  final List<String>? startImage;

  const ImagePickerDialog({
    Key? key,
    this.selectedImages,
    this.initialImages,
    this.startImage,
  }) : super(key: key);

  @override
  State<ImagePickerDialog> createState() => _ImagePickerDialogState();
}

class _ImagePickerDialogState extends State<ImagePickerDialog> {
  late List<String> pickedImages;
  late List<String> allAvailableImages;
  late List<String> startImage;

  String normalizeUrl(String url) {
    return url.contains(AppConstants.imageBaseUrl)
        ? url
        : AppConstants.imageBaseUrl + url;
  }

  @override
  void initState() {
    super.initState();
    final all = {
      ...(widget.startImage ?? []),
      ...(widget.initialImages ?? []),
      ...(widget.selectedImages ?? []),
    }.map(normalizeUrl).toSet();

    allAvailableImages = all.toList();
    // pickedImages = widget.startImage?.map(normalizeUrl).toList() ?? [];
     startImage = widget.startImage?.isNotEmpty == true
        ? List.from(widget.startImage!)
        : (widget.initialImages ?? []);

    // Initialize pickedImages to only contain the startImage (non-nullable list)
    pickedImages = List.from(startImage);
  }

  Widget loadMedia(String url) {
    if (url.endsWith('.mp4')) {
      return Container(
        color: Colors.black,
        child: VideoPlayerWidget(url: url),
      );
    } else {
      return CachedNetworkImage(
        imageUrl: url,
        fit: BoxFit.cover,
        placeholder: (context, url) => Center(child: CircularProgressIndicator()),
        errorWidget: (context, url, error) => Icon(Icons.error),
      );
    }
  }

 @override
Widget build(BuildContext context) {
  return AlertDialog(
    title: const Text("Select Media"),
    content: SizedBox(
      width: double.maxFinite,
      height: 500,
      child: allAvailableImages.isEmpty
          ? const Center(child: Text("No images/videos available"))
          : GridView.builder(
              shrinkWrap: true,
              itemCount: allAvailableImages.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                childAspectRatio: 0.8,
              ),
              itemBuilder: (context, index) {
                // final mediaUrl = allAvailableImages[index];
                // final isSelected = pickedImages.contains(mediaUrl);

                // final fullUrl = (mediaUrl.isNotEmpty)
                //     ? (mediaUrl.contains(AppConstants.imageBaseUrl)
                //         ? mediaUrl
                //         : AppConstants.imageBaseUrl + mediaUrl)
                //     : '';

                final mediaUrl = allAvailableImages[index];

// Extract the relative path from the full URL
final relativePath = mediaUrl.replaceFirst(AppConstants.imageBaseUrl, '');

// Use relative path for selection logic
final isSelected = pickedImages.contains(relativePath);

// Prepare full URL to load the image/video
final fullUrl = (mediaUrl.contains(AppConstants.imageBaseUrl))
    ? mediaUrl
    : AppConstants.imageBaseUrl + mediaUrl;

                return Column(
                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: mediaUrl.toLowerCase().endsWith(".mp4") || mediaUrl.toLowerCase().endsWith(".mov")
                        //mediaUrl.endsWith(".mp4")
                            ? VideoPlayerWidget(url: fullUrl)
                            : CachedNetworkImage(
                                imageUrl: fullUrl,
                                fit: BoxFit.cover,
                                placeholder: (context, url) =>
                                    const CircularProgressIndicator(),
                                errorWidget: (context, url, error) =>
                                    const Icon(Icons.error),
                              ),
                      ),
                    ),
                    // Checkbox(
                    //   value: isSelected,
                    //   onChanged: (value) {
                    //     setState(() {
                    //       if (value == true) {
                    //         pickedImages.add(mediaUrl);
                    //       } else {
                    //         pickedImages.remove(mediaUrl);
                    //       }
                    //     });
                    //   },
                    // ),
                    Checkbox(
  value: isSelected,
  onChanged: (value) {
    setState(() {
      if (value == true) {
        pickedImages.add(relativePath);
      } else {
        pickedImages.remove(relativePath);
      }
    });
  },
)

                  ],
                );
              },
            ),
    ),
    actions: [
      TextButton(
        onPressed: () => Navigator.of(context).pop(pickedImages),
        child: const Text("Done"),
      ),
    ],
  );
}
}

// Video player widget for video URLs
class VideoPlayerWidget extends StatefulWidget {
  final String url;

  VideoPlayerWidget({required this.url});

  @override
  _VideoPlayerWidgetState createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  late VideoPlayerController _controller;
  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(widget.url)
      ..initialize().then((_) {
        setState(() {});
      });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _controller.value.isInitialized
        ? GestureDetector(
            onTap: () {
              setState(() {
                if (_isPlaying) {
                  _controller.pause();
                } else {
                  _controller.play();
                }
                _isPlaying = !_isPlaying;
              });
            },
            child: AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              child: VideoPlayer(_controller),
            ),
          )
        : Container(
            width: 80,
            height: 80,
            color: Colors.black,
            child: Center(child: CircularProgressIndicator()),
          );
  }
}