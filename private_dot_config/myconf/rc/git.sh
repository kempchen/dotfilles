#!/bin/sh

# alias
alias gp='git push'
alias gpl='git pull'

# Git commit and push to branch
gcpb() {
  if ! git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
    echo "Kein Git-Repository gefunden."
  fi

  if git diff --cached --quiet; then
    echo "Keine Änderungen im Staging-Bereich vorhanden."
  else
    echo "Es gibt staged Changes:"
    git diff --cached --name-status

    BRANCH=$(git rev-parse --abbrev-ref HEAD)

    if [ -n "$1" ]; then
      COMMENT="$*"
    else
      if [ -n "$ZSH_VERSION" ]; then
        # zsh
        read "COMMENT?Commit-Message Kommentar (optional): "
      else
        # bash
        read -rp "Commit-Message Kommentar (optional): " COMMENT
      fi
    fi

    if [ -z "$COMMENT" ]; then
      MSG="$BRANCH"
    else
      MSG="$BRANCH: $COMMENT"
    fi

    git commit -m "$MSG" || {
      echo "❌ Nichts zu committen."
      return 1
    }

    if git rev-parse --abbrev-ref --symbolic-full-name "@{u}" >/dev/null 2>&1; then
      echo "Upstream-Branch ist bereits gesetzt."
      git push
    else
      echo "Kein Upstream-Branch gefunden. Setze Upstream..."
      git push --set-upstream origin "$BRANCH"
    fi
  fi
}

# Git commit
gc() {

  if ! git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
    echo "Kein Git-Repository gefunden."
  fi

  if git diff --cached --quiet; then
    echo "Keine Änderungen im Staging-Bereich vorhanden."
  else
    echo "Es gibt staged Changes:"
    git diff --cached --name-status

    BRANCH=$(git rev-parse --abbrev-ref HEAD)

    if [ -n "$1" ]; then
      COMMENT="$*"
    else
      if [ -n "$ZSH_VERSION" ]; then
        # zsh
        read "COMMENT?Commit-Message Kommentar (optional): "
      else
        # bash
        read -rp "Commit-Message Kommentar (optional): " COMMENT
      fi
    fi

    if [ -z "$COMMENT" ]; then
      MSG="$BRANCH"
    else
      MSG="$BRANCH: $COMMENT"
    fi

    git commit -m "$MSG" || {
      echo "❌ Nichts zu committen."
      return 1
    }
  fi
}

# Git Pull & Merge Main in current branch
gmm() {
  CURRENT_BRANCH=$(git branch --show-current)
  git checkout "main"
  git pull
  git checkout "${CURRENT_BRANCH}"
  git merge main
}
