#!/bin/sh
# Apply git global user.name / user.email from environment (ubuntu-development image).
# Only sets values when the corresponding variable is non-empty; does not unset existing config.

if [ -n "${GIT_USER_NAME-}" ]; then
  git config --global user.name "$GIT_USER_NAME"
fi
if [ -n "${GIT_USER_EMAIL-}" ]; then
  git config --global user.email "$GIT_USER_EMAIL"
fi
