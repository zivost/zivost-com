#!/usr/bin/env bash
set -e # halt script on error
cd _site # change to built directory

setup_git() {
  git config --global user.email "travis@travis-ci.org"
  git config --global user.name "Travis CI"
}
#
#}
commit_website_files() {
  git init
  git checkout -b gh-pages
  git add .
  git commit --message "Travis build: $TRAVIS_BUILD_NUMBER"
}
#
upload_files() {
  git remote add gh-pages https://${github_token}@github.com:zivost/zivost-com.git > /dev/null 2>&1
  git push --quiet --set-upstream gh-pages
}
#
setup_git
commit_website_files
upload_files
