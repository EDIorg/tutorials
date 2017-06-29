Introduction to file versioning with Git and GitHub
========================================================
author: 
date: 
autosize: true

<style>
.small-code pre code {
  font-size: 0.5em;
.footer {
    color: red; background: #E8E8E8;
    position: fixed; top: 90%;
    text-align:center; width:100%;
.midcenter {
    position: fixed;
    top: 50%;
    left: 50%;
}
}
}
</style>



<div class="footer" style="margin-top:200px;font-size:150%;">
<br />Colin Smith<br /><br />Environmental Data Initiative<br /><br />June 20, 2017<br /><br />
<img src="introduction_to_file_versioning_with_git_and_github-figure\fig1_git.png"></img></div>


Tutorial goals
========================================================
<br />
- Understand basic Git concepts and terminology.
- Apply concepts as Git commands to track versioning of a developing file.
- Create a GitHub repository and push local content to it.
- Clone a GitHub repository to the local workspace to begin developing.
- Inspire you to incorporate Git and GitHub into your workflow.


Why use file versioning?
========================================================
- File versioning is useful to developing just about anything, code, a manuscript, or a report.
- Common to these files is the development process (i.e. draft, edit, save, seek comments, merge comments, save, edit, save, etc.).
- This process can result in an unwieldly number of file versions that become difficult to track the content of.
- Git helps by logging a files history as it develops.
- Git also allows for branching from a common file to test ideas you are uncertain about incorporating into the master document.
- Git facilitates parallel development with multiple contributors by seamlessly merging the contributions into a single file.
- Git interfaces with GitHub for collaboration in a user friendly space.
- Git is free and open source.
- Let's take a look at some basic Git concepts. These basics will ... GIT ... you a long way.  :)


Git concepts (master branch)
========================================================
<br />
<img src="introduction_to_file_versioning_with_git_and_github-figure\Slide1.png" width=500></img>
<br />
<br />
- It can be helpful to think of a file history as a tree with a master branch. The master branch is often the production version where others access the most current working copy of your file. Here we have the beginning of the tree. The file has only one version.


Concepts (stage and commit)
========================================================

<img src="introduction_to_file_versioning_with_git_and_github-figure\Slide2.png" width=500></img>

- Now we edit this file, save it, then add the changes to staging (staging tells Git that these are the changes we want a snapshot of), and then we commit (snapshot) the file with a commit message that describes the changes made to this file. A good practice is to write these messages in present tense. This helps you understand you did to the file at a point in time.

Concepts (stage and commit ... continued)
========================================================

<img src="introduction_to_file_versioning_with_git_and_github-figure\Slide3.png" width=500></img>

- Two key bits of information stored with this snapshot are: The commit message, describing the changes; the SHA1 identifier that acts as an address for this version.


Concepts (branch)
========================================================

<img src="introduction_to_file_versioning_with_git_and_github-figure\Slide4.png" width=500></img>

- Now suppose we have an idea we'd like to develop for possible inclusion into the master version of this file. We could do this on the side with out changing the master version. This is called branching. Here we create a branch called "dev" in which we can develop these ideas without needing to change the master.


Concepts (checkout)
========================================================

<img src="introduction_to_file_versioning_with_git_and_github-figure\Slide5.png" width=500></img>

- But before developing this new idea we decide to incorporate some new functionality that we are certain we'd like to incorporate in to the master version. We'd do this by checking out back to the master branch, edit the file, save, stage, and commit. Now we have 3 versions of the file in the master branch and 1 in the dev branch. Let's checkout into the dev
branch and continue development of our idea there.


Concepts (stage, commit)
========================================================

<img src="introduction_to_file_versioning_with_git_and_github-figure\Slide6.png" width=500></img>

- We apply our edits (perhaps a new data processing algorithm), save, stage, and commit, and now have two versions in the dev branch. After some testing we're ready to incorporate these changes into the master document.


Concepts (merge)
========================================================

<img src="introduction_to_file_versioning_with_git_and_github-figure\Slide7.png" width=500></img>

- We do this by checking out to the master branch and merging in the dev branch. Git detects the differences between these two files and combines them into a new file in the master branch.


Concepts (revert/branch)
========================================================

