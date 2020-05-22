# Rungutan - GitHub Actions

This workflow will run a load test using Rungutan against your platform

For more information see: https://docs.rungutan.com/Integrations/#github-actions

## Running the load test with your own packages

```
name: Load test your platform with Rungutan

on:
  release:
    types:
      - created

jobs:
  deploy:

    runs-on: ubuntu-latest

    steps:
    - uses: actions/checkout@v2
    - name: Set up Python
      uses: actions/setup-python@v1
      with:
        python-version: '3.x'
    - name: Install dependencies
      run: |
        python -m pip install --upgrade pip
        pip install rungutan
    - name: Build and publish
      env:
        RUNGUTAN_TEAM_ID: your_team
        RUNGUTAN_API_KEY: ${{ secrets.RUNGUTAN_API_KEY }}
      run: |
        rungutan tests add --test_file test_file.json --wait_to_finish --test_name ${GITHUB_REPOSITORY}-${GITHUB_RUN_ID}
```