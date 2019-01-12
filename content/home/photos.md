+++
# Custom widget.
# An example of using the custom widget to create your own homepage section.
# To create more sections, duplicate this file and edit the values below as desired.
widget = "custom"
active = true
date = 2019-01-12T00:00:00

# Note: a full width section format can be enabled by commenting out the `title` and `subtitle` with a `#`.
title = "Photos"
subtitle = "<a href=\"photos/\">See all photos »</a>"

# Order that this section will appear in.
weight = 20

+++

{{< gallery >}}
{{< figure link="/img/featured1.jpg" caption="Featured photo 1" >}}
{{< figure link="/img/featured2.jpg" caption="Featured photo 2" >}}
{{< figure link="/img/featured3.jpg" caption="Featured photo 3" >}}
{{< /gallery >}}
{{< load-photoswipe >}}

There's more,  [**see all photos**](/photos)!
