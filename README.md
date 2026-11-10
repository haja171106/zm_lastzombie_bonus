# ZM Last Zombie Bonus

A Plutonium T6 mod for **Call of Duty: Black Ops II – Zombies**.

## What it does

At the end of every round, the **last zombie killed** drops two power-ups at the spot where it died:

- **Max Ammo**
- **Carpenter**

The two power-ups are spawned side by side so they do not overlap.

## Requirements

- Call of Duty: Black Ops II (Zombies) running on [Plutonium](https://plutonium.pw/)

## Installation

1. Copy `zm_lastzombie_bonus.gsc` into your Plutonium scripts folder:

   ```
   %localappdata%\Plutonium\storage\t6\scripts\zm\
   ```

   Create the `scripts\zm` folders if they do not exist yet.

2. Launch a Zombies game (solo or custom). The script loads automatically on every Zombies map.

## Usage

There is nothing to configure. Play normally: when only one zombie is left in a round, kill it and pick up the Max Ammo and Carpenter that drop.

## Notes

- On dog rounds, the last dog also drops both power-ups.
- Carpenter drops even if no windows or barriers are damaged.
- If nothing drops, check the Plutonium console for script errors.

## Uninstall

Delete `zm_lastzombie_bonus.gsc` from the `scripts\zm\` folder.