# Battery

### Introduction

The following script is going to notify the user about the battery capacity.

The script will display a notification box with the help of `notify-send`.

Notifications will only be display if the battery capacity is:
- 100% & Charging (Full)
- \>=85% & Charging (Almost full)
- <=25% & Not charging (Low)
- <=5% & Not charging (Very low)

If the battery capacity is in the `Very low` status,
there will be a diffrerent notification box, to catch the user's attention.

---

### Dependencies

##### Notification daemon
```
sudo apt install dunst
```

##### Notification sender

```
sudo apt install libnotify-bin
```
