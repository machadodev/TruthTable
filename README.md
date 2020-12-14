# Truth Table Generator

[![forthebadge made-with-python](https://forthebadge.com/images/badges/works-on-my-machine.svg)](#)

*Aline Lima*<br>
*Hiaggo Bezerra*<br>
*Leonardo Machado*<br>
*Computer Science Graduation*<br>
*Federal Fluminense University*<br>
*Niteroi, 2020*

This project was developed for the discipline of Programming Language from **Federal Fluminense University - UFF**.
## Stack
  * **Haskell** - Functional programming language
  * **Visual Code** - MS text editor
  * **Stack** - build tool
  * **Polish Notation**
  * **Propositional Logic**
## App
It generates a truth table with subformulas given a prefixed formula in polish notation.

If you want to evaluate **(a^b)->(a ν ¬c)**, you'll have to parse it to polish notation, which will lead to a formula like this: **CKabAaNc**

[If you want to know how to convert from First Order Logic to Polish Notation, click here!](https://en.wikipedia.org/wiki/Polish_notation)

Example of input: **CKabAaNc**
Output:
<p align="center">
  <img src="/doc/running.png" />
</p>

It will give you the symbols, subformulas and if it's tautology, satisfiable or contradiction.

### Installation

This app requires [Stack](https://docs.haskellstack.org/en/stable/README/) to run.

How to install:

For Windows Environment
```sh
$ https://get.haskellstack.org/stable/windows-x86_64-installer.exe
$ Double click and install it
```

For Linux Environment
```sh
$ curl -sSL https://get.haskellstack.org/ | sh
```

### Build and Run

To build the app:
```sh
$ cd app
$ stack build
```
To run the app:
```sh
$ cd app
$ stack exec TruthTableGenerator-exe
```

You can combine both commands in one line:
```sh
$ stack build && stack exec TruthTableGenerator-exe
```

### Test Cases
#### Change "let formula" from app/main.hs with one of the values below:

* **CNaKbc**
* **KNAbcKbc**
* **CKabAaNc**
* **Ead**

#### OBS
* **CNaKbc** is equivalent to (~a -> (b & c))
* **KNAbcKbc** is equivalent to ¬(b ν c) Λ (b Λ c)
* **CKabAaNc** is equivalent to (a Λ b)-> (a ν ¬c)
* **Ead** is equivalent to (a <-> d)

Credits
----

[@machadodev](https://github.com/machadodev/)
[@Hiaggo](https://github.com/Hiaggo/)
[@Alines009](https://github.com/Alines009)


**Free Software, Hell Yeah!**
