git add .
git commit -m "update zozo-theme"
git push
hugo
docker build --platform linux/amd64 -t mabutou/hugo-blog .
docker push mabutou/hugo-blog
# wrangler publish
