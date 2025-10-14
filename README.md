# GLIAL (Geode Linux Instantiating/Attaching Logger)
Pretty much just this ^

> [!TIP]
> These scripts use _log files_ for providing logs, so make sure to set your log level to `DEBUG` for files in Geode's settings for detailed logs!

# Features
- Color support
- Scripts to open GD _tied to the terminal process_ or _attach to GD arbitrarily_, **without** affecting the process itself (meaning you can terminate/reattach the log whenever you want)
- NO Wine/Proton shenanigans needed! If you can run GD via Steam - you can run GLIAL

# Installation & Configuration
**Requirements**:
- Bash

**Optional**:
- ["multi-command" VS Code extension](https://marketplace.visualstudio.com/items?itemName=ryuta46.multi-command)

---

Clone the repo somewhere or download scripts from [releases](https://github.com/Fryy55/glial/releases)/directly.

> [!IMPORTANT]
> You need to edit some of the scripts before you can work with GLIAL.
> Open `.functions.sh` with your preferred text editor and replace the `logs_dir` directory with Geode's logs directory on your machine.
> Keep in mind, that for GLIAL to work _all scripts must be in the same directory_!

# Usage
Run the `start-integrated.sh` script for starting GD attached to the terminal or run `attach-log.sh` to attach to an already running instance of GD. If no instances exist, `attach-log.sh` will quit instantly.

## Visual Studio Code
You can integrate scripts into VS Code nicely by adding keybinds like these to your `keybinds.json`:
```
{
    "key": "numpad5",
    "command": "workbench.action.terminal.sendSequence",
    "args": { "text": "'/mnt/sdb1/SteamLibrary/steamapps/common/Geometry Dash/.glial/start-integrated.sh'\u000D" }
},
{
    "key": "numpad8",
    "command": "workbench.action.terminal.sendSequence",
    "args": { "text": "'/mnt/sdb1/SteamLibrary/steamapps/common/Geometry Dash/.glial/attach-log.sh'\u000D" }
}
```
Replace keybinds/paths accordingly. `\u000D` is Unicode for `Enter`, which automatically sends the command.

### Using "multi-command"
With the help of the extension you can extend these keybinds to focus your terminal for better startup communication:

```
{
    "key": "numpad5",
    "command": "extension.multiCommand.execute",
    "args": {
        "sequence": [
            "workbench.action.terminal.focus",
            {
                "command": "workbench.action.terminal.sendSequence",
                "args": {
                    "text": "'/mnt/sdb1/SteamLibrary/steamapps/common/Geometry Dash/.glial/start-integrated.sh'\u000D"
                }
            }
        ]
    }
},
{
    "key": "numpad8",
    "command": "extension.multiCommand.execute",
    "args": {
        "sequence": [
            "workbench.action.terminal.focus",
            {
                "command": "workbench.action.terminal.sendSequence",
                "args": {
                    "text": "'/mnt/sdb1/SteamLibrary/steamapps/common/Geometry Dash/.glial/attach-log.sh'\u000D"
                }
            }
        ]
    }
}
```

Once again, **replace script paths** to match your installation directory.

# Trivia
**Glia**, also called **glial** cells (**gliocytes**) or **neuroglia**, are non-neuronal cells in the central nervous system (the brain and the spinal cord) and in the peripheral nervous system that do not produce electrical impulses. [Wikipedia](https://en.wikipedia.org/wiki/Glia#:~:text=Glia%2C%20also%20called%20glial%20cells%20(gliocytes)%20or%20neuroglia%2C%20are%20non%2Dneuronal%20cells%20in%20the%20central%20nervous%20system%20(the%20brain%20and%20the%20spinal%20cord)%20and%20in%20the%20peripheral%20nervous%20system%20that%20do%20not%20produce%20electrical%20impulses.)

# License
This project is distributed under the **MIT License**.

See `LICENSE` for permissions, conditions and limitations.
