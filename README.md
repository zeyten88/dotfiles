<img alt="Static Badge" src="https://img.shields.io/badge/Dotfiles-black?logo=archlinux&logoSize=auto">

<h1 align="center"><img src="https://github.com/user-attachments/assets/65766207-72ff-4373-9d14-0403dec7e37c">Arch Dots - Made by zeyten</h1>
<p align="center">My dotfiles for daily use on desktops. pzdr benc</p>


<h1 align="center">Installation and notes</h1>
<h2> 📋 Description </h2>
<ul>
    <li><b>OS:</b> Arch Linux</li>
    <li><b>Window Manager:</b> hyprland, i3wm, swayFX</li>
    <li><b>Bar:</b> polybar, waybar</li>
    <li><b>Launcher:</b> rofi, wofi</li>
    <li><b>Terminal:</b> Alacritty</li>
    <li><b>IDE:</b> Neovim</li>
    <li><b>File Manager:</b> Nautilus, Yazi</li>
</ul>

<h2> ⬇️ Dependencies </h2>
<h4> Hyprland dependencies</h4>

```
sudo pacman -Syu hyprland hyprlock hypridle swww waybar wofi alacritty pipewire wireplumber nautilus slurp grim nm-applet nerd-fonts ttf-nerdfonts starship
```

```
yay -S nwg-look wlogout catnap
```

<h4>i3wm dependencies</h4>

```
sudo pacman -Syu i3wm polybar pipewire wireplumber rofi nemo blueman-applet nm-applet feh flameshot pavucontrol rust cmake cargo htop cava alacritty ttf-nerd-fonts-symbols nerd-fonts
```

```
yay -s wal autotiling catnap open-fprintd python-validity fprintd-clients-git i3lock-fancy-git
```
<h4> sway dependencies </h4>

```
sudo pacman -Syu nautilus pipewire wireplumber waybar nerd-fonts ttf-nerd-fonts-symbols swayfx sway grim slurp
```
```
yay -S catnap yazi swaylock-fancy swappy
```
<h1 align="center"> 📷 Gallery </h1><br>

<h2 align="center">Hyprland </h2>
<img src ="https://github.com/user-attachments/assets/a7c852f2-9d75-4d6c-ae2a-0d55a43b6e9b"></img>
<img src ="https://github.com/user-attachments/assets/94e7eb19-1590-4f15-87dc-46fd966e62a5"</img>



<h2 align="center">i3-wm</h2> <br>
<img src="https://github.com/user-attachments/assets/987df2de-6f1b-46bd-92c3-1ff018e7f53e"></img>

<h2 align="center">swayFX</h2> <br>
<img src="https://github.com/user-attachments/assets/d9726ca1-8a8e-48b2-bea4-2b9e21a75895"</img>
<img src="https://github.com/user-attachments/assets/fc05be00-8a4e-4b3f-a7d9-6f6fd7b8a558"></img>

<h2 align="center"> Neovim </h2>
⚠️ Needs ttf-nerdfonts and multiple npm packages to function

```
sudo npm install -g vscode-langservers-extracted typescript-language-server
```
Just simply launch ./install.sh and it should automatically copy files to their needed directories.

