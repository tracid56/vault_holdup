# Vault Robberies
A script for robbing the vaults on your server.

### Dependencies
- [ESX_Policejob](https://github.com/ESX-Org/esx_policejob)
- [Safe_Holdup](https://github.com/x0Z3ro0x/safe_holdup)
- [Teller_Holdup](https://github.com/x0Z3ro0x/teller_holdup)
- [esx_borrmaskin](https://github.com/Vanheden/esx_borrmaskin)   <-- ONLY IF YOU WANT JACKHAMMER ANIMATION WHILE ROBBING

### Installation
- Clone or Download
- Place anywhere inside your resource folder
- Add
```
start vault_holdup
```
to your server.cfg file

### Editing Times & Payouts
Editing both the timers and payouts is extremely easy and done from the config file. If you wish to change the timer to a set time every time vs a random time between ranges, change:

```
secondsRemaining = math.random(NUMBER,NUMBER),
```

to

```
secondsRemaining = NUMBER,
```

Otherwise just change the numbers inside the math.random(). If you wish to change the payouts to a set payout vs a random amount between a range, then change:

```
reward = math.random(NUMBER,NUMBER),
```

to

```
reward = NUMBER,
```

Otherwise just change the numbers inside the math.random().

### Credits
Original code comes from [ESX_Holdup](https://github.com/ESX-Org/esx_holdup) posted by ESX-Org. The existing code has been altered and changed to better fit a wider range of robberies, options, and locations. In addition timers have been changed to a random amount. Meant to be used with Teller_Holdup and Safe_Holdup providing the ultimate control over robberies on your server and over-all enhancing the robbery experience.  