<img src="introduction_to_file_versioning_with_git_and_github-figure\Slide8.png" width=500></img>

- OK! Life is great! Everyone is happy with the new version ... until ... a bug infestation! We realize the previous version in the master branch was a better version and we'd like a time machine to go back to it. Fortunately, you don't need a time machine. You need the command "reset" to revert back to the previous version in the branch. Since we may want to develop from the master verion we are now considering errant, we leave it as is and branch from the version prior to it, and we call this new branch `master_2`.


Concepts (parallel development)
========================================================

<img src="introduction_to_file_versioning_with_git_and_github-figure\Slide9.png" width=500></img>

- Up until now only one person has been contributing to the development of this file. In a collaborative environment there may be another person developing an idea in parallel that can contribute something useful.


Concepts (pull and merge)
========================================================

<img src="introduction_to_file_versioning_with_git_and_github-figure\Slide10.png" width=500></img>

- This collaborator would pull in the version from `master_2` and merge the content, thereby creating a new copy in their repository.


Concepts (push/pull request)
========================================================

<img src="introduction_to_file_versioning_with_git_and_github-figure\Slide11.png" width=500></img>

- If the changes worked out the contributor would then push the new verion to `master_2` (if they have access to it) otherwise they would place a pull request with an administrator of `master_2` and the administrator would pull this file into `master_2` and merge the contents.


Exercise!
========================================================

- Now that you have some familiarity with these concepts it's time to apply them. For the next several slides I will provide you with a task to execute. You'll run all the Git operations from the command line. Though the command line can be a bit cryptic to those unfamiliar with it, the command line allows you to execute the full breadth of functionality offered by Git, whereas Git GUIs only implement a fraction of this functionality. A list of GUI clients are presented in the resources page at the end of this tutorial.

- In this exercise we will:
    
    - Install and set up Git 
    
    - Reconstruct the scenario of the previous schematic
    
    - Create a GitHub account
    
    - Upload our local repository to GitHub
    
    - Download (clone) a repository from GitHub to your local workspace
    
- Ready?


Exercise (install and set up Git)
========================================================

- Follow [these instructions](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git) to install Git for Windows, Mac, and Linux operating systems.

- Once installed you will need to configure Git for use. Provide a user name and email address for Git to tag commits with. This element describes who made the commit.


```r
$ git config --global user.name "Your Name"
$ git config --global user.email yourname@example.com
```

- Tell Git which text editor you want to use to reply to queries Git asks of you.


```r
$ git config --global core.editor "'C:/Program Files/Notepad++/notepad++.exe' -multiInst -nosession"
```


========================================================
##Exercise (create a project and tell Git to track it)

- Create a project directory on your desktop, call it `codebase`.

- Create a text file in `codebase` named `dataproc.txt` and add 3 lines of mock code to `dataproc.txt`:
    
    - Import raw data
    
    - Processing algorithm A
    
    - Export processed data

- Set up a Git repository for this project.
    
    - Open the command line interface for your computer and change the directory to `codebase`.
    
    
    ```r
    $ cd ~\Desktop\codebase
    ```
    
    - Initialize Git for `codebase`. The response is shown after each command.
    
    
    ```r
    $ git init
    ## Initialized empty Git repository in C:/Users/Colin/Desktop/codebase/.git/
    ```


Exercise (tell Git which files to track)
========================================================

- Git doesn't automatically track versions of all the files you have in this directory. You tell it what files to track and what files to ignore. If we check the tracking status of files in `codebase` we see `dataproc.txt` is an untracked file.

    
    ```r
    $ git status
    ## On branch master
    ##
    ## Initial commit
    ##
    ## Untracked files:
    ##  (use "git add <file>..." to include in what will be committed)
    ##
    ##        dataproc.txt
    ##
    ## nothing added to commit but untracked files present (use "git add" to track)
    ```

- Tell git to track `dataproc.txt` by adding it to staging then committing this file. Provide a commit message to mark this point in the files history.

    
    ```r
    $ git add dataproc.txt
    $ git commit -m "Begin tracking this file with Git"
    ## [master (root-commit) d3c7c48] Begin tracking this file with Git
    ##  1 file changed, 5 insertions(+)
    ##  create mode 100644 dataproc.txt    
    ```

- The response from Git says the commit was successful.


