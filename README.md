# devops-project

CI/CD project with Git/GitHub, Jenkins and Docker. App: small Flask API (`/` and `/health`).

## What is already done (Pipeline 1, by Sarra)
- `app.py`, `requirements.txt`, `smoke_test.sh`: the app and its smoke test
- `Dockerfile`: multi-stage, with the build argument `PYTHON_VERSION`
- `jenkins/Dockerfile`: Jenkins image that can use Docker
- `Jenkinsfile.pr`: Build & Smoke on PR to `dev`, with parallel builds for Python 3.11 and 3.12

## Git workflow
- `main` is protected, `dev` is the integration branch.
- Never commit to `main` or `dev` directly. Create `feature/<name>` from `dev`, push it, and open a PR into `dev`.
- Merge only when the PR build is green.

## What is left for the teammates
- Pipeline 2: `Jenkinsfile.dev`, a full build on push to `dev`
- Pipeline 3: `Jenkinsfile.tag`, a versioned build on tag `vX.Y.Z` with archived artifacts

## How to start
1. Clone the repo and run `git checkout dev`.
2. Build and start your own Jenkins from `jenkins/Dockerfile`.
3. Create your own GitHub token and your own Jenkins credential. Never share tokens.
4. Copy `Jenkinsfile.pr` as a base for your Jenkinsfile.