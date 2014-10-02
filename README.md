# Lightstreamer - Basic Stock-List Demo - BlackBerry (AIR) Client

<!-- START DESCRIPTION lightstreamer-example-stocklist-client-blackberry10-air -->

This demo shows how to use the <b>Lightstreamer Flex Client library</b> and the [BlackBerry 10 SDK for Adobe AIR](http://developer.blackberry.com/air/) to create a simple streaming-enabled application.

![screenshot](screenshot.png)

## Details

Real-Time simulated Stock-List data is received from the Lightstreamer Server deployed @ [http://push.lightstreamer.com](http://push.lightstreamer.com)
<!-- END DESCRIPTION lightstreamer-example-stocklist-client-blackberry10-air -->

## Build

There are different ways to compile and run an AIR application for BlackBerry 10. This README will focus on the use of the command line tools. Feel free to check the [other possibilities](http://developer.blackberry.com/air/)

Prepare the BlackBerry 10 environment as described on [their documentation site](http://developer.blackberry.com/air/documentation/bb10/install_the_ph_platform_blackber_2006017.html).
Namely:
*   Download and install the [Adobe Flex SDK 4.5](http://opensource.adobe.com/wiki/display/flexsdk/Downloads) or later.
*   Download and install the [BlackBerry 10 SDK for Adobe AIR](https://developer.blackberry.com/air/download/)
*   Download and install [VMware Player](http://www.vmware.com/products/player/) for Windows or [VMware Fusion](http://www.vmware.com/products/fusion/overview.html) for Mac.
*   Download and install the [BlackBerry 10 Simulator](https://developer.blackberry.com/devzone/develop/simulator/simulator_installing.html)

Keep track of the location of the BlackBerry 10 SDK for Adobe AIR as it will be needed soon.

Download the [Lightstreamer distribution](http://www.lightstreamer.com/download) and copy the `Lightstreamer_as_client.swc` file from the Lightstreamer Flex Client SDK (that is located under the `DOCS-SDKs/sdk_client_flex/lib` folder) into the `lib` folder of this project.

Being $BB the folder where your BlackBerry 10 SDK for Adobe AIR was installed, run

```
$BB/bin/amxmlc -library-path+=lib/Lightstreamer_as_client.swc -source-path=src -output=StockListDemo.swf -- src/stocklistdemo/StockListDemo.as
```

a new `StockListDemo.swf` file will be created containing your air application 

### Package and Run

Start the BlackBerry 10 Simulator and take note of the IP address (check the bottom-left of the window the simulator is in)

Being $BB the folder where your BlackBerry 10 SDK for Adobe AIR was installed and $IP the IP address of the simulator, run

```
$BB/bin/blackberry-airpackager -package StockListDemo.bar -installApp -launchApp -device $IP -forceAirVersion 3.1 -ane $BB\frameworks\libs\qnx\ane\QNXSkins.ane StockListDemo-app.xml bar-descriptor.xml StockListDemo.swf icon_image.png logo.png
```

A new `StockListDemo.bar` file will be created and deployed on the simulator. Note that the application will also be automatically launched.

## See Also

*   [Lightstreamer Flex Client API Reference](http://www.lightstreamer.com/docs/client_flex_api/index.html)

### Lightstreamer Adapters Needed by This Demo Client
<!-- START RELATED_ENTRIES -->

*   [Lightstreamer - Stock-List Demo - Java Adapter](https://github.com/Weswit/Lightstreamer-example-Stocklist-adapter-java)
*   [Lightstreamer - Reusable Metadata Adapter- Java Adapter](https://github.com/Weswit/Lightstreamer-example-ReusableMetadata-adapter-java)

<!-- END RELATED_ENTRIES -->
## Lightstreamer Compatibility Notes

*   Compatible with Lightstreamer Flex Client library version 2.1 or newer.
*   For Lightstreamer Allegro (+ Flex Client API support), Presto, Vivace. Drop here Lightstreamer_as_client.swc from the Lightstreamer Flex Client Library# Lightstreamer - Basic Stock-List Demo - BlackBerry (Android Runtime) Client

<!-- START DESCRIPTION lightstreamer-example-stocklist-client-blackberry10-android -->

This project contains a simple stocklist demo application showing integration between the <b>BlackBerry 10 Android Runtime</b> and the <b>Lightstreamer Android Client</b>.

![screenshot](screen_bba_large.png)

## Details

This demo reuses the sources of the [Lightstreamer - Basic Stock-List Demo - Android Client](https://github.com/Weswit/Lightstreamer-example-StockList-client-android) and thus, this project has no sources nor resources excluding this README file.

Real-Time simulated Stock-List data is received from the Lightstreamer Server deployed @ [http://push.lightstreamer.com](http://push.lightstreamer.com)
<!-- END DESCRIPTION lightstreamer-example-stocklist-client-blackberry10-android -->

## Build

There are different ways to compile and convert an Android application to run on BlackBerry 10. This README will focus on the use of the command line tools. Feel free to check the [other possibilities](http://developer.blackberry.com/android/)

*   Download and install the [Command-line tools for Android apps](http://developer.blackberry.com/android/tools/) (scroll down a little to find them)
*   Download and install [VMware Player](http://www.vmware.com/products/player/) for Windows or [VMware Fusion](http://www.vmware.com/products/fusion/overview.html) for Mac.
*   Download and install the [BlackBerry 10 Simulator](https://developer.blackberry.com/devzone/develop/simulator/simulator_installing.html)
*   Obtain the apk file for [Lightstreamer - Basic Stock-List Demo - Android Client](https://github.com/Weswit/Lightstreamer-example-StockList-client-android) and copy it into this project.

Once ready, position the command-line to this project folder.

Being $BB_HOME the folder where you installed the command line tools and $ANDROID_HOME the folder where your Android SDK installation is, run
```
$BB_HOME/bin/apk2bar Android_StockListDemo_Basic.apk $ANDROID_HOME
```
An `Android_StockListDemo_Basic.bar` file will be generated contained the re-packaged app. You'll also find a `Android_StockListDemo_Basic.wrn` file containing the conversion log.

### Run the Demo

Start the BlackBerry 10 Simulator and take note of the IP address (check the bottom-left of the window the simulator is in)

Being $BB_HOME the folder where you installed the command line tools and $IP the IP address of the simulator, run
```
$BB_HOME/bin/blackberry-deploy -installApp $IP Android_StockListDemo_Basic.bar
```
The app icon will appear on the simulator home screen.

## See Also

*   [Lightstreamer Android Client API reference](http://www.lightstreamer.com/docs/client_android_api/index.html)

### Lightstreamer Adapters Needed by This Demo Client
<!-- START RELATED_ENTRIES -->

*   [Lightstreamer - Stock-List Demo - Java Adapter](https://github.com/Weswit/Lightstreamer-example-Stocklist-adapter-java)
*   [Lightstreamer - Reusable Metadata Adapters - Java Adapter](https://github.com/Weswit/Lightstreamer-example-ReusableMetadata-adapter-java)

<!-- END RELATED_ENTRIES -->

## Lightstreamer Compatibility Notes

*   Compatible with Lightstreamer Android Client library version 2.1 or newer.
*   For Lightstreamer Allegro (+ Android Client API support), Presto, Vivace.