Exercise (make an edit then commit the change)
========================================================

- Our mock data processing algorithm isn't performing well. Let's replace it with a different one. Remove the `Data processing algorithm A` and replace it with `Data processing algorithm B`. Don't forget to save your changes.

- Now add this version to staging and commit.
    
    
    ```r
    $ git add dataproc.txt
    $ git commit -m "Replace processing algorithm A with B"
    ## [master eaae96c] Replace processing algorithm A with B
    ##  1 file changed, 1 insertion(+), 1 deletion(-)
    ```


Exercise (create a branch and checkout to it)
========================================================

- Our data processing script is working well, however algorithm B is a bit slow and we'd like to test a differnt version with improved performance. We could do this in the master branch but if others are developing the master branch we wouldn't want to disrupt this so we want to condut our testing else where. We can do this by creating a development branch on the side and if things don't work out, we can delete the branch, or never merge the development branch back in with the master.

- Create the development branch `test_algorithm_c`. Does this automatically transfer us into this new branch?

    
    ```r
    $ git branch test_algorithm_c
    $ git branch
    ## * master
    ##  test_algorithm_c    
    ```

- Nope! We are still in the master branch as indicated by the asterix next to master. Let's checkout to `test_algorithm_c` and develop our idea.

    
    ```r
    $ git checkout test_algorithm_c
    ## Switched to branch 'test_algorithm_c'
    ```


Exercise (return to master then edit, stage, and commit)
========================================================

- Wait we've had an epiphany! There's some new functionality we'd like to incorporate into the master branch before beginning our development of algorithm c. Check back out to master and add two lines of mock code to the end of `dataproc.txt`:

    - Create metadata

    - Export metadata

    
    ```r
    $ git checkout master
    ## Switched to branch 'master'
    ```

- Make your changes to the file and save.

- Then add this file to staging and commit the changes.


Exercise (return to master then edit, stage, and commit ... continued)
========================================================

- This time we'll pass additional arguments to the commit command to return more information about our file changes. This will open the text editor we specified in the configuration stage of our set up, along with extended commit information.
    
    
    ```r
    $ git add dataproc.txt
    $ git commit -v dataproc.txt
    ## # Please enter the commit message for your changes. Lines starting
    ## # with '#' will be ignored, and an empty message aborts the commit.
    ## # Explicit paths specified without -i or -o; assuming --only paths...
    ## # On branch master
    ## # Changes to be committed:
    ## #	modified:   dataproc.txt
    ## #
    ## "Add metadata creation and export functions""
    ## # ------------------------ >8 ------------------------
    ## # Do not touch the line above.
    ## # Everything below will be removed.
    ## diff --git a/dataproc.txt b/dataproc.txt
    ## index 2253664..bbdf70c 100644
    ## --- a/dataproc.txt
    ## +++ b/dataproc.txt
    ## @@ -2,4 +2,8 @@ Import raw data
    ## 
    ##  Processing algorithm B
    ## 
    ## -Export processed data
    ## \ No newline at end of file
    ## +Export processed data
    ## +
    ## +Create metadata
    ## +
    ## +Export metadata
    ## \ No newline at end of file
    ```

- The header of this text block provides instructions. We enter our commit message immediately above the line. Below the line we see the differences between the previous version of `dataproc.txt` and the version we are committing. We see the content of the file with minus symbols denoting lines of text being removed, and plus symbols denoting lines of text being added.

- Add the commit message, save, and close the text editor. You should recieve a similar reply as after our first commit.


Exercise (check out to the development branch and implement our changes)
========================================================

- Ok now back to the development branch! Let's work on that idea we were kicking around before. 

    
    ```r
    $ git checkout test_algorithm_c
    ## Switched to branch 'test_algorithm_c'
    ```

- Replace processing algorithm B with:

    - Processing algorithm C

- NOTE: When you open this file you will see it doesn't contain the `Create metadata` and `Export metadata` lines of code we added earlier. This is as expected. Whenever you checkout to a particular version of a file, Git changes to the corresponding version of the file in your repository.

    
    ```r
    $ git add dataproc.txt
    $ git commit -m "Replace processing algorithm B with C"
    ## [test_algorithm_c f34ce23] Replace processing algorithm B with C
    ##  1 file changed, 1 insertion(+), 1 deletion(-)
    ```


