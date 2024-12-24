---
layout: post
authors:
  - devcrypted
pin: false
video_prefix: https://youtu.be/
playlist_prefix: https://youtube.com/playlist?list=
github_prefix: https://github.com/devcrypted/
youtube_logo: <i class="fa-brands fa-youtube"></i>
published: false
title: Developer Ready Custom Windows 11 and WSL Setup
permalink: win11-setup
media_subpath: /assets/img
date: 2024-12-22 00:00 +0530
categories: ["Windows 11", "Desktop Setup", "WSL"]
tags: ["Windows 11", "Desktop Setup", "WSL"]
image: https://img.youtube.com/vi/randomVideoID/maxresdefault.jpg
description: Step-by-step guide to download, customize, and install Windows 11. Includes script links,
PowerShell commands, and bootable USB creation using Ventoy. Watch the video for detailed instructions!
video_id: randomVideoID
playlist_id: PL2JBbPWIA_Tq6oI8hAkJVR6Uhg5wLx9AM
github_repo: .dotfiles
---

> - [GitHub Repository]({{page.github_prefix}}{{page.github_repo}})
> - [Watch on YouTube]({{page.video_prefix}}{{page.video_id}})
> - [YouTube Playlist]({{page.playlist_prefix}}{{page.playlist_id}})

---

{% include embed/youtube.html id=page.video_id %}

---

<!-- Markdownlint-Disable MD025 -->

# Download Windows 11

1. [Click here](https://uupdump.net/get.php?id=ad27e52b-9e18-408a-9df2-8688e5273fbf&pack=en-us&edition=professional) to download Windows download scripts.
2. Unzip the downloaded file using following command (change path if required):

   ```powershell
   Expand-Archive -Path '~\Downloads\*en-us_professional*.zip' -DestinationPath 'win11_builder'
   ```

3. Go to the extracted folder `cd win11_builder`
4. Optional: Let's keep only required packages, open file `CustomAppsList.txt`

   > This file is responsible for installing the packages in your Windows 11. Uncomment the package names by removing `#` if you need that package.

5. Save the `CustomAppsList.txt` file and go back to terminal.
6. Run below command to use custom apps list file.

   ```powershell
   (Get-Content ConvertConfig.ini).Replace('CustomList   =0', 'CustomList   =1') `
   | Set-Content ConvertConfig.ini
   ```

---

# Create ISO File

Now we are ready, let's double-click on `uup_download_windows.cmd` file to start creating ISO file:

> It will prompt you for confirmation, please type `R` and hit enter. Now you need to wait for approx. 15-30 minutes to let it download and create ISO file for you.

---

# Install Windows 11

1. ❗Make sure you have external backup of your Laptop/computer where you're trying to install Windows.
2. Plug-in a pen-drive (minimum 8GB), download [Ventoy](https://www.ventoy.net/en/download.html) and install
   it on your pen-drive (don't worry, [Ventoy](https://www.ventoy.net/en/download.html) is very easy to install.
   Checkout [How to install Ventoy?](https://www.ventoy.net/en/doc_start.html))
3. Once you're done, find your pen-drive's drive letter in your file explorer. and paste your newly build ISO file from `win11_builder` folder.
4. Once copied, shut-down your computer.
5. When you're ready press power-on button of your computer and press F10, F12 or F2 based
   on your computer manufacture. Feel free to google `Asus laptop boot menu key` for your laptop brand.
6. You'll be prompted to use your pen-drive as boot device, select and hit enter.
7. Select, Windows 11 and proceed.
8. Now you can follow the prompts and continue installing Windows ([Watch my YouTube Video]({{page.video_prefix}}{{page.video_id}}))

---
