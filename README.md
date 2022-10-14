# Setup
```shell
  git clone git@github.com:Eth3rnit3/kali.git
  cd ./kali

  ./kali install
```

# Lunch shell
```shell
  ./kali start
```

# Usage
```shell
./kail.sh --help

Syntax: ./kail.sh command (install|start) [-h] [-l] [-p] [-ht]
	[-h --help]: Display this help
	[-l --logfile]: Specify a filepath to save container sdout
	[-p --privilege]: Set network mode to 'host'
	[-ht --host]: Set network mode to 'host'

example :
./kail.sh install
./kail.sh start -ht -p -l ./my-logfile.log
```