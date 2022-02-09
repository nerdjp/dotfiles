#!/bin/sh

torrents=$(transmission-remote -l)

echo  $(echo "$torrents" | grep Downloads | wc -l)  $(echo "$torrents" | grep Seeding | wc -l)  $(echo "$torrents" | grep Idle | wc -l)
