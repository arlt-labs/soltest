# soltest

## Get the source code

```
git clone git@github.com:aarlt/soltest.git
```

## Prerequisites

### Ubuntu

```
sudo apt install build-essential cmake qtbase5-dev qtdeclarative5-dev libpoco-dev libboost-all-dev libleveldb-dev
```

### MacOS

To do.

## Build

After checking out the `soltest` repository.

```
cd soltest
mkdir build
cd build
cmake ..
make
```

The build-process may take up to 30 minutes. This may become faster, if you run `make -jX`, where `X` is the number of 
available cores.

To only build `soltest`, set `cmake` option `TOOLS=off`, this can be done with `cmake .. -DTOOLS=off`. 

## License

[![License](https://img.shields.io/github/license/aarlt/soltest.svg)](LICENSE.txt)

All contributions are made under the [GNU General Public License v3](https://www.gnu.org/licenses/gpl-3.0.en.html). See [LICENSE](LICENSE.txt).
