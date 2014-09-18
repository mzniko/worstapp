# Mobile Demo Apps

Widely distributed demo apps for Mobile APM

https://source.datanerd.us/mobile/mobile-demo-apps


## iOS

To build the iOS mobile demo app you will need cocoapods.

http://guides.cocoapods.org/using/getting-started.html

After that, install referenced pods...

    $ cd iOS
    $ pod install

And ensure you are working from the pod-generated workspace, not the project.

    $ open MobileDemo.xcworkspace

This project contains an embedded version of the New Relic SDK, version 4.55.
This version will be replaced with a Pod reference once SDK version 4 is GA.

Have fun!


## Contributing

Jonathan Karon (jkaron@newrelic.com) is the maintainer of this repo.

There are currently no style guidelines.

If you have suggestions or code contributions that you think would materially
improve the content of this demo app, say hi in HipChat or email, or open a
pull request @mentioning jkaron.

Thanks!
