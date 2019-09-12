import 'package:bookstore/providers/app_state.dart';
import 'package:bookstore/styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      builder: (context) => AppState(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(),
        home: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({
    Key key,
  }) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Duration _animationDuration = const Duration(milliseconds: 300);
  Animation<double> _popularAnimation;
  Animation _bgColorPopular;
  Animation<Radius> _borderRadiusPopular;
  Animation<TextStyle> _textStylePopular;
  Animation<double> _shelfAnimation;
  Animation _bgColorShelf;
  Animation<double> _opacityAnimation;
  Animation<double> _reverseOpacityAnimation;
  Animation<double> _spacerAnimation;
  Animation<double> _fontSizeAnimation;
  Animation<TextStyle> _textStyleShelf;
  Animation<double> _scaleAnimation;

  bool _isExpanded;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: _animationDuration)
          ..addListener(() {
            setState(() {});
          });
    _popularAnimation =
        Tween<double>(begin: 0.56, end: 0.77).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.ease,
    ));
    _bgColorPopular = ColorTween(begin: Colors.blueGrey[100], end: Colors.white)
        .animate(_animationController);
    _borderRadiusPopular =
        Tween<Radius>(begin: Radius.circular(0.0), end: Radius.circular(32.0))
            .animate(_animationController);
    _textStylePopular =
        TextStyleTween(begin: sectionStyle, end: sectionStyleExpanded)
            .animate(_animationController);
    _shelfAnimation =
        Tween<double>(begin: 0.48, end: 0.09).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.ease,
    ));
    _bgColorShelf = ColorTween(begin: Colors.white, end: Colors.blueGrey[100])
        .animate(_animationController);
    _opacityAnimation =
        Tween<double>(begin: 0, end: 1).animate(_animationController);
    _reverseOpacityAnimation =
        Tween<double>(begin: 1, end: 0).animate(_animationController);
    _spacerAnimation =
        Tween<double>(begin: 80.0, end: 0).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.ease,
    ));
    _fontSizeAnimation =
        Tween<double>(begin: 32.0, end: 18.0).animate(_animationController);
    _textStyleShelf =
        TextStyleTween(begin: sectionStyleExpanded, end: sectionStyle)
            .animate(_animationController);
    _scaleAnimation =
        Tween<double>(begin: 0.56, end: 0.40).animate(_animationController);
    setState(() {
      _isExpanded = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SafeArea(
          child: Scaffold(
        body: Stack(
          overflow: Overflow.visible,
          children: <Widget>[
            Container(),
            AnimatedContainer(
              duration: _animationDuration,
              curve: Curves.ease,
              height: size.height * _scaleAnimation.value,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    'https://images.unsplash.com/photo-1532012197267-da84d127e765?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2134&q=80',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(6.0),
                            ),
                            child: TextField(
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.search),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 12.0,
                        ),
                        MenuButton(),
                      ],
                    ),
                  ),
                  AnimatedContainer(
                    duration: _animationDuration,
                    curve: Curves.ease,
                    margin: EdgeInsets.only(top: _spacerAnimation.value),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          AnimatedDefaultTextStyle(
                            duration: _animationDuration,
                            curve: Curves.ease,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: _fontSizeAnimation.value),
                            child: Text(
                              'Mysteries & \nThrillers'.toUpperCase(),
                            ),
                          ),
                          AnimatedOpacity(
                            opacity: _opacityAnimation.value,
                            duration: _animationDuration,
                            curve: Curves.ease,
                            child: Dots(),
                          ),
                        ],
                      ),
                    ),
                  ),
                  AnimatedOpacity(
                      opacity: _reverseOpacityAnimation.value,
                      duration: _animationDuration,
                      curve: Curves.ease,
                      child: Center(child: Dots())),
                  SizedBox(
                    height: 60.0,
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              child: AnimatedContainer(
                duration: _animationDuration,
                curve: Curves.ease,
                height: size.height * _popularAnimation.value,
                width: size.width,
                decoration: BoxDecoration(
                  color: _bgColorPopular.value,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(32.0),
                      topRight: _borderRadiusPopular.value),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            'Popular',
                            style: _textStylePopular.value,
                          ),
                          AnimatedSwitcher(
                            duration: _animationDuration,
                            switchInCurve: Curves.ease,
                            child: _isExpanded
                                ? Text('See all', style: sectionStyleExpanded)
                                : InkResponse(
                                    onTap: () {
                                      print('clicked');

                                      if (!_isExpanded) {
                                        _animationController.forward();
                                      } else {
                                        _animationController.reverse();
                                      }
                                      setState(() {
                                        _isExpanded = !_isExpanded;
                                      });
                                      print(_bgColorPopular.value);
                                    },
                                    child: Material(
                                      color: Colors.transparent,
                                      child: Text('Open section', style: sectionStyle),
                                    ),
                                  ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              child: AnimatedContainer(
                duration: _animationDuration,
                curve: Curves.ease,
                height: size.height * _shelfAnimation.value,
                width: size.width,
                decoration: BoxDecoration(
                  color: _bgColorShelf.value,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(32.0),
                      topRight: _borderRadiusPopular.value),
                ),
                child: Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            'BookShelf',
                            style: _textStyleShelf.value,
                          ),
                          AnimatedSwitcher(
                            duration: _animationDuration,
                            switchInCurve: Curves.ease,
                            child: _isExpanded
                                ? InkResponse(
                                    onTap: () {
                                      print('clicked');

                                      if (!_isExpanded) {
                                        _animationController.forward();
                                      } else {
                                        _animationController.reverse();
                                      }
                                      setState(() {
                                        _isExpanded = !_isExpanded;
                                      });
                                    },
                                    child: Material(
                                      color: Colors.transparent,
                                      child: Text('Open section', style: sectionStyle),
                                    ),
                                  )
                                : Text('See all', style: sectionStyleExpanded),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TopWidget extends StatelessWidget {
  const TopWidget({
    Key key,
    @required this.height,
  }) : super(key: key);

  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(
            'https://images.unsplash.com/photo-1532012197267-da84d127e765?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2134&q=80',
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(6.0),
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.search),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 12.0,
                ),
                MenuButton(),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: <Widget>[
                Text(
                  'Mysteries & \nThrillers'.toUpperCase(),
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 32.0),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 60.0,
          ),
        ],
      ),
    );
  }
}

class MenuButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 20.0,
      height: 20.0,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            color: Colors.white,
            height: 2.0,
            width: 12.0,
          ),
          Container(
            color: Colors.white,
            height: 2.0,
          ),
          Row(
            children: <Widget>[
              SizedBox(
                width: 8.0,
              ),
              Container(
                color: Colors.white,
                height: 2.0,
                width: 12.0,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class Dots extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
            width: 8.0,
            height: 8.0,
            decoration: BoxDecoration(
              color: Colors.white30,
              shape: BoxShape.circle,
            ),
          ),
          Container(
            width: 8.0,
            height: 8.0,
            decoration: BoxDecoration(
              color: Colors.white30,
              shape: BoxShape.circle,
            ),
          ),
          Container(
            width: 8.0,
            height: 8.0,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
          ),
          Container(
            width: 8.0,
            height: 8.0,
            decoration: BoxDecoration(
              color: Colors.white30,
              shape: BoxShape.circle,
            ),
          ),
        ],
      ),
    );
  }
}
