#!/usr/bin/env bash

git checkout gh-pages
git merge master
manubot webpage
git add webpage
git commit -m "Updated webpage"
git push origin gh-pages
git checkout master