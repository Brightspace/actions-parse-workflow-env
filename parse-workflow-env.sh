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
echo "isMain=$IS_MAIN" >> $GITHUB_OUTPUT
echo "isSchedule=$IS_SCHEDULE" >> $GITHUB_OUTPUT
echo "isPush=$IS_PUSH" >> $GITHUB_OUTPUT
echo "isTagged=$IS_TAGGED" >> $GITHUB_OUTPUT
echo "isRelease=$IS_RELEASE" >> $GITHUB_OUTPUT

echo "Git Ref: '$GITHUB_REF'"
echo "Event: '$GITHUB_EVENT_NAME'"
echo "$MAIN_BRANCH: '$IS_MAIN'"
echo "Schedule: '$IS_SCHEDULE'"
echo "Push: '$IS_PUSH'"
echo "Tagged: '$IS_TAGGED'"
echo "Release: '$IS_RELEASE'"
