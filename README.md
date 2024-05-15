<p align="center">
    <h1 align="center">✨PSCompletions(psc) ✨</h1>
</p>

<p align="center">
    <a href="README.md">English</a> |
    <a href="README-CN.md">简体中文</a> |
    <a href="https://github.com/abgox/PSCompletions">Github</a> |
    <a href="https://gitee.com/abgox/PSCompletions">Gitee</a>
</p>

<p align="center">
    <a href="https://github.com/abgox/PSCompletions/blob/main/LICENSE">
        <img src="https://img.shields.io/github/license/abgox/PSCompletions" alt="license" />
    </a>
    <a href="https://img.shields.io/github/languages/code-size/abgox/PSCompletions.svg">
        <img src="https://img.shields.io/github/languages/code-size/abgox/PSCompletions.svg" alt="code size" />
    </a>
    <a href="https://img.shields.io/github/repo-size/abgox/PSCompletions.svg">
        <img src="https://img.shields.io/github/repo-size/abgox/PSCompletions.svg" alt="repo size" />
    </a>
    <a href="https://github.com/abgox/PSCompletions">
        <img src="https://img.shields.io/badge/created-2023--8--15-blue" alt="created" />
    </a>
</p>

---

## Introduce

-   `PowerShell`: A Cross-platform PowerShell. Start it in command line by running `pwsh`.

-   `Windows PowerShell`: A PowerShell which is built-in on Windows systems. Start it in command line by running `powershell`.

---

-   A completion manager in `PowerShell` for better and simpler use completions.
    > It can also be used in `Windows PowerShell`.(Not Recommend)
