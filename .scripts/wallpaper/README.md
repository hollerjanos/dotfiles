# Wallpaper

### Introduction

This scripts can help you to change & load your wallpaper easily.

In the current stage all of the screens will be changed at once.

### Dependencies

**xwallpaper**

```
sudo apt install xwallpaper
```

### Startup

Create a filename called `.xprofile` in your home folder or edit if it alraedy exists.

Run the `load-current-wallpaper.sh` script if you want the oldest wallpaper the system had.

You can also run the `set-random-wallpaper.sh` script in order to have random wallpapers when you boot up in your system.

The choice is yours!

### Automation

You can automate the script by running them via cron.

Open your crontab by typing the following command in your terminal:

```
crontab -e
```

Add the following line to the end of the crontab:

```
*/15 * * * * (export DISPLAY=:0.0 && <SCRIPT_PATH>/set-random-wallpaper.sh)
```

Change `<SCRIPT_PATH>` with your path.

For example:

```
*/15 * * * * (export DISPLAY=:0.0 && ~/scripts/wallpaper/set-random-wallpaper.sh)
```

This will run the `set-random-wallpaper.sh` script in every 15 minutes.
- 0:00
- 0:15
- 0:30
- 0:45
- 1:00, etc.

Open up [crontab guru](https://crontab.guru), if you want to change that schedule.

### Gnome Display Manager (GDM) wallpaper

If you want to change the background of your GDM, I recommend the following repository:

[thiggy01/change-gdm-background](https://github.com/thiggy01/change-gdm-background)
