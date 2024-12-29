#! /usr/bin/bash

# Define the URL for the script and the target path
script_url="https://raw.githubusercontent.com/Tejaromalius/CommonBash/main/src/common-bash"
target_path="$HOME/.local/bin"

# Ensure the target directory exists
if [ ! -d "$target_path" ]; then
  mkdir -p "$target_path"
fi

# Fetch the script from GitHub
curl -sSL "$script_url" -o "$target_path/common-bash"

# Check if the script was downloaded successfully
if [ -f "$target_path/common-bash" ]; then
  chmod +x "$target_path/common-bash"
  echo -e "\033[0;32mThe script has been installed successfully to $target_path/common-bash\033[0m"

  # Add ~/.local/bin to PATH if not already included
  if ! echo "$PATH" | grep -q "$HOME/.local/bin"; then
    echo -e "\033[0;33m$HOME/.local/bin is not in your PATH. Adding it to ~/.bashrc.\033[0m"
    echo -e "\nexport PATH=\"$HOME/.local/bin:\$PATH\"" >>"$HOME/.bashrc"
    echo -e "\033[0;32mPlease restart your terminal or run 'source ~/.bashrc' to update your PATH.\033[0m"
  fi
else
  echo -e "\033[0;31mFailed to download the script. Please check your internet connection or the repository URL.\033[0m"
  exit 1
fi

exit 0
