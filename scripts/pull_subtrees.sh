#!/usr/bin/env bash
set -eu
set -o pipefail

git stash push -m 'pull_subtrees.sh' > /dev/null

function finish {
  stash_idx=$(git stash list | grep "pull_subtrees\.sh" | cut -d: -f1 || true)
  if [ -n "$stash_idx" ]; then
    git stash apply "$stash_idx" > /dev/null
    git stash drop "$stash_idx" > /dev/null
  fi
}
trap finish EXIT

git subtree pull --prefix exact_dot_zim                                                                     https://github.com/Eriner/zim                             master --squash
git subtree pull --prefix exact_dot_zim/exact_modules/exact_history-substring-search/exact_external         https://github.com/zsh-users/zsh-history-substring-search master --squash
git subtree pull --prefix exact_dot_zim/exact_modules/exact_completion/exact_external                       https://github.com/zsh-users/zsh-completions              master --squash
git subtree pull --prefix exact_dot_zim/exact_modules/exact_syntax-highlighting/exact_external              https://github.com/zsh-users/zsh-syntax-highlighting      master --squash
git subtree pull --prefix exact_dot_zim/exact_modules/exact_prompt/exact_external-themes/exact_pure         https://github.com/sindresorhus/pure                      master --squash
git subtree pull --prefix exact_dot_zim/exact_modules/exact_prompt/exact_external-themes/exact_liquidprompt https://github.com/nojhan/liquidprompt                    master --squash
git subtree pull --prefix exact_dot_zim/exact_modules/exact_prompt/exact_external-themes/exact_lean         https://github.com/miekg/lean                             master --squash
git subtree pull --prefix exact_dot_zim/exact_modules/exact_autosuggestions/exact_external                  https://github.com/zsh-users/zsh-autosuggestions          master --squash
git subtree pull --prefix exact_dot_tmux/exact_plugins/exact_tpm                                            https://github.com/tmux-plugins/tpm                       master --squash

while IFS= read -r -d '' file; do
  (
    cd "$(dirname "$file")";
    f="$(basename "$file")";
    link="$(readlink "$f")";
    git rm "$f";
    echo -n "$link" > symlink_"$f"
    git add symlink_"$f";
  )
done < <(find exact_dot_zim exact_dot_tmux -type l -print0)

while IFS= read -r -d '' file; do
  (
    cd "$(dirname "$file")";
    f="$(basename "$file")";
    git mv "$f" executable_"$f";
  )
done < <(find exact_dot_zim exact_dot_tmux -type f -executable ! -name 'executable_*' -print0)

while IFS= read -r -d '' file; do
  (
    cd "$(dirname "$file")";
    f="$(basename "$file")";
    if [ "$f" == ".gitmodules" ]; then
      git rm -f "$f"
    elif [ "$f" == ".gitignore" ]; then
      true # noop
    elif [ "$f" == ".gitattributes" ]; then
      true # noop
    else
      git mv "$f" dot_"$(echo "$f" | cut -d. -f2)";
    fi
  )
done < <(find exact_dot_zim exact_dot_tmux -name '.*' -print0)

while IFS= read -r -d '' file; do
  (
    exact=$(dirname "$file")/exact_$(basename "$file")
    git mv "$file" "$exact"
  )
done < <(find exact_dot_zim exact_dot_tmux -type d ! -name 'exact_*' -print0 | sort -rz)

sed -i 's|%#|%(!.#.λ)|g' exact_dot_zim/exact_modules/exact_prompt/exact_external-themes/exact_lean/prompt_lean_setup
