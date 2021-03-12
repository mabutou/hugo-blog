cd ./themes/hugo-theme-stack
git pull
cp ../hugo-theme-stack ../stack
cd ../stack
rm -rf .git .github
cd ../../
git add .
git commit -m "update theme"
git push