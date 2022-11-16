FROM directus/directus
# See https://docs.directus.io/reference/environment-variables/
ENV \
  KEY="generate a uuid and put here" \
  SECRET="generate a uuid and put here" \
  ADMIN_EMAIL="your-email@example.com" \
  ADMIN_PASSWORD="your password (maybe this should be env var?)"

EXPOSE 8055
CMD npx directus bootstrap && npx directus start
