[![Build Status](https://travis-ci.org/Iowa-Flood-Center/asynch.svg?branch=master)](https://travis-ci.org/Iowa-Flood-Center/asynch)

# ASYNCH

A numerical library for solving differential equations with a tree structure. Emphasis is given to hillslope-link river basin models.


## Requirements

### Fedora

- autoconf
- automake
- openmpi-devel
- openblas
- openblas-devel
- hdf5-devel
- libpq-devel
- zlib
- gfortran
- gcc

Run this command after installing the dependencies, this will create system links of all the binaries of openmpi inside the `/usr/bin/ `directory so the system can detect them: 
```shell
sudo ln -s /usr/lib64/openmpi/bin/* /usr/bin/
```

### Ubuntu

- autoconf
- automake
- gcc
- make
- openmpi-bin
- libopenmpi-dev
- zlib1g-dev
- hdf5-tools
- libhdf5-dev
- libhdf5-openmpi-dev
- libhdf5-cpp-103
- libpq-dev
- libopenblas64-0-openmp
- libopenblas64-0-openmp-dev
- libopenblas64-openmp-dev
- libopenblas-dev


## Compiling

Please run the following commnads to compile asynch:

This will generate all the `configure` files and the `makefiles`.
```shell
autoreconf --install
cd build
../configure CFLAGS="-O3 -DNDEBUG -Wno-format-security"
make
```

## Running Example

If everything when correctly, go to the `examples/` directory and execute the following command:
```shell
mpirun -n 4 ../build/src/asynch clearcreek.gbl
```

The output should be the following:

```shell
Computations complete. Total time for calculations: 1.320425

Results written to file clearcreek.h5.
Peakflows written to file clearcreek.pea.
```
 Inside the `clearcreek.pea` file, you should see the beginning exactly like this:
 
```shell
6359
254

```



## Documentation

The documentation is available [here](http://asynch.readthedocs.io/). Thank you to the people running Read the Docs for such an excellent service.

The source for the documentation is in the `docs` folder. Here are the instructions to built and read it locally. The documentation is built with [Doxygen](http://www.doxygen.org/) and [Sphinx](http://www.sphinx-doc.org). The sphinx template is from [ReadtheDocs](https://docs.readthedocs.io). [Breathe](https://breathe.readthedocs.io) provides a bridge between the Sphinx and Doxygen documentation systems.

    pip install --user sphinx sphinx-autobuild sphinx_rtd_theme breathe recommonmark
    apt-get doxygen

    cd docs  
    doxygen api.dox
    doxygen devel.dox
    make html

The html documentation is generated in `docs/.build/html`.

## Testing

Asynch doesn't have a good test covergage at the moment but the unit test framework is in place.
