# Flower Dance Oh My ZSH Theme
Tired of a black screen with white text? Or a purple one, with some colors, but no personality?
Flower Dance is a custom theme for [Oh My ZSH](https://ohmyz.sh/) that makes your shell exprience fun without so much polution!

## Features and behaviors
Prompt left size:
- Time display;
- Flower emoji mark (🌷) for normal users;
- Root emoji mark (🌱) for user root (Duuh!);
- Reduced path when inside a git repository.

Prompt right size:
- Logged user;
- Whale Emoji (🐋) as a docker indicator! (when used inside a docker container)
- Git info display (based on current path):
    - Current branch;
    - Branch ahead (<span style="color: magenta">↑</span>);
    - Branch behind (<span style="color: green">↓</span>);
    - Staged changes (<span style="color: green">●</span>);
    - Unstaged changes (<span style="color: yellow">●</span>);
    - Untracked changes (<span style="color: white">●</span>);
    - Unmerged changes (<span style="color: red">✕</span>).

## Get started!
First of all, we need Oh My ZSH. Download their installation script:
```sh
# curl
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# wget
sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
```

Downlod the theme on Oh My ZSH theme folder:
```sh
#curl
curl -o ~/.oh-my-zsh/themes/flower-dance.zsh-theme https://raw.githubusercontent.com/MarcyLeite/flower-dance-omzsh/main/flower-dance.zsh-theme

#wget
wget https://raw.githubusercontent.com/MarcyLeite/flower-dance-omzsh/main/flower-dance.zsh-theme -P ~/.oh-my-zsh/themes/

```

Set your `.zshrc` (in your home directory) ZSH_THEME variable to `flower-dance`:

```sh
# On ~/.zshrc
# ...

ZSH_THEME='flower-dance'

# ...
```

Finally, source `.zshrc` file:

```sh
source ~/.zshrc
```

## Images

![Git basic demo](https://raw.githubusercontent.com/MarcyLeite/flower-dance-omzsh/main/images/git-demo.png)

![Root/Docker demo](https://raw.githubusercontent.com/MarcyLeite/flower-dance-omzsh/main/images/root-docker-demo.png)