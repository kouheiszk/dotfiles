# ~/.zsh.d/zshrc を読み込む
[ -f ~/.zsh.d/zshrc ] && source ~/.zsh.d/zshrc

# ~/.profile を読み込む
[ -f ~/.profile ] && source ~/.profile

# ~/.local_zsh_profile を読み込む
[ -f ~/.local_zsh_profile ] && source ~/.local_zsh_profile



### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# Add environment variable COCOS_CONSOLE_ROOT for cocos2d-x
export COCOS_CONSOLE_ROOT=/Users/kouhei/Documents/workspace/src/github.com/cocos2d/cocos2d-x-3.10/tools/cocos2d-console/bin
export PATH=$COCOS_CONSOLE_ROOT:$PATH

# Add environment variable COCOS_X_ROOT for cocos2d-x
export COCOS_X_ROOT=/Users/kouhei/Documents/workspace/src/github.com/cocos2d
export PATH=$COCOS_X_ROOT:$PATH

# Add environment variable COCOS_TEMPLATES_ROOT for cocos2d-x
export COCOS_TEMPLATES_ROOT=/Users/kouhei/Documents/workspace/src/github.com/cocos2d/cocos2d-x-3.10/templates
export PATH=$COCOS_TEMPLATES_ROOT:$PATH

# Add environment variable COCOS_CONSOLE_ROOT for cocos2d-x
export COCOS_CONSOLE_ROOT=/Users/kouhei/Desktop/cocos2d-x-3/tools/cocos2d-console/bin
export PATH=$COCOS_CONSOLE_ROOT:$PATH

# Add environment variable COCOS_X_ROOT for cocos2d-x
export COCOS_X_ROOT=/Users/kouhei/Desktop
export PATH=$COCOS_X_ROOT:$PATH

# Add environment variable COCOS_TEMPLATES_ROOT for cocos2d-x
export COCOS_TEMPLATES_ROOT=/Users/kouhei/Desktop/cocos2d-x-3/templates
export PATH=$COCOS_TEMPLATES_ROOT:$PATH
