+++
# Custom widget.
# An example of using the custom widget to create your own homepage section.
# To create more sections, duplicate this file and edit the values below as desired.
widget = "custom"
active = true
date = 2016-04-20T00:00:00

# Note: a full width section format can be enabled by commenting out the `title` and `subtitle` with a `#`.
title = "Photos"
subtitle = ""

# Order that this section will appear in.
weight = 20

+++

{{< load-photoswipe >}}
{{< gallery >}}
{{< figure link="/img/featured1.jpg" caption="" >}}
{{< figure link="/img/featured2.jpg" caption="" >}}
{{< figure link="/img/featured3.jpg" caption="" >}}
{{< /gallery >}}

[**Click here to see all photos!**](/photos)