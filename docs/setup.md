# Setup

```shell
git clone https://github.com/craftcms/automation-workshop.git
cd automation-workshop
ddev config

# optional…
gh repo fork
```

Ensure PHP versions agree in `.ddev/config.yaml` and `composer.json`

```shell
ddev start
ddev describe
cp .env.example.dev .env
ddev composer install
ddev craft setup
ddev launch
```

## Links

- [DDEV Craft PR](https://github.com/drud/ddev/pull/4176/files)
- [Migrating from Craft Nitro to DDEV](https://craftcms.com/knowledge-base/migrating-from-craft-nitro-to-ddev)
- [GitHub CLI](https://cli.github.com/)
