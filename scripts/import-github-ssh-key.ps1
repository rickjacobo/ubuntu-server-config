param (
    [parameter(mandatory=$true,position=1)]
    $GithubUser
)
(Invoke-WebRequest https://github.com/$GithubUser.keys).content | sudo tee ~/.ssh/authorized_keys