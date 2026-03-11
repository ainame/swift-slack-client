---
name: release-new-version
description: Prepare and publish a new repository release when the user asks to bump a version, update the changelog, create or move a git tag, push release refs, or create or edit a GitHub release. Use for release tasks that must happen from the latest synced `main` branch, with version tags that do not use a `v` prefix.
---

# Release New Version

## Overview

Use this skill to perform the full release flow safely: update `CHANGELOG.md`, commit the release metadata, ensure the release commit is on the latest `main`, create or move the version tag, push the branch and tag, and create or update the GitHub release page.

Treat `main` as the only valid source for release tags. If a release request starts from another branch, switch to `main`, sync it with `origin/main`, and do the release work there.

## Inputs

- Release version, for example `0.5.0`
- Repository checkout with git and `gh` configured
- Release notes source, usually `CHANGELOG.md`

## Workflow

1. Verify repository state.
   - Run `git status --short --branch`.
   - Confirm the local branch is `main`.
   - Confirm `HEAD` matches `origin/main`. If it does not, update `main` first before changing release metadata.
2. Inspect release context.
   - Read the current `CHANGELOG.md`.
   - Inspect commits since the previous tag or release version so the changelog entry matches the actual release scope.
   - Check whether the target tag already exists locally or remotely.
   - Check whether a GitHub release for that tag already exists.
3. Update the changelog before tagging.
   - Convert the unreleased section into a dated release section, or add a new release section if the changelog format differs.
   - Keep the version string exact and never prepend `v`.
   - Keep the changelog aligned with the commits that will actually be on the tagged `main` commit.
4. Verify only when needed.
   - If the release changes code, generated artifacts, dependencies, or anything beyond release metadata, run `swift build` and then `swift test`.
   - Keep that order so build failures surface before the slower test pass.
   - If the change is changelog-only or release-metadata-only, verification can be skipped and that should be stated explicitly.
5. Commit the release metadata on `main`.
   - Create a dedicated commit such as `Prepare <version> release`.
   - Push `main` to `origin` before finalizing the tag so the tagged commit exists on the remote default branch.
6. Create or correct the tag.
   - Create an annotated tag named exactly `<version>`.
   - Never use a `v` prefix.
   - If the tag already exists on the wrong commit, move it only after the correct `main` commit exists, then force-push the tag update.
7. Publish or correct the GitHub release.
   - If no release exists, create it from the tag with notes sourced from the new changelog section.
   - If a release already exists, edit it so the notes and tag reference stay aligned with the corrected tag.
8. Re-check final state.
   - Confirm `HEAD`, `origin/main`, and `<version>^{}` resolve to the same commit.
   - Confirm the GitHub release URL and whether it is a draft or prerelease.

## Guardrails

- Do not release from feature branches, topic branches, or detached HEAD states.
- Do not tag before the changelog update is committed.
- Do not assume an existing release tag is correct; inspect it.
- Prefer editing an existing GitHub release instead of creating duplicates.
- If branch protection messages appear during push, report them, but continue only if the push actually succeeds.

## Useful Commands

- `git status --short --branch`
- `git rev-parse HEAD && git rev-parse origin/main`
- `git log --oneline <previous-tag>..main`
- `swift build`
- `swift test`
- `git tag --list`
- `gh release view <version> --json url,targetCommitish,tagName,name,isDraft,isPrerelease`
- `git tag -a <version> -m "<version>"`
- `git tag -fa <version> -m "<version>"`
- `git push origin main`
- `git push origin <version>`
- `git push --force origin <version>`
- `gh release create <version> --title "<version>" --notes-file <path>`
- `gh release edit <version> --title "<version>" --notes-file <path>`

## Output

Report:
- The release commit SHA on `main`
- Whether verification was run
- Whether the tag was newly created or moved
- The GitHub release URL
