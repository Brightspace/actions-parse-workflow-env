# Parse Workflow Environment Action

Github action that looks through the github environment variables and creates flags for use in the workflow. See outputs in [action.yml](/action.yml) for a list of available flags.

## Usage

## Simple Usage

```yml

steps:
  - uses: Brightspace/actions-parse-workflow-env@v1
    id: workflow-env
  
  - name: Deploy
    if: ${{ steps.workflow-env.outputs.isRelease == 'true' }}
    run: do deploy

```

## Custom Release Tag

```yml

steps:
  - uses: Brightspace/actions-parse-workflow-env@v1
    id: workflow-env
    with:
      release-tag-prefix: 'rel.v.'
  
  - name: Deploy
    if: ${{ steps.workflow-env.outputs.isRelease == 'true' }}
    run: do deploy

```

## Main as default branch

By default the main branch is 'master'. If you have migrated to 'main' as the main branch, or use an unconventional main branch, you will have to set the main-branch.

```yml

steps:
  - uses: Brightspace/actions-parse-workflow-env@v1
    id: workflow-env
    with:
      main-branch: 'main'

  - name: Deploy UAT
    if: ${{ steps.workflow-env.outputs.isMain == 'true' }}
    run: do deploy

```