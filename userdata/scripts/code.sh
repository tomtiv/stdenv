VSCODE_PATH=code
mkdir -p ~/.vscode
echo 'nohup '$VSCODE_PATH' "$@" > ~/.vscode/nohup.out 2>&1 &' | sudo tee ~/.local/bin/code > /dev/null
sudo chmod a+x ~/.local/bin/code
