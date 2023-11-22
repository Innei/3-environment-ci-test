HEAD=bump/to-stable
BASE=dev
TO=stable

git checkout $BASE
git checkout -B $HEAD
git push --force-with-lease origin $HEAD
gh pr create --base $TO --head $HEAD --title "Bump to stable" --body "Bump" || exit 0
