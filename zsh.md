If you want to beautify your terminal you will need download a new terminal similar to bash
which is zsh since bash does not allow plugins. zsh does whatever bash does but better since there are plugins

1. Install zsh terminal
Run the following commands:
sudo apt update && sudo apt upgrade
sudo apt install zsh


2. Install oh my zsh framework that sits on top of zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

Location of zsh: /usr/bin/zsh

3. Switch shell froms bash -> zsh (You may need to restart your com for it to work)
Run "chsh <Name of computer>"
Run "echo $SHELL"

if echo = bash, restart pc

4. Setting up paths
Once you switch you zsh, you are switching over to a totally different shell which means that you may need
to reinstall some plugins and export the path in the ~/.zshrc

There is a complete .zshrc template file with comments that you can copy and paste

5. Install a theme 
This can be done using the zinit package manager instead of directly git cloning the powerlevel 10k theme
You may choose whatever theme you may like

if you are using zinit to download you can just refer to the template
if you are using git, then you need to specific the theme as THEME="powerlevel10k"

6. Change terminal colorscheme, this affects the background
bash -c "$(curl -fsSL https://raw.githubusercontent.com/denysdovhan/gnome-terminal-one/master/one-dark.sh)" # for one dark pro color scheme, you can search for other gnome terminal colorscheme

7. Download fzf, to search path, NOTE that the command must be two lines
Run "
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf 
~/.fzf/install
"

8. Install zoxide, a smarter version of cd without full path declaration
curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh

9. Update oh my zsh
Run "omz update"

Add the following to .zshrc
----- Add the following -------
# Set up fzf key bindings and fuzzy completion
source <(fzf --zsh)
----- Add the following -------

 Refer to this very well done configuration if you are lost for the .zshrc
https://github.com/dreamsofautonomy/zensh/blob/main/.zshrc

