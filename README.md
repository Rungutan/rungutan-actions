# Rungutan - GitHub Actions

This workflow will run a load test using Rungutan against your own platform based on a test case that you version in your own repository.

Check out the official platform here: https://rungutan.com

For more information on how to set up GitHub Integrations, read more here: https://docs.rungutan.com/Integrations/#github-actions

## Running the load test without waiting for it to finish

```
name: Load test with Rungutan

on:
  release:
    types:
      - created

jobs:
  load:

    runs-on: ubuntu-latest

    steps:
    - uses: actions/checkout@v2

    - name: Load test your platform with Rungutan
      uses: Rungutan/rungutan-actions@1.0.0
      env:
        RUNGUTAN_TEAM_ID: ${{ secrets.RUNGUTAN_TEAM_ID }}
        RUNGUTAN_API_KEY: ${{ secrets.RUNGUTAN_API_KEY }}
        RUNGUTAN_TEST_FILE: test_file.json
        RUNGUTAN_TEST_NAME: ${{ github.repository }}-${{ github.ref }}

```

## Running the load test and wait for it to finish

```
name: Load test with Rungutan

on:
  release:
    types:
      - created

jobs:
  load:

    runs-on: ubuntu-latest

    steps:
    - uses: actions/checkout@v2

    - name: Load test your platform with Rungutan
      uses: Rungutan/rungutan-actions@1.0.0
      env:
        RUNGUTAN_TEAM_ID: ${{ secrets.RUNGUTAN_TEAM_ID }}
        RUNGUTAN_API_KEY: ${{ secrets.RUNGUTAN_API_KEY }}
        RUNGUTAN_TEST_FILE: test_file.json
        RUNGUTAN_TEST_NAME: ${{ github.repository }}-${{ github.ref }}
        RUNGUTAN_WAIT_FINISH: true

```

## Complete list of variables

Here's the list and their default values:

| Environment value name  | Is required ? | Default value (if any)   | Comments                                                                          |
| ----------------------- | ------------- | ------------------------ | --------------------------------------------------------------------------------- |
| RUNGUTAN_TEAM_ID        | YES           | No default value         | You should define this as a GitHub secret                                         |
| RUNGUTAN_API_KEY        | YES           | No default value         | You should define this as a GitHub secret                                         |
| RUNGUTAN_TEST_FILE      | YES           | No default value         | The filename in your repository which contains the test case                      |
| RUNGUTAN_TEST_NAME      | NO            | No default value         | If not provided, script will check for value of "test_name in your test case file |
| RUNGUTAN_WAIT_FINISH    | NO            | Default value is "false" | If not provided, the script will simply launch the test but not wait for it to finish |
