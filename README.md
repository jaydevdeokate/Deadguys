# 🧟‍♂️ Deadguys - Termux Zombie Survival Game (Offline, Bash-Based)

**Deadguys** is an offline ASCII zombie survival game made entirely in Bash — created and tested on a low-end Android J2 Core using Termux.  
Survive the apocalypse by throwing dustbins at incoming zombies inside your terminal.

![Made in Termux](https://img.shields.io/badge/Made%20in-Termux-00aa00?style=flat&logo=gnu-bash)
![Offline Game](https://img.shields.io/badge/Plays-Offline-informational)
![Shell Game](https://img.shields.io/badge/Language-Bash-blue)

---

## 🎮 Gameplay

- Play as **Bob**, a survivor inside a zombie-infested lab.
- Throw dustbins at zombies and survive 90 turns until rescue.
- Inspired by retro Pico-8 mechanics.
- 100% offline and works without graphics.

---

## 🕹️ Controls

| Key | Action          |
|-----|-----------------|
| `W` | Move Up         |
| `S` | Move Down       |
| `A` | Move Left       |
| `D` | Move Right      |
| `F` | Throw Dustbin   |
| `Q` | Quit Game       |

---

## 🗣️ Sound Support (Optional)

- 🔔 Terminal beep (when throwing, killing, taking hit)
- 🔊 `termux-media-player` support for mp3/ogg effects (optional)
- 💡 Plan to include sounds like:
  - `hit.mp3` for dustbin throw
  - `groan.mp3` for zombie death
  - `damage.mp3` for Bob taking damage

---

## ⚙️ Installation (In Termux)

1. Allow Termux storage access:
   ```bash
   termux-setup-storage
   ```

2. Download the game:
   ```bash
   curl -fL -o zombie.sh https://raw.githubusercontent.com/A220HZ/deadguys/master/zombie.sh
   ```

3. Run it:
   ```bash
   bash zombie.sh
   ```

---

## 📦 Requirements

- ✅ Termux
- ✅ Bash shell
- 🚫 No Python, Lua, or internet needed
- 🎧 Optional: `pkg install termux-api` to enable audio playback

---

## 🚧 Roadmap

- [x] Base game working
- [ ] Visible dustbin movement
- [ ] Game restart after death
- [ ] Zombie kill score system
- [ ] Terminal beep sound
- [ ] `termux-media-player` support
- [ ] `.deb` install package for one-click install

---

## 💡 Dev Info

- Built on **Samsung J2 Core**
- Written in **Bash only**
- Developed inside **Termux**
- Git-pushed via CLI using GitHub token

---

## 👑 Credits

Made with focus and dustbins by [@jaydevdeokate](https://github.com/A220HZ)

---

## 💬 Share the Terminal Legend

You survived zombies...
> Not on Unity. Not in JavaScript.  
> But in **Bash on a phone terminal**. 💀
