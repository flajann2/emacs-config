;; TODO: Remove this once release is accepted.
(add-to-list 'load-path "~/.config/emacs-config/schlau-compile/")

(use-package compile :ensure t)
(require 'schlau-compile)

(defconst cppclang "if [ ! -d %G/build ]; then mkdir %G/build; fi ; cd %G/build && cmake -DCMAKE_C_COMPILER=clang -DCMAKE_CXX_COMPILER=clang++ -GNinja -DCMAKE_EXPORT_COMPILE_COMMANDS=ON -DENABLE_CODE_ANALYSIS=ON .. && ninja -k3 -j8")
;;; (defconst cppninja "if [ ! -d %G/build ]; then mkdir %G/build; fi ; cd %G/build && echo \"Entering directory \'%G/build\'\" && cmake -GNinja -DCMAKE_EXPORT_COMPILE_COMMANDS=ON -DENABLE_CODE_ANALYSIS=ON .. && ninja -k3 -j8")
;;; (defconst cppmake  "if [ ! -d %G/build ]; then mkdir %G/build; fi ; cd %G/build && echo \"Entering directory \'%G/build\'\" && cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=ON -DENABLE_CODE_ANALYSIS=ON .. && make")
(defconst rustmake "export RUST_BACKTRACE=full && ~/.cargo/bin/cargo build && ~/.cargo/bin/cargo test -- --nocapture")
(defconst rubymake "rake build")
(defconst gomake  "export GOPATH=/development/go && go install ./... && go test -v && go vet")
(defconst elixirmake "cd %G && LC_ALL=en_GB.UTF-8 mix escript.build")
(defconst elixirrel  "cd %G && LC_ALL=en_GB.UTF-8 mix escript.build && mix release --override")
(defconst javamake "cd %G && ./mvnw package exec:java && ./mvnw test")
(defconst kotlinmake "cd %G && ./mvnw package exec:java && ./mvnw test")
(defconst pythonrun "cd %G && pipenv install -e . && pipenv run python3 setup.py build && pipenv run python3 -m unittest discover -s tests")
(defconst patentex "cd %G && ./compile.fish")

(defconst stackage "cd %G && stack build --copy-bins && stack test")
(defconst hackage "cd %G && cabal build --enable-tests && cabal test")

(defconst ocaml-make "cd %G && dune build")

;; npmrun requires that there is a package.json file to
;; coordinate things. This will run the build and start the
;; start the application.
;;
;; example of what to add to your package.json file:
;;   "scripts": {
;;     "build": "tsc",
;;     "start": "node build/server.js"
;;   }
;; TODO: launch npm start seperately.

(defconst npmrun-b "cd %G && npm run build")
(defconst npmrun   "cd %G && npm run build && npm run start")
(defconst npmrun-i "cd %G && npm run build && npm run interactive")

;; elm compile.
(defconst elm-make "cd %G && elm make elm-src/Main.elm --output=elm-out/elm.js && elm reactor")
(defconst elm-npm  "cd %G && npm run build && elm reactor")
(defconst elm-npmi "cd %G && npm run build && npm run interactive")

;; LaTeX to PDF
(defconst latex-file "cd %G && mkdir -p output pdf && pdflatex -output-directory=./output %F && cp ./output/%n.pdf ./pdf")

(setq schlau-compile-alist
      (append
       ;; compile Go
       (eval `'((go-mode . ,gomake)))

       ;; compile C++
       (eval `'((cmake-mode  . ,cppclang)))
       (eval `'((c++-mode    . ,cppclang)))
       (eval `'((c++-ts-mode . ,cppclang)))

       ;; compile Rust
       (eval `'((rust-mode   . ,rustmake)))
       (eval `'((toml-mode   . ,rustmake)))

       ;; build Haskell -- now will convert to cabal
       (eval `'((haskell-mode          . ,hackage)))
       (eval `'((haskell-cabal-mode    . ,hackage)))

       ;; build the yaml files the old way
       (eval `'((yaml-mode             . ,stackage)))
       
       ;; compile rubygem
       (eval `'((ruby-mode       . ,rubymake)))

       ;; compile Elixir
       (eval `'((elixir-mode     . ,elixirrel)))

       ;; compile Java using Maven (main class must be specified in the .pom!!!)
       (eval `'((java-mode       . ,javamake)))

       ;; compile Kotlin using Gradle
       (eval `'((kotlin-mode     . ,kotlinmake)))

       ;; Python building and testing
       (eval `'((python-mode     . ,pythonrun)))

       ;; LaTeX to PDF generation (NO WORKIE)
       ;;; (eval `'((LaTeX-mode      . ,patentex)))
       ;;; (eval `'((cdlatex-mode    . ,patentex)))

       ;; TypeScript
       (eval `'((typescript-mode . ,npmrun-b)))
       (eval `'((json-mode       . ,npmrun-i)))

       ;; PureScript
       (eval `'((purescript-mode . ,npmrun)))

       ;; Elm (experimental -- elm is for the frontend. FIX)
       (eval `'((elm-mode        . ,elm-npmi)))

       ;; LaTeX 
       (eval `'((latex-mode      . ,latex-file)))

       ;; OCaml
       (eval `'((dune-mode        . ,ocaml-make)))
       (eval `'((tuareg-mode      . ,ocaml-make)))
       (eval `'((tuareg-opam-mode . ,ocaml-make)))
       ))

(global-set-key [f5]   'schlau-compile-compile)
(global-set-key [f6]   'schlau-compile-query)
(global-set-key [C-f6] 'kill-compilation)

;; Makes sense to stick this here. :D
(setq compilation-scroll-output t)

(provide 'schlau-ext)
