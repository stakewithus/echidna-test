# echidna-test

Fuzzing smart contracts

### Install

```shell
docker pull trailofbits/eth-security-toolbox
docker run -it --rm -v $PWD:/code trailofbits/eth-security-toolbox

solc-select 0.7.6
cd /code
```

### Test

```shell
echidna-test contracts/Test.sol

# if multiple contracts inside a file
echidna-test contracts/Test.sol --contract Test

# test asserts
echidna-test contracts/Assert.sol --config config/assert.yaml
```

### Install Vyper

```shell
# install virtualenv
python3 -m pip install --user virtualenv
virtualenv -p python3 venv
source venv/bin/activate

# install vyper
pip install vyper==0.2.11
```
