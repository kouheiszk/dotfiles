#!/bin/sh

SCRIPT_DIR=$(cd $(dirname $BASH_SOURCE); pwd)

if [ $( uname ) == "Darwin" ]; then
  sh $SCRIPT_DIR/create_symbolick_links.sh
  sh $SCRIPT_DIR/install_command_line_tools.sh
  sh $SCRIPT_DIR/install_applications.sh
  sh $SCRIPT_DIR/install_zsh_settings.sh
  sh $SCRIPT_DIR/install_bash_settings.sh
  sh $SCRIPT_DIR/install_anyenv.sh
  sh $SCRIPT_DIR/install_fonts.sh
  sh $SCRIPT_DIR/install_vim_settings.sh
  sh $SCRIPT_DIR/install_atom_settings.sh
else
  echo "Nothing to do..."
fi
