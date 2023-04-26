# flutter_flushbar

Use this package if you need more customization when notifying your user.

See the [install instructions](https://pub.dev/packages/flutter_flushbar/install).

## Quick reference

Since customization requires a lot of properties, here is a quick cheatsheet:

Property | What does it do
-------- | ---------------
title    | The title displayed to the user
titleColor    | The title color displayed to the user
titleSize    | The title size displayed to the user
message  | The message displayed to the user.
messageColor  | The message color displayed to the user.
messageSize  | The message size displayed to the user.
titleText | Replaces [title]. Although this accepts a [widget], **it is meant to receive [Text] or [RichText]**
messageText | Replaces [message]. Although this accepts a [widget], **it is meant to receive [Text] or  [RichText]**
icon | You can use any widget here, but I recommend [Icon] or [Image] as indication of what kind of message you are displaying. Other widgets may break the layout
shouldIconPulse | An option to animate the icon (if present). Defaults to true.
maxWidth | Used to limit Flushbar width (usually on large screens)
margin | Adds a custom margin to Flushbar
padding | Adds a custom padding to Flushbar. The default follows material design guide line
borderRadius | Adds a radius to specified corners of Flushbar. Best combined with [margin]. I do not recommend using it with [showProgressIndicator] or [leftBarIndicatorColor]
textDirection | [TextDirection.ltr] by default. [Directionality.of(context)] to know whether it would be [TextDirection.ltr] or [TextDirection.rtl]
borderColor | Adds a border to every side of Flushbar. I do not recommend using it with [showProgressIndicator] or [leftBarIndicatorColor]
borderWidth | Changes the width of the border if [borderColor] is specified
backgroundColor | Flushbar background color. Will be ignored if [backgroundGradient] is not null.
leftBarIndicatorColor | If not null, shows a left vertical bar to better indicate the humor of the notification. It is not possible to use it with a [Form] and I do not recommend using it with [LinearProgressIndicator].
backgroundGradient | Flushbar background gradient. Makes [backgroundColor] be ignored.
mainButton | Use if you need an action from the user. [FlatButton] is recommended here.
onTap | A callback that registers the user's click anywhere. An alternative to [mainButton]
duration | How long until Flushbar will hide itself (be dismissed). To make it indefinite, leave it null.
isDismissible | Determines if the user can swipe or click the overlay (if [routeBlur] > 0) to dismiss. It is recommended that you set [duration] != null if this is false. If the user swipes to dismiss or clicks the overlay, no value will be returned.
dismissDirection | FlushbarDismissDirection.VERTICAL by default. Can also be [FlushbarDismissDirection.HORIZONTAL] in which case both left and right dismiss are allowed.
flushbarPosition | Flushbar can be based on [FlushbarPosition.TOP] or on [FlushbarPosition.BOTTOM] of your screen. [FlushbarPosition.BOTTOM] is the default.
flushbarStyle | Flushbar can be floating or be grounded to the edge of the screen. If grounded, I do not recommend using [margin] or [borderRadius]. [FlushbarStyle.FLOATING] is the default
forwardAnimationCurve | The [Curve] animation used when show() is called. [Curves.easeOut] is default.
reverseAnimationCurve | The [Curve] animation used when dismiss() is called. [Curves.fastOutSlowIn] is default.
animationDuration | Use it to speed up or slow down the animation duration
showProgressIndicator | true if you want to show a [LinearProgressIndicator]. If [progressIndicatorController] is null, an infinite progress indicator will be shown
progressIndicatorController | An optional [AnimationController] when you want to control the progress of your [LinearProgressIndicator]. You are responsible for controlling the progress
progressIndicatorBackgroundColor | a [LinearProgressIndicator] configuration parameter.
progressIndicatorValueColor | a [LinearProgressIndicator] configuration parameter.
barBlur | Default is 0.0. If different than 0.0, blurs only Flushbar's background. To take effect, make sure your [backgroundColor] has some opacity. The greater the value, the greater the blur.
blockBackgroundInteraction | Determines if user can interact with the screen behind it. If this is false, [routeBlur] and [routeColor] will be ignored
routeBlur | Default is 0.0. If different than 0.0, creates a blurred overlay that prevents the user from interacting with the screen. The greater the value, the greater the blur. It does not take effect if [blockBackgroundInteraction] is false
routeColor | Default is [Colors.transparent]. Only takes effect if [routeBlur] > 0.0. Make sure you use a color with transparency e.g. `Colors.grey[600].withOpacity(0.2)`. It does not take effect if [blockBackgroundInteraction] is false
userInputForm | A [TextFormField] in case you want a simple user input. Every other widget is ignored if this is not null.
onStatusChanged | a callback for you to listen to the different Flushbar status

#### Quick tip

If you use a lot of those properties, it makes sense to make a factory to help with  your Flushbar's base appearance.
Things like shadows, padding, margins, text styles usually don't change within the app. Take a look at FlushbarHelper class and use it as an example.

## Getting Started

The examples bellow were updated for version 1.3.0. Changes might have been made. See the [changelog](CHANGELOG.md) if any of the examples do not
reflect Flushbar's current state.


### A basic Flushbar

The most basic Flushbar uses only a message. Failing to provide it before you call `show()` will result in a runtime error.
`Duration`, if not provided, will create an infinite Flushbar, only dismissible by code, back button clicks, or a drag (case `isDismissible` is set to `true`).

- Note that only `message` is a required parameter. All the other ones are optional

```dart
class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              onPressed: () {
                Flushbar(
                  flushbarPosition: FlushbarPosition.TOP,
                  backgroundColor: Colors.red,
                  duration: Duration(seconds: 3),
                  titleText: Text(
                    "Oops, No Internet Connection",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                        color: Colors.white,
                        fontFamily: "ShadowsIntoLightTwo"),
                  ),
                  messageText: Text(
                    "Make sure wifi or cellular data is turned on and then try again.",
                    style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.white,
                        fontFamily: "ShadowsIntoLightTwo"),
                  ),
                )..show(context);
              },
              child: Text("Show Flushbar"),
            ),
          ],
        ),
      ),
    );
  }
}
```

### Flushbar position

Flushbar can be at `FlushbarPosition.BOTTOM` or `FlushbarPosition.TOP`.

```dart
Flushbar(
  flushbarPosition: FlushbarPosition.TOP,
  title: "Oops, No Internet Connection",
  message: "Make sure wifi or cellular data is turned on and then try again.",)..show(context);
```



### Duration and dismiss policy

By default, Flushbar is infinite. To set a duration, use the `duration` property.
By default, Flushbar is dismissible by the user. A right or left drag will dismiss it.
Set `isDismissible` to `false` to change this behaviour.

```dart
Flushbar(
  title: "Oops, No Internet Connection",
  message: "Make sure wifi or cellular data is turned on and then try again.",
  duration: Duration(seconds: 3),
  isDismissible: false,
)..show(context);
```

### Show and dismiss animation curves

You can set custom animation curves using `forwardAnimationCurve` and `reverseAnimationCurve`.

```dart
Flushbar(
  forwardAnimationCurve: Curves.decelerate,
  reverseAnimationCurve: Curves.easeOut,
  title: "Oops, No Internet Connection",
  message: "Make sure wifi or cellular data is turned on and then try again.",
)..show(context);
```
