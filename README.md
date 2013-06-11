# Lightstreamer StockList Demo Client for BlackBerry AIR #

This demo shows how to use the Lightstreamer Flex Client library and the [BlackBerry 10 SDK for Adobe AIR](http://developer.blackberry.com/air/) to create a simple streaming-enabled application.

Real-Time simulated Stock-List data is received from the Lightstreamer Server deployed @ [http://push.lightstreamer.com](http://push.lightstreamer.com)

## Build and Run ##

Prepare the BlackBerry 10 environment as described on [their documentation site](http://developer.blackberry.com/air/documentation/bb10/install_the_ph_platform_blackber_2006017.html).
Namely:
*   Download and install the [Adobe Flex SDK 4.5](http://opensource.adobe.com/wiki/display/flexsdk/Downloads) or later.
*   Download and install the [BlackBerry 10 SDK for Adobe AIR](https://developer.blackberry.com/air/download/)
*   Download and install [VMware Player](http://www.vmware.com/products/player/) for Windows or [VMware Fusion](http://www.vmware.com/products/fusion/overview.html) for Mac.
*   Download and install the [BlackBerry 10 Simulator](https://developer.blackberry.com/devzone/develop/simulator/simulator_installing.html)

Keep track of the location of the BlackBerry 10 SDK for Adobe AIR as it will be needed soon.

Download the [Lightstreamer distribution](http://www.lightstreamer.com/download) and copy the Lightstreamer_as_client.swc file from the Lightstreamer Flex Client SDK (that is located under the DOCS-SDKs/sdk_client_flex/lib folder) into the lib folder of this project.

### Build ###

Being $BB the folder where your BlackBerry 10 SDK for Adobe AIR was installed run

```
$BB/bin/amxmlc -library-path+=lib/Lightstreamer_as_client.swc -source-path=src -output=StockListDemo.swf -- src/stocklistdemo/StockListDemo.as
```

a new StockListDemo.swf file will be created containing your air application 

### Package and Run ###

Start the BlackBerry 10 Simulator and note the IP address it is assigned (check the bottom-left of the window the simulator is in)

Being $BB the folder where your BlackBerry 10 SDK for Adobe AIR was installed and $IP the IP address of the simulator run

```
$BB/bin/blackberry-airpackager -package StockListDemo.bar -installApp -launchApp -device $IP -forceAirVersion 3.1 -ane $BB\frameworks\libs\qnx\ane\QNXSkins.ane StockListDemo-app.xml bar-descriptor.xml StockListDemo.swf icon_image.png
```

A new StockListDemo.bar file will be created and deployed on the simulator. Note that the application will also be automatically launched.

## See Also ##

*   [Lightstreamer StockList Demo Adapter](https://github.com/Weswit/Lightstreamer-example-Stocklist-adapter-java)
*   [Lightstreamer Reusable Metadata Adapter in Java](https://github.com/Weswit/Lightstreamer-example-ReusableMetadata-adapter-java)

## Lightstreamer Compatibility Notes ##

- Compatible with Lightstreamer Flex Client library version 2.1 or newer.