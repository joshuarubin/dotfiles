#!/usr/bin/env bash
set -eu
set -o pipefail

git stash push -m 'pull_subtrees.sh' > /dev/null

function finish {
  stash_idx=$(git stash list | grep "pull_subtrees\.sh" | cut -d: -f1)
  if [ -n "$stash_idx" ]; then
    git stash apply "$stash_idx" > /dev/null
    git stash drop "$stash_idx" > /dev/null
  fi
}
trap finish EXIT

git subtree pull --prefix dot_zim                                             https://github.com/Eriner/zim                             master --squash
git subtree pull --prefix dot_zim/modules/history-substring-search/external   https://github.com/zsh-users/zsh-history-substring-search master --squash
git subtree pull --prefix dot_zim/modules/completion/external                 https://github.com/zsh-users/zsh-completions              master --squash
git subtree pull --prefix dot_zim/modules/syntax-highlighting/external        https://github.com/zsh-users/zsh-syntax-highlighting      master --squash
git subtree pull --prefix dot_zim/modules/prompt/external-themes/pure         https://github.com/sindresorhus/pure                      master --squash
git subtree pull --prefix dot_zim/modules/prompt/external-themes/liquidprompt https://github.com/nojhan/liquidprompt                    master --squash
git subtree pull --prefix dot_zim/modules/prompt/external-themes/lean         https://github.com/miekg/lean                             master --squash
git subtree pull --prefix dot_zim/modules/autosuggestions/external            https://github.com/zsh-users/zsh-autosuggestions          master --squash
git subtree pull --prefix dot_tmux/plugins/tpm                                https://github.com/tmux-plugins/tpm                       master --squash

while IFS= read -r -d '' file; do
  (
    cd "$(dirname "$file")";
    f="$(basename "$file")";
    link="$(readlink "$f")";
    git rm "$f";
    echo -n "$link" > symlink_"$f"
    git add symlink_"$f";
  )
done < <(find dot_zim dot_tmux -type l -print0)

while IFS= read -r -d '' file; do
  (
    cd "$(dirname "$file")";
    f="$(basename "$file")";
    git mv "$f" executable_"$f";
  )
done < <(find dot_zim dot_tmux -type f -executable ! -name 'executable_*' -print0)

while IFS= read -r -d '' file; do
  (
    cd "$(dirname "$file")";
    f="$(basename "$file")";
    git mv "$f" dot_"$(echo "$f" | cut -d. -f2)";
  )
done < <(find dot_zim dot_tmux -name '.*' -print0)

sed -i 's|%#|%(!.#.λ)|g' dot_zim/modules/prompt/external-themes/lean/prompt_lean_setup
