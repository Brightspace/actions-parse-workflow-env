#!/usr/bin/env bash

# Run variables
IS_MAIN='false'
IS_SCHEDULE='false'
IS_PUSH='true'
IS_TAGGED='false'
IS_RELEASE='false'

if [[ $GITHUB_REF == *"/$MAIN_BRANCH" ]]; then
  IS_MAIN='true'
fi

if [[ $GITHUB_REF == *"/tags/"* ]]; then
  IS_TAGGED='true'

  if [[ $GITHUB_REF == *"/tags/$RELEASE_TAG_PREFIX"* ]]; then
    IS_RELEASE='true'
  fi
fi

if [[ $GITHUB_EVENT_NAME == "schedule" ]]; then
  IS_SCHEDULE='true'
  IS_PUSH='false'
fi

# Export variables
echo "::set-output name=isMain::$IS_MAIN"
echo "::set-output name=isSchedule::$IS_SCHEDULE"
echo "::set-output name=isPush::$IS_PUSH"
echo "::set-output name=isTagged::$IS_TAGGED"
echo "::set-output name=isRelease::$IS_RELEASE"

echo "Git Ref: '$GITHUB_REF'"
echo "Event: '$GITHUB_EVENT_NAME'"
echo "$MAIN_BRANCH: '$IS_MAIN'"
echo "Schedule: '$IS_SCHEDULE'"
echo "Push: '$IS_PUSH'"
echo "Tagged: '$IS_TAGGED'"
echo "Release: '$IS_RELEASE'"
