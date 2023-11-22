HEAD=bump/to-dev
BASE=canary
TO=dev

git checkout $BASE
git checkout -B $HEAD
git push -f origin $HEAD
gh pr create --base $TO --head $HEAD --title "Bump to dev" --body "Bump" || exit 0
