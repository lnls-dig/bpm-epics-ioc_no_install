# bpm-epics-ioc_no_install
Scripts for testing [lnls-dig/bpm-epics-ioc](https://github.com/lnls-dig/bpm-epics-ioc) (which depends on [lnls-dig/halcs](https://github.com/lnls-dig/halcs)) without affecting current installations.

### Setup steps

##### 1. Clone this repo

`git clone https://github.com/lnls-dig/bpm-epics-ioc_no_install.git /tmp/bpm-epics-ioc_no_install`

##### 2. Clone and compile both _halcs_ and _bpm-epics-ioc_ desired branches

`cd /tmp/bpm-epics-ioc_no_install`<br>
`./clone_compile.sh <HALCS_BRANCH> <BPM_EPICS_IOC_BRANCH>`

### How to run _halcs-be_ and _halcs-be-ioc_ instances

The following scripts do:
1. Stop and mask the correspoding systemd service;
2. Run the instance as a typical process (outside systemd tree);
3. After exiting the instance, unmask and restart the correspoding systemd service.

##### _halcs-be-ioc_ (BPM IOC) instance

`./bpm_epics_ioc_run.sh <CRATE_PREFIX> <BPM_IDX>`
Exit by typing `exit` on IOC's shell.

##### _halcs-be_ (HALCS BPM) instance

`./halcs_run.sh <BPM_IDX>`
Exit using `Ctrl + c` keybinding.
