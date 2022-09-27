# CI/CD

![It's all pipes!](/automation-workshop/assets/all-pipes.gif)

## Github Actions

- [Pricing](https://github.com/pricing)
- [Contexts](https://docs.github.com/en/actions/learn-github-actions/contexts)
- [Workflow syntax](https://docs.github.com/en/actions/using-workflows/workflow-syntax-for-github-actions)
- [act](https://github.com/nektos/act)

### Security Considerations

- [Preventing pwn requests](https://securitylab.github.com/research/github-actions-preventing-pwn-requests/)
  - TL;DR: Combining pull_request_target workflow trigger with an explicit checkout of an untrusted PR is a dangerous practice that may lead to repository compromise.
- [Self-hosted](https://docs.github.com/en/actions/security-guides/security-hardening-for-github-actions#hardening-for-self-hosted-runners)
  - TL;DR: Using native GH events in your workflow can lead to arbitrary code execution
- [Dependabot](https://github.com/dependabot)
- [snyk.io](https://snyk.io/)

### Workflows

- [Synk Example](https://github.com/craftcms/docker/blob/main/.github/workflows/build-and-push.yml)
- [Pa11y](https://github.com/marketplace/actions/pa11y-actions)
- [Synk Workflow](https://github.com/marketplace/actions/snyk)
- [Discord](https://github.com/appleboy/discord-action)

### Prettier

Append to `jobs.code-quality.steps`:

```yaml
- uses: actions/setup-node@v3
  with:
    node-version: 16
- run: npx prettier --check .
```

### Discord Notification

Append to `jobs.code-quality.steps`:

```yaml
- name: Discord Success
  if: ${{ success() }}
  uses: appleboy/discord-action@0.0.3
  with:
    webhook_id: ${{ secrets.DISCORD_WEBHOOK_ID }}
    webhook_token: ${{ secrets.DISCORD_WEBHOOK_TOKEN }}
    color: "#00ff00"
    message: |
      Job Succeeded 🧘
      ${{ github.server_url }}/${{ github.repository }}/actions/runs/${{ github.run_id }}

- name: Discord Failure
  if: ${{ failure() }}
  uses: appleboy/discord-action@0.0.3
  with:
    webhook_id: ${{ secrets.DISCORD_WEBHOOK_ID }}
    webhook_token: ${{ secrets.DISCORD_WEBHOOK_TOKEN }}
    color: "#FF0000"
    message: |
      Job Failed 🫠
      ${{ github.server_url }}/${{ github.repository }}/actions/runs/${{ github.run_id }}
```

### Deployment

Append to `jobs`:

```yaml
deploy:
  runs-on: ubuntu-latest
  needs: code-quality
  steps:
    - name: Checkout code
      uses: actions/checkout@v3
    - name: Setup SSH
      uses: webfactory/ssh-agent@v0.5.3
      with:
        ssh-private-key: ${{ secrets.SSH_PRIVATE_KEY }}
    - name: Setup PHP
      uses: shivammathur/setup-php@v2
      with:
        php-version: 8.0
        tools: composer:v2
        ini-values: post_max_size=256M, max_execution_time=180, memory_limit=512M
        extensions: ctype,curl,dom,iconv,imagick,intl,json,mbstring,openssl,pcre,pdo,reflection,spl,zip
    - name: Require Forge CLI
      run: composer global require laravel/forge-cli
    - name: Deploy Site
      run: |
        forge server:switch hidden-firefly
        forge deploy applefakenews.com
        forge command applefakenews.com --command="php craft migrate/all --no-content --interactive=0"
        forge command applefakenews.com --command="php craft project-config/apply"
        forge command applefakenews.com --command="php craft migrate --track=content --interactive=0"
      env:
        FORGE_API_TOKEN: ${{ secrets.FORGE_API_TOKEN }}
    - uses: lhansford/bugsnag-report-build-action@v1.1.0
      name: Report Build to Bugsnag
      with:
        appVersion: ${{ github.event.repository.updated_at }}
        apiKey: ${{ secrets.BUGSNAG_API_KEY }}
```

### Cron

`.github/workflows/cron.yml`:

```yaml
on:
  workflow_dispatch:
  schedule:
    - cron: 0 0 * * *

jobs:
  log-out:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout code
        uses: actions/checkout@v3
      - name: Setup SSH
        uses: webfactory/ssh-agent@v0.5.3
        with:
          ssh-private-key: ${{ secrets.SSH_PRIVATE_KEY }}
      - name: Setup PHP
        uses: shivammathur/setup-php@v2
        with:
          php-version: 8.0
          tools: composer:v2
          ini-values: post_max_size=256M, max_execution_time=180, memory_limit=512M
          extensions: ctype,curl,dom,iconv,imagick,intl,json,mbstring,openssl,pcre,pdo,reflection,spl,zip
      - name: Require Forge CLI
        run: composer global require laravel/forge-cli
      - name: Log 'em out!
        run: |
          forge server:switch hidden-firefly
          forge command applefakenews.com --command="php craft users/logout-all"
        env:
          FORGE_API_TOKEN: ${{ secrets.FORGE_API_TOKEN }}
```
