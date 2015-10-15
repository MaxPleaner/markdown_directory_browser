### How to use:

1. write `.md` files inside `drafts/` and `published/`. There can be subfolders.

2. Run `ruby build.rb` to compile `published/` into `compiled/`. This converts the `.md` files to `.html`.

3. `cd compiled/ && file-browser` - this runs the [file-browser](https://www.npmjs.com/package/file-browser) node server. To install `file-browser`, first [make sure npm is installed correctly](https://github.com/sindresorhus/guides/blob/master/npm-global-without-sudo.md), then run `npm install -g file-browser`. 

4. Open `http://localhost:8088` in a browser. 