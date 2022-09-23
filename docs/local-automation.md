# Local Automation

- [Lint Staged](https://github.com/okonet/lint-staged)
- [Husky](https://github.com/typicode/husky)

## Husky & Lint Staged

```shell
ddev exec npx husky-init && npm install
ddev exec npm install --save-dev lint-staged

echo '{
  "**/*.php": [
    "./vendor/bin/ecs check --ansi --fix",
    "./vendor/bin/phpstan analyse --memory-limit=1G"
  ],
  "*": "prettier --ignore-unknown --write"
}'> .lintstagedrc.json
```

Edit `.husky/pre-commit`, replacing `npm test` with:

```shell
# Add to path for GUIs (Tower, etc.)
PATH="/usr/local/bin:$PATH"

# If using using nvm and running from host…
#[[ -s $HOME/.nvm/nvm.sh ]] && . $HOME/.nvm/nvm.sh

ddev exec npx lint-staged
```

If using Tower, set your Git binary to `usr/local/bin/git`:
![Tower's Git binary selection](/automation-workshop/assets/tower-hooks.png)
