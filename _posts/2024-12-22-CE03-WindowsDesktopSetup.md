---
layout: post
authors: ["devcrypted"]
pin: false
video_prefix: https://youtu.be/
playlist_prefix: https://youtube.com/playlist?list=
github_prefix: https://github.com/aworkaround/
published: true
title: Configure Windows 11 (with WSL) as a PRO
permalink: desktop-setup
media_subpath: /assets/img
date: 2024-12-22 00:00 +0530
categories: ["Windows 11", "Desktop Setup", "WSL"]
tags: ["Windows 11", "Desktop Setup", "WSL"]
image: headers/desktop-setup.png
description: This blog will help you to configure your Windows 11 and WSL without having to manually do a lot of things. We have scripts for setting Windows 11 and WSL. Please follow the document.
video_id: randomVideoID
playlist_id: PL2JBbPWIA_Tq6oI8hAkJVR6Uhg5wLx9AM
github_repo: dotfiles
---

> - [GitHub Repository]({{page.github_prefix}}{{page.github_repo}})
> - [Watch on YouTube]({{page.video_prefix}}{{page.video_id}})
> - [YouTube Playlist]({{page.playlist_prefix}}{{page.playlist_id}})

---

{% include embed/youtube.html id=page.video_id %}

---
<!-- markdownlint-disable MD025 -->

> ❗Caution: Not recommended to be used on existing configured devices. This is tested in Windows 10, 11, Ubuntu 20.04 and higher versions 🙌

# GETTING STARTED

## PREREQUISITES TO BE INSTALLED / GOOD TO HAVE

1. Install Windows updates
2. Install optional updates
3. Install `Winget-AutoUpdate-aaS` package from Microsoft Store
4. Install `PowerShell` package from Microsoft Store.

## INSTALL AND CONFIGURE WINDOWS 10 OR 11

### Install Apps **[Launch PowerShell Core as Administrator]**

```powershell
. { iwr -useb 'xiii.in/pswinget' } | iex;

```

### Install WSL **[Launch Windows PowerShell as Administrator]**

```powershell
. { iwr -useb 'xiii.in/pswsl' } | iex;

```

## INSTALL AND CONFIGURE UBUNTU WSL

1. Go to [my dotfiles](https://github.com/aworkaround/dotfiles.git) repo and fork it.
2. Change my repo with yours. And run below commands:

```bash
sudo apt update && sudo apt upgrade -y && sudo apt install git -y
git clone https://github.com/aworkaround/dotfiles.git ~/dotfiles ## Change my repo with your forked repo
cd ~/dotfiles
chmod +x installer.sh
sudo ./installer.sh

```
