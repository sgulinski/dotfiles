# Install command-line tools using Homebrew.

# Install GNU core utilities (those that come with macOS are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
# See: https://ryanparman.com/posts/2019/using-gnu-command-line-tools-in-macos-instead-of-freebsd-tools/
# See: https://www.topbug.net/blog/2013/04/14/install-and-use-gnu-command-line-tools-in-mac-os-x/
brew "coreutils"

# Install some other useful utilities like `sponge`.
brew "moreutils"
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew "findutils"
# Install a modern version of Bash.
brew "bash"
brew "bash-completion2"

# Install GnuPG to enable PGP-signing commits.
brew "gnupg"

# Install other GNU non-core utilities
brew "diffutils"
brew "ed"
brew "emacs"
brew "gawk"
# gdb requires further actions to make it work. See `brew info gdb`.
brew "gdb"
brew "gnu-indent"
brew "gnu-sed"
brew "gnu-tar"
brew "gnu-which"
brew "gnutls"
brew "gpatch"
brew "gzip"
brew "m4"
brew "make"
brew "nano"
brew "watch"
brew "wdiff"
brew "wget"

# Install more recent versions of some macOS tools.
brew "vim"
brew "grep"
brew "openssh"
brew "screen"
brew "php"
brew "gmp"

# Install some CTF tools; see https://github.com/ctfs/write-ups.
brew "aircrack-ng"
brew "bfg"
brew "binutils"
brew "binwalk"
brew "cifer"
brew "dex2jar"
brew "dns2tcp"
brew "fcrackzip"
brew "foremost"
brew "hashpump"
brew "hydra"
brew "john"
brew "knock"
brew "netpbm"
brew "nmap"
brew "pngcheck"
brew "socat"
brew "sqlmap"
brew "tcpflow"
brew "tcpreplay"
brew "tcptrace"
brew "ucspi-tcp" # `tcpserver` etc.
brew "xpdf"
brew "xz"

# Install other useful binaries.
brew "ack"
brew "dive"
brew "git"
brew "git-lfs"
brew "gradle"
brew "gs"
brew "imagemagick"
brew "jenv"
brew "lastpass-cli"
brew "lua"
brew "lynx"
brew "maven"
brew "mc"
brew "mutt"
brew "packer"
brew "p7zip"
brew "pigz"
brew "pinentry-mac"
brew "pv"
brew "rename"
brew "rlwrap"
brew "ssh-copy-id"
brew "tree"
brew "unix2dos"
brew "vbindiff"
brew "zopfli"

# Install Go and Node.js
brew "go"
brew "node"

# Mac App Store applications
mas "ClientLaunch", id: 1251358171
mas "GoodNotes", id: 1444383602
mas "ToothFairy", id: 1191449274

# https://github.com/Homebrew/homebrew-bundle
# Configure installation directory for Cask
cask_args appdir: '~/Applications'

# Casks
cask "docker"
cask "dropbox"
cask "google-chrome"
cask "iterm2"
cask "mactex"
cask "oracle-jdk"
cask "rectangle"
cask "sublime-text"
cask "virtualbox"
