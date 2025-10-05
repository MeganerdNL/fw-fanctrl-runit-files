# fw-fanctrl runit files

## Description

[fw-fanctrl](https://github.com/TamtamHero/fw-fanctrl) is a simple Python CLI service that controls Framework Laptop's fan(s) speed according to a configurable speed/temperature curve. This is was written for systems with `systemd` in mind. Here you find the files needed for running it successfully on a `runit` based system. In this sepcific case [Void Linux](https://voidlinux.org/), but location of runit service files can vary, based on distribution: keep that in mind when istalling the files in this repository.

## Installation on Void Linux
1. Install depencencies: `python3-pip`, `python3-pipx`, `python3-build`, `python3-unzip`.
2. Follow instructions in [fw-fanctrl](https://github.com/TamtamHero/fw-fanctrl) and clone their repo
3. Install fw-fanctrl:
```
sudo ./install.sh --pipx --prefix-dir "/usr/local" --effective-installation-dir "/usr/local/bin" --no-post-install
```
   The executables (`ectool` and `fw-fanctrl`) are now in `/usr/local/bin`. `fw-fanctrl` is actually a symlink to the python program located somewhere in `/opt/pipx`.
   
5. Install the files in this repo on their exact location as in this repo. If you are not running Void Linux the location of the service files could vary, check the documentation of your distribution. **The files should be executable**, `chmod +x` if needed.
6. Enable the service, on Void Linux (can very on your distrubution):
```
sudo ln -s /etc/service/fw-fanctrl /var/service
```
The service can be controlled according to the documentation in [fw-fanctrl](https://github.com/TamtamHero/fw-fanctrl).
The main config file is in `/etc/fw-fanctrl/config.json`.
Reload the service by doing: `sudo sv restart fw-fanctrl` or by issuing `fw-fanctrl reload`.