Exercise (merge branches)
========================================================

- Now we are pretty sure our new idea is worth integrating to the master branch so we merge the development branch with the master. This combines the differences between the two files.

    
    ```r
    $ git checkout master
    ## Switched to branch 'master'
    $ git merge test_algorithm_c
    ## Updating eaae96c..f34ce23
    ## Fast-forward
    ##  dataproc.txt | 2 +-
    ##  1 file changed, 1 insertion(+), 1 deletion(-)    
    ```


Exercise (revert to previous version or branch from previous version)
========================================================

- So life is great! Everything is working well until a bug infestation. We now realize it would have been best to not have merged the development and master branches at this point. We need to revert to the previous file version in the master branch. We can do this in a few ways. One is to revert to the previous version, or we could create a new master branch at the version of interest. We'll do the former.

- First we need to get the SHA1 number of the version we'd like to revert to.

    
    ```r
    $ git log
    ## commit 101b1dde3de9fe8ddd31cf3292099b5a1fd8d125
    ## Merge: 47a084b f34ce23
    ## Author: Colin Smith <colin.smith@wisc.edu>
    ## Date:   Wed Jun 21 14:23:09 2017 -0500
    ## 
    ##     Merge branch 'test_algorithm_c'
    ##
    ## commit 47a084b9d7faed57cb6cb3af5d1b52573e24c6cb
    ## Author: Colin Smith <colin.smith@wisc.edu>
    ## Date:   Wed Jun 21 14:13:20 2017 -0500
    ##
    ##     Add metadata creation and export functions
    ##
    ## commit f34ce2399215ce690117ccf672c2c1f0aa7cad00
    ## Author: Colin Smith <colin.smith@wisc.edu>
    ## Date:   Wed Jun 21 13:54:39 2017 -0500
    ## 
    ##     Replace processing algorithm B with C
    ##
    ## commit eaae96c4df3533527302175717f84f3e2a546c21
    ## Author: Colin Smith <colin.smith@wisc.edu>
    ## Date:   Wed Jun 21 12:20:30 2017 -0500
    ## 
    ##     Replace processing algorithm A with B
    ## 
    ## commit 2c44c88089bfcdaf8c090fa5c6a303ff4aaebece
    ## Author: Colin Smith <colin.smith@wisc.edu>
    ## Date:   Wed Jun 21 12:19:47 2017 -0500
    ##
    ##     Begin tracking this file with Git
    ```


Exercise (revert to previous version or branch from previous version ... continued)
========================================================

- We want the SHA1 corresponding to the commit message `Add metadata creation and export functions`. We then run a few commands to revert and commit these changes.

    
    ```r
    $ git reset --hard 47a084b9d7faed57cb6cb3af5d1b52573e24c6cb
    ## HEAD is now at 47a084b Add metadata creation and export functions    
    $ git reset --soft HEAD@{1}
    $ git commit -m "Revert to 47a084b9d7faed57cb6cb3af5d1b52573e24c6cb"    
    ## [master c42b918] Revert to 47a084b9d7faed57cb6cb3af5d1b52573e24c6cb
    ##  1 file changed, 1 insertion(+), 1 deletion(-)
    ```


Exercise (view file log graphically)
========================================================

- Did this work? Go open `dataproc.txt`, does it display the content we expect? Yep!

- Let's also look at our history with added graphical output.

    
    ```r
    $ git log --onelnie --decorate --graph --all
    ##-------------------------------------------------------------------
    * c42b918 (HEAD -> master) Revert to 47a084b9d7faed57cb6cb3af5d1b52573e24c6cb
    *   101b1dd Merge branch 'test_algorithm_c'
    |\
    | * f34ce23 (test_algorithm_c) Replace processing algorithm B with C
    * | 47a084b Add metadata creation and export functions
    |/
    * eaae96c Replace processing algorithm A with B
    * 2c44c88 Begin tracking this file with Git
    ##-------------------------------------------------------------------    
    ```

- Reading bottom to top, this output is the history of `dataproc.txt` with a graphical representation of commits (*) and branches (|/) . Our revert is the most current commit of this file.

- Now that we feel this project has developed far enough along to share with others, we decide to post it in a remote repository on GitHub!


