# fw-fanctrl runit files

## Description

[fw-fanctrl](https://github.com/TamtamHero/fw-fanctrl) is a simple Python CLI service that controls Framework Laptop's fan(s) speed according to a configurable speed/temperature curve. It's compatible with all 13" and 16" models, both AMD/Intel CPU's, with or without discrete GPU. This nice program was written for systems with `systemd` in mind. Here you will _only_ find the files needed for running it on a [runit](https://smarden.org/runit) based system, _not_ the actual program, you must install that seperately. Below steps describe the installation on [Void Linux](https://voidlinux.org/), but it should work on any `runit` based systen: location of runit service files can be different on your distribution: keep that in mind when istalling the files in this repository.

## Installation on Void Linux
1. Install depencencies: `python3-pip`, `python3-pipx`, `python3-build`, `python3-unzip`.
2. Follow instructions in [fw-fanctrl](https://github.com/TamtamHero/fw-fanctrl) and clone that (fw-fanctrl) repository.
3. Install fw-fanctrl with the following command:
```
sudo ./install.sh --pipx --prefix-dir "/usr/local" --effective-installation-dir "/usr/local/bin" --no-post-install
```
- The executables (`ectool` and `fw-fanctrl`) are now in `/usr/local/bin`.
- `fw-fanctrl` is actually a symlink to the python program located in a _venv_ in `/opt/pipx` (or wherever your pipx stuff is on your distribution).
- There are some `systemd` files installed in `/usr/local/lib/systemd`, we can ignore these.
- There will be an error about the `systemctl` command that cannot be found: **ignore it**, we will fix that below.

4. Clone _this_ (fw-fanctrl-runit-files) repository.
5. Install the 2 files in this repo on their exact location as in this repo (`/etc/sv`). If you are _not_ running Void Linux the location of the service files can be different, check the documentation of your distribution. **The files should be executable**, do a `chmod +x run` or `chmod +x finish` if needed, but this shouldn't be necessary if you cloned the repository.
6. Enable the service on Void Linux (command/locations can be differfent on your distrubution):
```
sudo ln -s /etc/sv/fw-fanctrl /var/service
```
- Check if it's running with
```
sudo sv status fw-fanctrl
````

## Control and configuration
The service can be controlled according to the documentation in [fw-fanctrl](https://github.com/TamtamHero/fw-fanctrl).  
The main config file is in `/etc/fw-fanctrl/config.json`.  
Reload the service by doing: `sudo sv restart fw-fanctrl` or by issuing `fw-fanctrl reload`.  
See the status with `fw-fanctrl print all`
