Run in Cygwin terminal under this file path /generator_release_v1:

Usage 1 (Parsing and Unparsing): 

```python
printf <PGML_Code> | dune exec _build/default/unparser.exe
```

Usage 2 (Generation):

```python
dune exec _build/default/unparser.exe 2230026100
```
More details in doc/Generator Usage.pdf