Exercise (create a GitHub account)
========================================================

- There are other online repositories out there but GitHub is used by many in the environmental sciences community, it provides a nice graphical user interface to version control, and has several features that facilitate collaboration and development. An account is free for public repositories and charged a fee for private ones.

- [Sign up here!](https://github.com/join)


Exercise (create a repository)
========================================================

- Create a repository on your GitHub. 

    - Navigate to the repositories tab of your profile page.

    - In the upper right hand corner click green button `New` to create a new repository. 

    - Name it `codebase` after the local repository in which you've been developing `dataproc.txt`.

    - Provide a brief description of the repository.

    - DO NOT initialize this repository with a README. Doing this will create two different histories (one for the remote repository and one for the local repository). This creates a merging conflict when uniting the two.
    
    - Click the green `create repository` button.
    

Exercise (link the local and remote repositories)
========================================================

- Before we push the local repository to the remote one we need to link the two.

- Git should provide you a URL for this repository in the `<>Code` tab. Copy this. You will need to paste it to the command line in the next step.

- Return to the command line. Ensure your path is to the local repository `~\Desktop\codebase`.
- Link your local repository with the remote version then check your remote settings.

    
    ```r
    $ git remote add origin https://github.com/clnsmth/dataproc.git
    $ git remote -v
    ## origin  https://github.com/clnsmth/dataproc.git (fetch)
    ## origin  https://github.com/clnsmth/dataproc.git (push)    
    ```

- The response tells us that this URL will be used when reading and writting to the remote.


Exercise (push the local repo to the remote repo)
========================================================

- Now that we have the local and remote linked we can push the local repository to the remote one.

    
    ```r
    $ git push --all origin master
    ## Counting objects: 16, done.
    ## Delta compression using up to 4 threads.
    ## Compressing objects: 100% (11/11), done.
    ## Writing objects: 100% (16/16), 1.54 KiB | 0 bytes/s, done.
    ## Total 16 (delta 2), reused 0 (delta 0)
    ## remote: Resolving deltas: 100% (2/2), done.
    ## To https://github.com/clnsmth/dataproc.git
    ##  * [new branch]      master -> master
    ##  * [new branch]      test_algorithm_c -> test_algorithm_c
    ```

- Check that your GitHub updated (you may need to refresh the page).

- There's `dataproc.txt`! And if you look under branches, you will see all of them.


Exercise (clone a remote repository)
========================================================

- Suppose we have a contribution to make to a project. We clone their remote repository in our local space.

- First navigate your command line to the parent directory you want the remote to be imported to.

- Locate a repository on GitHub you would like to clone. [Here's a light weight one for testing the cloning operation.](https://github.com/clnsmth/github_collab)

- Click the green `Clone or download` button under the `<>Code` tab and copy the URL.

- Run the clone command at the command line.

    
    ```r
    $ git clone https://github.com/clnsmth/github_collab.git
    ## Cloning into 'github_collab'...
    ## remote: Counting objects: 14, done.
    ## remote: Compressing objects: 100% (11/11), done.
    ## remote: Total 14 (delta 4), reused 6 (delta 2), pack-reused 0
    ## Unpacking objects: 100% (14/14), done.
    ```

- There you have it! You can now begin contributing to this project!

- Now when it comes time to push your local changes up to the remote you may need to make a [pull request](https://git-scm.com/docs/git-request-pull) (if you are not an administrator of the remote repository), or you can just push it with the `git push origin master` command we used earlier.


Resources
========================================================

- Here are some excellent resources to fuel your development.

- [Git GUIs](https://git-scm.com/downloads/guis/)

- [Tips for creating commit messages](https://chris.beams.io/posts/git-commit/)

- [Cheat sheet](https://services.github.com/on-demand/downloads/github-git-cheat-sheet.pdf)

- [Git documentation](https://git-scm.com/doc)

- [Search stackoverflow with the tags "git" and "github"](https://stackoverflow.com/)



Thank you for your attention!
========================================================

- We hope this brief introduction to file versioning with Git and GitHub has inspired you to begin operating these useful tools!

- Cheers!


<div align="left">
<img src="introduction_to_file_versioning_with_git_and_github-figure\fig1_git.png" width=200>
</div>



