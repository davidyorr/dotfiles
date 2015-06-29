#!/bin/sh

echo 'copying dotfiles'

cd "$(dirname "$0")"
CWD=$(pwd)

for f in $(find * ! -path . -type f -name '.*')
do
  ABSPATH="$CWD/$f"
  FILENAME=${f##*/}
  echo "    $FILENAME"

  rm -f "$HOME/$FILENAME"
  ln -s "$ABSPATH" "$HOME/$FILENAME"
done

echo 'done copying dotfiles'
