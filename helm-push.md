# Steps to package and push Helm Chart to AWS ECR

Once you are ready with your changes in charts - 

Run **git tag** command from root directory

First, please check the previous tag and use the incremental version of that.
Create git tag in local

```shell
git tag 2.10.1-d15
```
Push the tag to the remote repo

```shell
git push origin 2.10.1-d15
```
It will trigger the **TMDC Helm chart push workflow to AWS ECR** github action pipeline.
**pulsar** helm chart will be created with the **TAG** pushed to github and same will be pushed to AWS ECR

**NOTE:** Always maintain the semantic version (major.minor.patch) fixed and provide a suffix **-d** with it.
Tag will be incremental like ```shell major.minor.patch-d(+1 increment)```

ex ```shell 2.10.1-d15, 2.10.1-d16, 2.10.1-d17 ... ``` like that

We can update and push the **major.minor.patch** section of the tag once there in a release with official repo with same major/minor/patch version and also if we merge the changes to our repo.

ex: Lets say 2.10.2 or 2.11.1 version released . Once changes have been merged to our repo we will use tag 2.10.2-d(+1) or 2.11.1-d(+1).

**Please update the 'version' in Chart.yaml once there is a change in major/minor/patch version**
