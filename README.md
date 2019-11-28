

 ```
 git submodule update --init --recursive
 ```

MACOS install
 ```
CFLAGS='-stdlib=libc++' python setup.py build_ext --inplace
CFLAGS='-stdlib=libc++' python setup.py develop
 ```