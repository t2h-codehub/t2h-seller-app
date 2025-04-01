import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:taptohello/core/utils/color_constant.dart';
import 'package:taptohello/data/PaymentGatewayModel/getBillingApiResModel.dart';
import 'package:taptohello/helper/validation.dart';
import 'package:taptohello/services/shared_preference_service.dart';

class BusinessInformationScreen extends StatefulWidget {
  const BusinessInformationScreen(
      {super.key,
      required this.business_pan,
      required this.business_gstin,
      required this.business_operational_address,
      required this.business_shipment_address,
      required this.business_city,
      required this.business_state,
      required this.formKey, required this.isGSTNotApplicable, required this.getApiDetails, required this.register_address, required this.register_shipment, required this.register_city, required this.register_state});

  final GlobalKey<FormState> formKey;
  final Function(String) business_pan;
  final Function(String) business_gstin;
  final Function(String) business_operational_address;
  final Function(String) business_shipment_address;
  final Function(String) business_city;
  final Function(String) business_state;
  final Function(bool) isGSTNotApplicable;
  final Function(String) register_address;
  final Function(String) register_shipment;
  final Function(String) register_city;
  final Function(String) register_state;
  final GetBillingApiResModel getApiDetails;

  @override
  State<BusinessInformationScreen> createState() =>
      _BusinessInformationScreenState();
}

