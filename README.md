# Remix Jokes app

- [Remix Docs](https://remix.run/docs)

This project is built by following the remix [jokes tutorial](https://remix.run/docs/en/v1/tutorials/jokes).

This was probably one of my favorite tutorials I have ever followed. It lead you
perfectly to think oh that's a bit strange I wish it work like `x` and then
it showed you it does really work like `x` but only if you do `y`

## Development

From your terminal:

```sh
yarn prisma db push
yarn dev
```

This starts your app in development mode, rebuilding assets on file changes.

## Deployment

First, build your app for production:

```sh
yarn build
```

Then run the app in production mode:

```sh
yarn start
```

Now you'll need to pick a host to deploy it to.

### DIY

If you're familiar with deploying node applications, the built-in Remix app server is production-ready.

Make sure to deploy the output of `remix build`

- `build/`
- `public/build/`

### Using a Template

When you ran `npx create-remix@latest` there were a few choices for hosting. You can run that again to create a new project, then copy over your `app/` folder to the new project that's pre-configured for your target server.

```sh
cd ..
# create a new project, and pick a pre-configured host
npx create-remix@latest
cd my-new-remix-app
# remove the new project's app (not the old one!)
rm -rf app
# copy your app over
cp -R ../my-old-remix-app/app app
```
