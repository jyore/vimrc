# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="clean"

plugins=(git)

source $ZSH/oh-my-zsh.sh

# =================================================================
# Docker Development Functions
# =================================================================

# Terraform
TF_VERSION="latest"

tfselect() {
  export TF_VERSION="$1"
}

terraform() {
  docker run --rm -it -v $PWD:/data -w /data -v /var/run/docker.sock:/var/run/docker.sock -v /var/lib/docker:/var/lib/docker hashicorp/terraform:$TF_VERSION "$@"
}


# AWS CLI

AWS_PROFILE=""

awsprofile() {
  export AWS_PROFILE="$1"
}

aws() {
  docker run --rm -it -v ~/.aws:/root/.aws -v $(pwd):/aws -e AWS_PROFILE amazon/aws-cli "$@"
}
