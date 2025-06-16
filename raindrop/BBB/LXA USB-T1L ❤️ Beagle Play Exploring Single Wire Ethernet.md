---
raindrop_id: 1172090518

---

# Metadata
Source URL:: https://pengutronix.de/en/blog/2023-08-07-lxa-t1l-beagle-play.html


---
# LXA USB-T1L ❤️ Beagle Play: Exploring Single Wire Ethernet

It seems everybody is talking about Single Pair Ethernet (SPE) these days.
So we want to follow the trend and do the same :-)
SPE is a class of Ethernet transmission standards that uses just a single pair of twisted pair cable for data
transmission.
There are multiple SPE variants spanning maximum data rates from a hand full MBit/s
to multiple GBit/s and cable lengths from a hand full of meters to kilometers.
The most interesting ones from our embedded-centric point of view are 10Base-T1L (point-to-point, up to 1 km),
10Base-T1S (multidrop, approx. 10 m) and 100Base-T1 (point-to-point, 15 m).
The new Beagle Play comes with a 10Base-T1L PHY.
This makes it a great peer to experiment with our
Linux Automation USB-T1L.
In this post we will explore the possibilities of 10Base-T1L on a recent Linux system.

## Highlights
