import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_animations/flutter_map_animations.dart';
import 'package:flutter_map_location_marker/flutter_map_location_marker.dart';
import 'package:latlong2/latlong.dart';
import 'package:stacked/stacked.dart';
import 'stores_viewmodel.dart';

class StoresView extends StackedView<StoresViewModel> {
  const StoresView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    StoresViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: const MyMap());
  }

  @override
  StoresViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      StoresViewModel();
}

class MyMap extends StatefulWidget {
  const MyMap({super.key});

  @override
  State<MyMap> createState() => _MyMapState();
}

class _MyMapState extends State<MyMap> with TickerProviderStateMixin {
  late final _animatedMapController = AnimatedMapController(vsync: this);

  static const _useTransformerId = 'useTransformerId';

  final markerSize = 50.0;
  final markers = ValueNotifier<List<AnimatedMarker>>([]);
  final center = const LatLng(14.58691000, 121.06140000);

  bool _useTransformer = true;

  Marker buildPin(LatLng point) => Marker(
      point: point,
      builder: (ctx) => const Icon(
            Icons.location_pin,
            size: 35,
            color: Colors.red,
          ),
      width: 35,
      height: 35,
      anchorPos: AnchorPos.align(AnchorAlign.center));

  Widget actions() {
    return SeparatedColumn(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      separator: const SizedBox(height: 8),
      children: [
        FloatingActionButton(
          onPressed: () => _animatedMapController.animatedRotateFrom(
            90,
            customId: _useTransformer ? _useTransformerId : null,
          ),
          tooltip: 'Rotate 90°',
          child: const Icon(Icons.rotate_right),
        ),
        FloatingActionButton(
          onPressed: () => _animatedMapController.animatedRotateFrom(
            -90,
            customId: _useTransformer ? _useTransformerId : null,
          ),
          tooltip: 'Rotate -90°',
          child: const Icon(Icons.rotate_left),
        ),
        FloatingActionButton(
          onPressed: () {
            markers.value = [];
            _animatedMapController.animateTo(
              dest: center,
              rotation: 0,
              customId: _useTransformer ? _useTransformerId : null,
            );
          },
          tooltip: 'Clear modifications',
          child: const Icon(Icons.clear_all),
        ),
        FloatingActionButton(
          onPressed: () => _animatedMapController.animatedZoomIn(
            customId: _useTransformer ? _useTransformerId : null,
          ),
          tooltip: 'Zoom in',
          child: const Icon(Icons.zoom_in),
        ),
        FloatingActionButton(
          onPressed: () => _animatedMapController.animatedZoomOut(
            customId: _useTransformer ? _useTransformerId : null,
          ),
          tooltip: 'Zoom out',
          child: const Icon(Icons.zoom_out),
        ),
        FloatingActionButton(
          tooltip: 'Center on markers',
          onPressed: () {
            if (markers.value.isEmpty) return;

            final points = markers.value.map((m) => m.point).toList();
            _animatedMapController.centerOnPoints(
              points,
              customId: _useTransformer ? _useTransformerId : null,
            );
          },
          child: const Icon(Icons.center_focus_strong),
        ),
        FloatingActionButton.extended(
          label: Row(
            children: [
              const Text('Transformer'),
              Switch(
                activeColor: Colors.blue.shade200,
                activeTrackColor: Colors.black38,
                value: _useTransformer,
                onChanged: (newValue) {
                  setState(() {
                    _useTransformer = newValue;
                  });
                },
              ),
            ],
          ),
          onPressed: () {
            setState(() {
              _useTransformer = !_useTransformer;
            });
          },
        ),
      ],
    );
  }

  @override
  void dispose() {
    markers.dispose();
    _animatedMapController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: actions(),
      body: FlutterMap(
        mapController: _animatedMapController.mapController,
        options: MapOptions(
          center: const LatLng(14.58691000, 121.06140000),
          zoom: 10.5,
        ),
        nonRotatedChildren: const [
          RichAttributionWidget(
            attributions: [
              TextSourceAttribution(
                'OpenStreetMap contributors',
                /*       onTap: () => launchUrl(
                        Uri.parse('https://openstreetmap.org/copyright')), */
              ),
            ],
          ),
        ],
        children: [
          TileLayer(
            urlTemplate:
                'https://api.mapbox.com/styles/v1/mbulingit/cll89rse000b401puaxxlcroa/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoibWJ1bGluZ2l0IiwiYSI6ImNsbDdqdG1ucTBzd2Izc3FxYXF2Nnp3NXMifQ.C0RXDFn0tmETYAAhKrITDw',
            additionalOptions: const {
              'token':
                  'pk.eyJ1IjoibWJ1bGluZ2l0IiwiYSI6ImNsbDdqdG1ucTBzd2Izc3FxYXF2Nnp3NXMifQ.C0RXDFn0tmETYAAhKrITDw',
              'id': 'mapbox.mapbox-streets-v8'
            },
          ),
          MarkerLayer(
            markers: [buildPin(const LatLng(14.58691000, 121.06140000))],
          ),
          CurrentLocationLayer(
              followOnLocationUpdate: FollowOnLocationUpdate.always,
              turnOnHeadingUpdate: TurnOnHeadingUpdate.never,
              style: const LocationMarkerStyle(
                marker: DefaultLocationMarker(
                  child: Icon(
                    Icons.navigation,
                    color: Colors.white,
                  ),
                ),
                markerSize: Size(40, 40),
                markerDirection: MarkerDirection.heading,
              )),
          CircleLayer(
            circles: [
              CircleMarker(
                borderColor: Colors.red,
                borderStrokeWidth: 2,
                color: Colors.orange.withOpacity(0.1),
                point: const LatLng(14.58691000, 121.06140000),
                radius: 12000,
                useRadiusInMeter: true,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class SeparatedColumn extends StatelessWidget {
  const SeparatedColumn({
    super.key,
    required this.separator,
    this.children = const [],
    this.mainAxisSize = MainAxisSize.max,
    this.crossAxisAlignment = CrossAxisAlignment.start,
  });

  final Widget separator;
  final List<Widget> children;
  final MainAxisSize mainAxisSize;
  final CrossAxisAlignment crossAxisAlignment;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: mainAxisSize,
      crossAxisAlignment: crossAxisAlignment,
      children: [
        ..._buildChildren(),
      ],
    );
  }

  Iterable<Widget> _buildChildren() sync* {
    for (var i = 0; i < children.length; i++) {
      yield children[i];
      if (i < children.length - 1) yield separator;
    }
  }
}
