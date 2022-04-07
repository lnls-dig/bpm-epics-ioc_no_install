# bpm-epics-ioc_no_install
Scripts for testing [lnls-dig/bpm-epics-ioc](https://github.com/lnls-dig/bpm-epics-ioc) (which depends on [lnls-dig/halcs](https://github.com/lnls-dig/halcs)) without affecting current installations.

### Setup steps

##### 1. Clone this repo

`git clone https://github.com/lnls-dig/bpm-epics-ioc_no_install.git /tmp/bpm-epics-ioc_no_install`

##### 2. Clone and compile both _halcs_ and _bpm-epics-ioc_ desired branches

`cd /tmp/bpm-epics-ioc_no_install`<br>
`./clone_compile.sh <HALCS_BRANCH> <BPM_EPICS_IOC_BRANCH>`

### How to run BPM IOC and HALCS BPM instances
------
In `run` folder,

##### BPM IOC instance (perfoms _halcs-be-ioc_'s role):

`./bpm_epics_ioc_run.sh <CRATE_PREFIX> <BPM_IDX>` (exit by typing `exit` on IOC's shell)

##### HALCS BPM instance (performs _halcs-be_'s role):

`./halcs_run.sh <BPM_IDX>` (exit using `Ctrl + c` keybinding)
