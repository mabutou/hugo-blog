git add .
git commit -m "blog upgrage"
git push
hugo
# docker build --platform linux/amd64 -t mabutou/hugo-blog .
# docker build --platform linux/arm64 -t mabutou/hugo-blog:arm .
# docker push mabutou/hugo-blog
# docker push mabutou/hugo-blog:arm
wrangler publish