class _BusinessInformationScreenState extends State<BusinessInformationScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _gstNotApplicable = false;
  bool _sameAsOperationAddress = false;

  TextEditingController businessPan = TextEditingController();
  TextEditingController businessGST = TextEditingController();
  TextEditingController businessOperationalAddress = TextEditingController();
  TextEditingController businessShipmentAddress = TextEditingController();
  TextEditingController businessCity = TextEditingController();
  TextEditingController businessState = TextEditingController();
  TextEditingController businessRegisterAddress = TextEditingController();
  TextEditingController businessRegisterPincode = TextEditingController();
  TextEditingController businessRegisterCity = TextEditingController();
  TextEditingController businessRegisterState = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _gstNotApplicable = SharedPreferenceService.getString('gstNotApplicable') == "true" ? true : false;
    _sameAsOperationAddress = SharedPreferenceService.getString('sameAsOperationAddress') == "true" ? true : false;
    getDetails();
  }

  getDetails() {
    if(widget.getApiDetails.success == true) {
      businessPan.text = (widget.getApiDetails.data?.businessPan != "" ? widget.getApiDetails.data?.businessPan : SharedPreferenceService.getString("paymentBusinessPan") ?? '')!;
      businessGST.text = (widget.getApiDetails.data?.gst != "" ? widget.getApiDetails.data?.gst : SharedPreferenceService.getString("paymentBusinessGST") ?? '')!;
      businessOperationalAddress.text = (widget.getApiDetails.data?.operationalAddress != "" ? widget.getApiDetails.data?.operationalAddress : SharedPreferenceService.getString("paymentBusinessAddress") ?? '')!;
      businessShipmentAddress.text =  (widget.getApiDetails.data?.shipmentAddress != "" ? widget.getApiDetails.data?.shipmentAddress : SharedPreferenceService.getString("paymentBusinessPostalCode") ?? '')!;
      businessCity.text = (widget.getApiDetails.data?.city != "" ? widget.getApiDetails.data?.city : SharedPreferenceService.getString("paymentBusinessCity") ?? '')!;
      businessState.text = (widget.getApiDetails.data?.state != "" ? widget.getApiDetails.data?.state : SharedPreferenceService.getString("paymentBusinessState") ?? '')!;
      businessRegisterAddress.text = widget.getApiDetails.data?.registerOperationalAddress ?? '';
      businessRegisterPincode.text = widget.getApiDetails.data?.registerShipmentAddress ?? '';
      businessRegisterCity.text = widget.getApiDetails.data?.registerCity ?? '';
      businessRegisterState.text = widget.getApiDetails.data?.registerState ?? '';
      debugPrint('My saved business pan is: ${businessPan.text}');
      debugPrint('My saved business pan is: ${businessGST.text}');
      debugPrint('My saved business pan is: ${businessOperationalAddress.text}');
      debugPrint('My saved business pan is: ${businessShipmentAddress.text}');
      debugPrint('My saved business pan is: ${businessCity.text}');
      debugPrint('My saved business pan is: ${businessState.text}');
    } else {
      businessPan.text = '';
      businessGST.text = '';
      businessOperationalAddress.text = '';
      businessShipmentAddress.text =  '';
      businessCity.text = '';
      businessState.text = '';
      businessRegisterAddress.text = '';
      businessRegisterPincode.text = '';
      businessRegisterCity.text = '';
      businessRegisterState.text = '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: 16,
          right: 16,
          bottom: MediaQuery.of(context).viewInsets.bottom),
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Form(
          key: widget.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Business Information',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),

              /// Business PAN Number Text field
              TextFormField(
                controller: businessPan,
                decoration: InputDecoration(
                  labelText: 'Business PAN Number',
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  hintText: 'Enter Business PAN No.',
                  hintStyle: TextStyle(
                    color: Colors.grey,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  return validPanCard(value!);
                },
                onChanged: widget.business_pan,
              ),
              SizedBox(height: 16),

              /// GST Number Text field
              TextFormField(
                controller: businessGST,
                readOnly: _gstNotApplicable ? true : false,
                decoration: InputDecoration(
                  labelText: 'GST Number',
                  hintText: 'Enter GST Number',
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  hintStyle: TextStyle(
                    color: Colors.grey,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: _gstNotApplicable ? (value) {
                  return null;
                } : (value) {
                  return validGSTNumber(value!);
                },
                onChanged: widget.business_gstin,
              ),

              /// GST not applicable
              CheckboxListTile(
                value: _gstNotApplicable,
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                contentPadding: EdgeInsets.zero,
                activeColor: AppCol.primary,
                onChanged: (value) {
                  setState(() {
                    _gstNotApplicable = value!;
                    widget.isGSTNotApplicable(_gstNotApplicable);
                    widget.register_address(_sameAsOperationAddress ? businessOperationalAddress.text : businessRegisterAddress.text);
                    widget.register_shipment(_sameAsOperationAddress ? businessShipmentAddress.text : businessRegisterPincode.text);
                    widget.register_city(_sameAsOperationAddress ? businessCity.text :businessRegisterCity.text);
                    widget.register_state(_sameAsOperationAddress ? businessState.text : businessRegisterState.text);
                  });
                  debugPrint('My gst button is: $_gstNotApplicable');
                  SharedPreferenceService.setString('gstNotApplicable', "$_gstNotApplicable");
                },
                title: Text('GST not applicable'),
                visualDensity: VisualDensity.compact,
                controlAffinity: ListTileControlAffinity.leading,
              ),
              SizedBox(height: 16),

              /// Operational address
              TextFormField(
                controller: businessOperationalAddress,
                decoration: InputDecoration(
                  labelText: 'Operational Address*',
                  hintText: 'Street 1',
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  hintStyle: TextStyle(
                    color: Colors.grey,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  return validateEmptyString(value!);
                },
                onChanged: widget.business_operational_address,
              ),
              const SizedBox(height: 20),

              /// Pincode field
              TextFormField(
                controller: businessShipmentAddress,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly, // Allow only digits
                  LengthLimitingTextInputFormatter(6),   // Limit input to 6 digits
                ],
                decoration: InputDecoration(
                  labelText: 'Shipment Pickup will happen from this address',
                  hintText: 'Pincode',
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  hintStyle: TextStyle(
                    color: Colors.grey,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  return validateZipCode(value!);
                },
                onChanged: widget.business_shipment_address,
              ),
              const SizedBox(height: 20),

              /// City field
              TextFormField(
                controller: businessCity,
                decoration: InputDecoration(
                  labelText: 'City',
                  hintText: 'Enter city',
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  hintStyle: TextStyle(
                    color: Colors.grey,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  return validateEmptyString(value!);
                },
                onChanged: widget.business_city,
              ),
              const SizedBox(height: 20),

              /// State field
              TextFormField(
                controller: businessState,
                decoration: InputDecoration(
                  labelText: 'State',
                  hintText: 'Enter state',
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  hintStyle: TextStyle(
                    color: Colors.grey,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  return validateEmptyString(value!);
                },
                onChanged: widget.business_state,
              ),
              const SizedBox(height: 20),

              /// Check box for residential address
              Text('Registered Address*'),
              const SizedBox(height: 20),

              /// Check list button
              CheckboxListTile(
                title: const Text('Same as Operational Address'),
                value: _sameAsOperationAddress,
                visualDensity: VisualDensity.compact,
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                contentPadding: EdgeInsets.zero,
                activeColor: AppCol.primary,
                onChanged: (bool? value) {
                  setState(() {
                    _sameAsOperationAddress = value!;
                  });
                  SharedPreferenceService.setString('sameAsOperationAddress', "$_sameAsOperationAddress");
                },
              ),
              const SizedBox(height: 20),

              /// Register Address
              TextFormField(
                controller: _sameAsOperationAddress ? businessOperationalAddress : businessRegisterAddress,
                decoration: InputDecoration(
                  labelText: 'Register Address',
                  hintText: 'Enter your register address',
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  hintStyle: TextStyle(
                    color: Colors.grey,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                onChanged: (value) {
                  widget.register_address(businessRegisterAddress.text);
                },
              ),
              const SizedBox(height: 20),

              /// Business Register Pincode
              TextFormField(
                controller: _sameAsOperationAddress ? businessShipmentAddress : businessRegisterPincode,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly, // Allow only digits
                  LengthLimitingTextInputFormatter(6),   // Limit input to 6 digits
                ],
                decoration: InputDecoration(
                  labelText: 'Pincode',
                  hintText: 'Enter your register pincode',
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  hintStyle: TextStyle(
                    color: Colors.grey,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                onChanged: (value) {
                  widget.register_shipment(businessRegisterPincode.text);
                },
              ),
              const SizedBox(height: 20),

              /// Register city
              TextFormField(
                controller: _sameAsOperationAddress ? businessCity : businessRegisterCity,
                decoration: InputDecoration(
                  labelText: 'City',
                  hintText: 'Enter your city',
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  hintStyle: TextStyle(
                    color: Colors.grey,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                onChanged: (value) {
                  widget.register_city(businessRegisterCity.text);
                },
              ),
              const SizedBox(height: 20),

              /// Register State
              TextFormField(
                controller: _sameAsOperationAddress ? businessState : businessRegisterState,
                decoration: InputDecoration(
                  labelText: 'Register State',
                  hintText: 'Enter your state',
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  hintStyle: TextStyle(
                    color: Colors.grey,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                onChanged: (value) {
                  widget.register_state(businessRegisterState.text);
                },
              ),

            ],
          ),
        ),
      ),
    );
  }
}
