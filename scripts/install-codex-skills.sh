#!/usr/bin/env bash
set -euo pipefail

script_dir="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
repo_root="$(cd -- "${script_dir}/.." && pwd)"
codex_root="${CODEX_HOME:-${HOME}/.codex}"
skills_target="${codex_root}/skills"
conflicts=0
installed=0

mkdir -p "${skills_target}"

for skill_dir in "${repo_root}"/skills/*; do
  [[ -d "${skill_dir}" && -f "${skill_dir}/SKILL.md" ]] || continue

  skill_name="${skill_dir##*/}"
  link_path="${skills_target}/${skill_name}"

  if [[ -L "${link_path}" ]]; then
    if [[ "$(readlink -- "${link_path}")" == "${skill_dir}" ]]; then
      printf 'Already linked: %s\n' "${skill_name}"
    else
      printf 'Conflict (left unchanged): %s\n' "${link_path}" >&2
      conflicts=$((conflicts + 1))
    fi
  elif [[ -e "${link_path}" ]]; then
    printf 'Conflict (left unchanged): %s\n' "${link_path}" >&2
    conflicts=$((conflicts + 1))
  else
    ln -s "${skill_dir}" "${link_path}"
    printf 'Linked: %s\n' "${skill_name}"
    installed=$((installed + 1))
  fi
done

printf 'New links: %s; conflicts: %s\n' "${installed}" "${conflicts}"
if (( conflicts > 0 )); then
  exit 1
fi
