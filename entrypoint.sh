#! /usr/bin/env bash
set -Eeuo pipefail

RUNGUTAN_WAIT_FINISH=false
export RUNGUTAN_WAIT_FINISH
RUNGUTAN_WAIT_FINISH_LOWERCASE=false
export RUNGUTAN_WAIT_FINISH_LOWERCASE

if [ -z "$RUNGUTAN_TEAM_ID" ]; then
  echo "RUNGUTAN_TEAM_ID is not set"
  exit 1
fi

if [ -z "$RUNGUTAN_API_KEY" ]; then
  echo "RUNGUTAN_API_KEY is not set"
  exit 1
fi

if [ -z "$RUNGUTAN_TEST_FILE" ]; then
  echo "RUNGUTAN_TEST_FILE is not set"
  exit 1
fi

if [[ ! -f "$RUNGUTAN_TEST_FILE" ]]; then
  echo "${RUNGUTAN_TEST_FILE} does not exist"
fi

if [ -z "$RUNGUTAN_WAIT_FINISH" ]; then
  RUNGUTAN_WAIT_FINISH_LOWERCASE=$(echo "$RUNGUTAN_WAIT_FINISH" | awk '{print tolower($0)}')
fi

export RUNGUTAN_TEAM_ID
export RUNGUTAN_API_KEY
export RUNGUTAN_TEST_FILE
export RUNGUTAN_WAIT_FINISH_LOWERCASE

echo "Running load test on $GITHUB_REPOSITORY with run_id $GITHUB_RUN_ID"

if [ -z "$RUNGUTAN_TEST_NAME" ]; then
  if [ "$RUNGUTAN_WAIT_FINISH_LOWERCASE" == "true" ]; then
    rungutan tests add --test_file ${RUNGUTAN_TEST_FILE} --wait_to_finish
  else
    rungutan tests add --test_file ${RUNGUTAN_TEST_FILE}
  fi
else
  export RUNGUTAN_TEST_NAME
  if [ "$RUNGUTAN_WAIT_FINISH_LOWERCASE" == "true" ]; then
    rungutan tests add --test_file ${RUNGUTAN_TEST_FILE} --wait_to_finish --test_name ${RUNGUTAN_TEST_NAME}
  else
    rungutan tests add --test_file ${RUNGUTAN_TEST_FILE} --test_name ${RUNGUTAN_TEST_NAME}
  fi
fi