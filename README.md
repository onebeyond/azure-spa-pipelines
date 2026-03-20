# Azure SPA Pipeline Setup

This is a repository that contains a fairly bog-standard pipeline setup for an Azure Static App
deployed using Azure DevOps. 

How to use.

1. Initiate your SPA (eg `vite start`). 
2. Add the `devops` folder to your directory, such that it sits above all source code. For a simple SPA, that will likely be the same directory as your `index.html` and `package.json`, if it's not you may have to change some file paths.
3. Add the code snippet from `index.html` in this project to your project. This enables you to set `window.env` globally in your JS, which allows some degree of environment control.
4. Copy `staticwebapp.config.json` next to `index.html`
4. Check the names of your scripts in `package.json` - the example included contains the bare minimum for these pipelines to run - they are the default for `vite`. The naming of the scripts is what matters for this pipeline to work. If you're using webpack, your `build` script, might contain `webpack --config webpack.QA.config` for example. You can also edit the pipelines to run your appropriate script (you might have a `build-release` OWTTE).
5. Set up the pipelines in Azure DevOps. 

a. New Pipeline -> Azure Repos Git -> Pick your repo -> Existing Azure Pipelines YAML file -> Select `build-client.yml`. Rename the Pipeline.
b. New Pipeline -> Azure Repos Git -> Pick your repo -> Existing Azure Pipelines YAML file -> Select `rollout-client.yml`. Rename the Pipeline.
c. Create the "Environments" they will be deployed to - this is an artifact of how Azure DevOps tracks them. The Environments should simply be empty. Environments -> New Environment. If you wish to put guards on your environments, then add them here in the "Approvals and Checks" tab. You may need to refresh the page to get the permission to do it. It's a bug in Azure Devops.

