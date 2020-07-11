# Tools

This directory contains different tools that I use in my _workflow_ on my Linux machines.

## album-dl

This tool is used for getting albums off of yt. It can be used for getting singles or whole albums. For a single just use `album-dl <yt-link>` and for an album `album-dl <yt-link> time-stamps-file band-name`. Note that you should use it in a new directory or at least don't have any mp3's in the current directory. This will be worked on soon(TM).

An example of a time-stamps-file. This file is used for splitting the album into the individual tracks. Each line is comprised of a start time, and end time and the name of the track. With the times being the start and stop times in the overall video. Times are H:MM:SS and track name needs to be one word, with at least one space between the categories.
```
0:00:00 0:01:06 the_order
0:01:07 0:05:06 satellite
```

## TODO

metadata-editor
