git add .
git commit -m "blog upgrage"
git push
hugo
docker build --platform linux/amd64 linux/arm -t mabutou/hugo-blog .
# docker build --platform linux/amd64 -t mabutou/hugo-blog:arm .
docker push mabutou/hugo-blog
wrangler publish
