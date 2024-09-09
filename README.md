# wallpaper_scheduler
A bash script that automatically changes between wallpapers based on the time of day

At startup it gets the current time and changes the wallpaper to match, then calculates how much time is left until the next time it has to change wallpapers, then "sleeps" all the way up until the calculated time is out, then "wakes up" just in time to change the wallpaper, calculates how much time it has to sleep until the next wallpaperchange and the cycle repeats.
