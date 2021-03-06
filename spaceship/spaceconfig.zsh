SPACESHIP_PROMPT_ORDER=(
  # time          # Time stamps section
  ssh           # SSH connection indicator
  user          # Username section
  dir           # Current directory section
  host          # Hostname section
  git           # Git section (git_branch + git_status)
  git_last_commit
  hg            # Mercurial section (hg_branch  + hg_status)
  package       # Package version
  node          # Node.js section
  ruby          # Ruby section
  # elixir        # Elixir section
  # xcode         # Xcode section
  swift         # Swift section
  golang        # Go section
  php           # PHP section
  rust          # Rust section
  haskell       # Haskell Stack section
  # julia         # Julia section
  docker        # Docker section
  aws           # Amazon Web Services section
  venv          # virtualenv section
  conda         # conda virtualenv section
  pyenv         # Pyenv section
  dotnet        # .NET section
  ember         # Ember.js section
  kubectl       # Kubectl context section
  terraform     # Terraform workspace section
  exec_time     # Execution time
  line_sep      # Line break
  battery       # Battery level and status
  vi_mode       # Vi-mode indicator
  # jobs          # Background jobs indicator
  # exit_code     # Exit code section
  char          # Prompt character
)

SPACESHIP_RPROMPT_ORDER=(
  exit_code # Exit code section
  exec_time # Execution time
  jobs      # Background jobs indicator
  time      # Time stampts section
)
SPACESHIP_CHAR_SYMBOL='❯ '
SPACESHIP_VI_MODE_INSERT='❯ '
SPACESHIP_VI_MODE_NORMAL='❮ '
SPACESHIP_EXIT_CODE_SHOW=true
SPACESHIP_TIME_SHOW=true
SPACESHIP_TIME_12HR=true
