$HEAD=bump/to-dev
$BASE=canary

$TO=dev

git checkout $BASE
git checkout -B $HEAD
git push --force-with-lease origin $HEAD
gh pr create --base $TO --head $HEAD --title "Bump to dev" || exit 0
