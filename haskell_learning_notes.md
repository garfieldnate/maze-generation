# Haskell Learning Notes

- Pattern matching exhaustiveness is not checked at compile-time. That seems bonkers, for a language with such a strong type system. I think we can do something about turning on warnings for this and then turning all warnings into errors.

- /= means "not equal"; I thought it meant "divided by equals" from reading it naively!

- From Simon Peyton-Jones:

> I’d like a better module system. Specifically, I want to be able to ship a Haskell package P to someone else, saying “P needs to import interfaces I and J from somewhere: you provide them, and it will offer interface K.” Haskell has no formal way to say this.

That's quite a drawback! No collections interfaces, then?

- _Haskell without the Theory_, fantastic name, just the setup chapter delivers already! https://www.vacationlabs.com/haskell/

* HIE is telling me that `openFile` doesn't exist, even though my file compiles and runs just fine... https://github.com/haskell/haskell-ide-engine/issues/1100

* Brittany doesn't organize imports... but it will soon! https://github.com/lspitzner/brittany/pull/292

> `type FilePath = String`, and all file-oriented functions operate on this type alias, e.g. readFile/writeFile

I find that one pretty shameful, honestly. It's strange, I had expected a language built around the idea of abstraction and type-driven programming to employ those principles extensively in the standard library. Path should be its own object! Rust uses `From<Path>` everywhere, which is really cool.

The basic IO functions like `read` throwing exceptions is also weird to me; maybe it's historical baggage from before they figured out the IO monad? The community knows that you should always use `Text.Read`'s `readMaybe` instead; `read` should be marked deprecated and warnings should be generated for its usage.

- if you get `cannot satisfy -package-id <project name>`, close VS Code, run `stack build`, and restart VS Code. If that doesn't work, adding a YAML file should fix it: https://github.com/haskell/haskell-ide-engine/issues/1616

- really wish that datatypes with named fields didn't still require positional arguments
