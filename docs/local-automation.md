# Local Automation

![Inside Macpaint by Ken Jenkins](/automation-workshop/assets/inside-macpaint.jpeg)

- [Lint Staged](https://github.com/okonet/lint-staged)
- [Husky](https://github.com/typicode/husky)
- [GrumPHP](https://github.com/phpro/grumphp)

```shell
# Try it out
ddev ssh --dir /var/www/html/vendor-local/apple-news
  composer run check-cs
  composer run phpstan
```

## Husky & Lint Staged

````shell
ddev exec npx husky-init && npm install
ddev exec npm install --save-dev lint-staged
touch .lintstagedrc.json

`.lintstagedrc.json`:

```json
{
  "*": "prettier --ignore-unknown --write"
}
````

`.husky/pre-commit`:

```shell
#!/bin/sh
. "$(dirname "$0")/_/husky.sh"

# Add to path for GUIs (Tower, etc.)
PATH="/usr/local/bin:$PATH"

# If using using nvm and running from host…
#[[ -s $HOME/.nvm/nvm.sh ]] && . $HOME/.nvm/nvm.sh

ddev exec npx lint-staged
```

If using Tower, try setting your Git binary to `usr/local/bin/git` or `opt/homebrew/bin/git`:
![Tower's Git binary selection](/automation-workshop/assets/tower-hooks.png)
