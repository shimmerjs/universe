set dotenv-load
# makes justfile variables available to recipes as environment 
# variables
set export

UNIVERSE_HOME := `pwd`
HOMIE := env_var_or_default("HOMIE", `whoami`)
HOSTNAME := `hostname`
MACHINE := "homies/" + HOMIE + "/machines/" + HOSTNAME
CLUSTER_CONFIG := "homies/" + HOMIE + "/cluster.nix"

alias cb := cluster-build
alias ca := cluster-apply
alias hb := home-build
alias hs := home-switch
alias hbs := home-backup-switch

# run a command in the universe shell
sh +ARGS:
  nix-shell --run "{{ARGS}}"

home-build:
  @just _home-manager build

home-switch:
  @just _home-manager switch

home-backup-switch:
  @just _home-manager-bkp switch

cluster-build:
  @just _c build

cluster-apply:
  @just _c apply

# decrypts files with git-crypt
unlock:
  just sh "hack/unlock.sh"

clean:
  rm -rf "$DISTDIR" "$RESULTDIR"

gen-homie-cfg:
  echo "{\n\tuniverse = \"{{UNIVERSE_HOME}}\";\n}" > homie.nix

_home-manager goal:
  just sh "home-manager -f $MACHINE/home.nix {{goal}}"

_home-manager-bkp goal:
  just sh "home-manager -b backup -f $MACHINE/home.nix {{goal}}"

_c +ARGS="":
  just sh "colmena -f $CLUSTER_CONFIG {{ARGS}}"