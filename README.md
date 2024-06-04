---

# Setting Up Neovim on Windows

This guide will walk you through setting up this repository to work with Neovim on Windows.

## Prerequisites

Before starting, make sure you have the following installed:

- [Neovim](https://neovim.io/)
- [MSYS2](https://github.com/msys2/msys2-installer/releases/)
- [Node.js](https://nodejs.org/)
- [Nerd Fonts JetBrainsMono](https://github.com/ryanoasis/nerd-fonts/releases/)

## Installation Steps

1. **Install Neovim:**

   Download and install Neovim from its [official website](https://neovim.io/).

2. **Install MSYS2:**

   Download and install the latest version of MSYS2 from [here](https://github.com/msys2/msys2-installer/releases/). Once installed a terminal will open, run the following command:

   ```bash
   pacman -S --needed base-devel mingw-w64-ucrt-x86_64-toolchain
   ```

3. **Add MSYS2 to PATH:**

   Add the following path to your system's PATH environment variable:

   ```
   C:\msys64\ucrt64\bin
   ```

4. **Clone Repository:**

   Clone this repository to your local user folder:

   ```
   git clone <repository-url> %USERPROFILE%\AppData\Local
   ```

5. **Install Nerd Fonts JetBrainsMono:**

   Download and install the latest version of Nerd Fonts JetBrainsMono from [here](https://github.com/ryanoasis/nerd-fonts/releases/).

6. **Set JetBrainsMono as Default Font:**

   Set JetBrainsMono as your default font in your terminal emulator.

7. **Install Node.js:**

   Download and install Node.js from its [official website](https://nodejs.org/).

8. **Install Prettier:**

   Install Prettier globally using npm:

   ```bash
   npm i -g prettier
   ```

9. **Run Neovim Setup:**

   In your terminal, run the following command to install necessary plugins and formatters:

   ```bash
   nvim --headless -c "MasonInstall stylua prettierd autopep8" -c "qall"
   ```

10. **Open Neovim:**

    Open Neovim to start using your newly configured development environment.

---