-   [Manage completions together.](#available-completions-list 'Click it to view the completion list that can be added !')
-   Switch between languages(`zh-CN`,`en-US`...) freely.
-   Sort completion tab dynamically by frequency of use.

**If this project is helpful to you, please consider giving it a star ⭐.**

## How to install

1. Start `PowerShell`
2. `Install-Module PSCompletions -Scope CurrentUser`
3. `Import-Module PSCompletions`
    - `echo "Import-Module PSCompletions" >> $PROFILE`
    - So you don't have to import the module every time you open PowerShell.

## How to uninstall

1. Start `PowerShell`
2. `Uninstall-Module PSCompletions`

## How to use(e.g. `git`)

### [Available Completions](#available-completions-list 'All completions that can be added at present. More completions are adding!')

-   If it doesn't include the completion you want, you can [submit an issue](https://github.com/abgox/PSCompletions/issues 'Click to submit an issue') and I will consider adding it.

1. `psc add git`
2. Then you can type `git` and press `Space` `Tab` to get command completion.
3. For more commands on `psc`, you can learn by typing `psc` and then pressing `Space` `Tab`.

## Demo

![demo](https://abgop.netlify.app/pscompletions/demo.gif)

## Tips

### About completion update

-   When the module is imported after `PowerShell` is opened, `PSCompletions` will start a background job to check for the completion status of the remote repository.

-   After getting the update, `PSCompletions` will show the latest status of the completions in the next time.

### About completion menu

-   The module's completion menu provided by the module is based on [PS-GuiCompletion](https://github.com/nightroman/PS-GuiCompletion) realization idea, thanks!
-   It can only be used in PowerShell(pwsh) under Windows.
-   When you use it, you can select previous or next option in the following keys.

    | select previous option | select next option |
    | :--------------------: | :----------------: |
    |           Up           |        Down        |
    |          Left          |       Right        |
    |          Tab           |    Shift + Tab     |
    |         Space          |   Shift + Space    |
    |        Ctrl + u        |      Ctrl + d      |
    |        Ctrl + p        |      Ctrl + n      |

-   All configurations of it, you can trigger completion by running `psc menu`, then learn about them by completion tip.

### About special symbols

-   😄🤔😎 : If there are multiple, you can choose the effect of one of them.
    -   😄 : It means that after you choose it, you can press `Space` and `Tab` key to continue to get command completions.(Normal or optional completions)
        -   It can be customized by running `psc menu symbol SpaceTab <symbol>`
    -   🤔 : It means that after you choose it (option completion), you can press `Space` and `Tab` key to continue to get option completions. (e.g. `--verbose`)
        -   It can be customized by running `psc menu symbol OptionTab <symbol>`
    -   😎 : It means that after you choose it (option completion), you can enter a string, then press `Space` and `Tab` key to continue to get the rest of option completions.
        -   If the string has Spaces, Please use "" or '' to wrap it. e.g. 'test content'
        -   If there is also 😄, it means that there are some strings to complete, you can press `Space` and `Tab` key to continue to get command completions without entering a string.
        -   It can be customized by running `psc menu symbol WriteSpaceTab <symbol>`
    -   Completion of generic options can also be triggered if there is one or more generic option completion.
    -   All complements can be triggered by pressing the `Tab` key after entering a part.
    -   If you don't need or want to see these symbols, you can hide them by replacing them with the empty string.
        -   e.g. `psc menu symbol SpaceTab ""`

### About path completion

-   Please type `./` or `.\` and press `Tab` to get path completion for the **subdirectory** or **file**.
-   Please type `/` or `\` and press `Tab` to get path completion for the **sibling directory**.

## Available Completions List

|           Completions           |                                         Source                                         |
| :-----------------------------: | :------------------------------------------------------------------------------------: |
|     [psc](/completions/psc)     | [psc - PSCompletions Module](https://www.powershellgallery.com/packages/PSCompletions) |
|     [bun](/completions/bun)     |                 [Bun - JavaScript all-in-one toolkit](https://bun.sh)                  |
|   [cargo](/completions/cargo)   |             [cargo - Rust package manager](https://rustwiki.org/en/cargo)              |
|    [chfs](/completions/chfs)    |                   [chfs(CuteHttpFileServer)](http://iscute.cn/chfs)                    |
|   [choco](/completions/choco)   |             [choco(chocolatey) - Software Manager](https://chocolatey.org)             |
|   [conda](/completions/conda)   |    [conda - binary package and environment manager](https://github.com/conda/conda)    |
|    [deno](/completions/deno)    |               [deno - A secure runtime for JS and TS](https://deno.com)                |
|  [docker](/completions/docker)  |          [docker - Container Application Development](https://www.docker.com)          |
|     [git](/completions/git)     |                  [Git - Version control system](https://git-scm.com)                   |
| [kubectl](/completions/kubectl) |               [Kubernetes(k8s) command-line tool](https://kubernetes.io)               |
|     [npm](/completions/npm)     |                     [npm - package manager](https://www.npmjs.com)                     |
|     [nrm](/completions/nrm)     |               [nrm - npm registry manager](https://github.com/Pana/nrm)                |
|     [nvm](/completions/nvm)     |              [nvm - Node Version Manager](https://github.com/nvm-sh/nvm)               |
|     [pip](/completions/pip)     |              [pip - Python Package Manager](https://github.com/pypa/pip)               |
|    [pnpm](/completions/pnpm)    |                     [pnpm - Package Manager](https://www.pnpm.cn)                      |
|  [python](/completions/python)  |                    [python - command-line](https://www.python.org)                     |
|   [scoop](/completions/scoop)   |                      [Scoop - Software Manager](https://scoop.sh)                      |
|   [volta](/completions/volta)   |             [volta - Accessible JavaScript Tool Manager](https://volta.sh)             |
|  [winget](/completions/winget)  |      [WinGet - Windows package manager](https://github.com/microsoft/winget-cli)       |
|     [wsl](/completions/wsl)     |         [WSL - Windows Subsystem for Linux](https://github.com/microsoft/WSL)          |
|      [wt](/completions/wt)      |         [windows terminal command line](https://github.com/microsoft/terminal)         |
|    [yarn](/completions/yarn)    |             [yarn - package manager](https://classic.yarnpkg.com/lang/en)              |
|               ...               |                                          ...                                           |
