# eunchurn's Dotfiles

> Use this to create and structure your own dotfiles!

## Prologue

As Zach Holman once wrote:

> Dotfiles are meant to be shared

And I absolutely agree, but at the same time, I'm of the strong belief that one should not copy and use dotfiles of others blindly. Dotfiles are personal, very personal. They help you be more efficient, improve your workflows, and make your life easier. But everyone is unique, and so is everyone's working style. So it does not make any sense in reusing someone else's configs without first understanding what they do, and hoping that they'd work perfectly for you.

It is absolutely critical you understand what's in each file and copy it only if you need it, so that when you customize and extend them with your own settings, configs, aliases and other stuff in the future, you can easily do so without a giant mess of files.


## Getting Started

There is no script or installer that sets up everything for you. Instead you should fork/clone my dotfiles and go through each section and file and keep only those you find important or useful. However, these are the bare minimum, recommended steps you should follow:

#### 1. Install Xcode developer tools

```bash
xcode-select --install

# Optional: Set HostName
sudo scutil --set HostName PsyMBP
```

#### 2. Clone Dotfiles

```bash
git clone git@github.com:eunchurn/.dotfiles.git ~/.dotfiles
```

#### 3. Set up Homebrew

1. Install Homebrew: https://brew.sh
2. Install important apps and fonts [Homebrew](git@github.com:eunchurn/.dotfiles.git/tree/master/Homebrew) section

#### 4. Set up [System Defaults](git@github.com:eunchurn/.dotfiles.git/tree/master/System)

#### 5. Set up [Zsh](git@github.com:eunchurn/.dotfiles.git/tree/master/Zsh)

#### 6. Set up [Git](git@github.com:eunchurn/.dotfiles.git/tree/master/Git)

#### 7. Set up [Vim](https://github.com/eunchurn/dotfiles/tree/master/Vim)

#### 8. Other apps

Now go through other sections relevant to you, and set them up one by one.
