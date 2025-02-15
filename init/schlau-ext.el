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

(defconst stackage    "cd %G && stack build --copy-bins && stack test")
(defconst hackage     "cd %G && cabal build --enable-tests && cabal test")

;; for the website project, problem with building warp FIX
(defconst hackage-fix "cd %G && cabal build --constraint='zlib -pkg-config' --enable-tests && cabal test")

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
       (eval `'((haskell-mode          . ,hackage-fix)))
       (eval `'((haskell-cabal-mode    . ,hackage-fix)))

       ;; build the yaml files the old way
       (eval `'((yaml-mode             . ,stackage)))
       
       ;; compile rubygem
       (eval `'((ruby-mode . ,rubymake)))

       ;; compile Elixir
       (eval `'((elixir-mode . ,elixirrel)))

       ;; compile Java using Maven (main class must be specified in the .pom!!!)
       (eval `'((java-mode    . ,javamake)))

       ;; compile Kotlin using Gradle
       (eval `'((kotlin-mode  . ,kotlinmake)))

       ;; Python building and testing
       (eval `'((python-mode  . ,pythonrun)))

       ;; LaTeX to PDF generation (NO WORKIE)
       (eval `'((LaTeX-mode   . ,patentex)))
       (eval `'((cdlatex-mode . ,patentex)))
       ))

(global-set-key [f5] 'schlau-compile-compile)
(global-set-key [f6] 'schlau-compile-query)
(global-set-key [C-f6] 'kill-compilation)

;; Makes sense to stick this here. :D
(setq compilation-scroll-output t)

(provide 'schlau-ext)
