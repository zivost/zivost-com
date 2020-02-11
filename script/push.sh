#!/usr/bin/env bash
set -e # halt script on error

setup_git() {
  git config --global user.email "travis@travis-ci.org"
  git config --global user.name "Travis CI"
}
#
#}
commit_website_files() {
  git clone https://rohithzr:${github_token}@github.com/zivost/zivost-com.git dist
  cd dist
  git checkout gh-pages
  rm -rf ./*
  cp -R ../_site/* ./
  git add .
  git commit -a -m "Travis build: $TRAVIS_BUILD_NUMBER"
}
#
upload_files() {
  git push --quiet --set-upstream origin gh-pages
}
#
if [ "$TRAVIS_PULL_REQUEST" = "false" ];
then
	setup_git
	commit_website_files
	upload_files	
else
	echo "Will push after merge"
fi	
