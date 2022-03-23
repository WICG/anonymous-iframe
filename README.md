Anonymous iframe
================

**Anonymous iframe** gives developers a way to load documents in third party
iframe using a new and ephemeral context. In return, the
[Cross-Origin-Embedder-Policy](https://wicg.github.io/cross-origin-embedder-policy/)
(COEP) embedding rules can be lifted.

This way, developers using COEP can now embed third party iframes that do not.

Documents
=========
- [The problem](https://arthursonzogni.github.io/anonymous-iframe/#problem)
- [Explainer](https://arthursonzogni.github.io/anonymous-iframe/#explainer)
- [Alternatives considered](https://arthursonzogni.github.io/anonymous-iframe/#alternatives)
- [Tests](https://arthursonzogni.github.io/anonymous-iframe/#tests)
- [Specification](https://arthursonzogni.github.io/anonymous-iframe/#specification)
- [Security considerations](https://arthursonzogni.github.io/anonymous-iframe/#security)
- [Privacy considerations](https://arthursonzogni.github.io/anonymous-iframe/#privacy)
- [Self-Review Questionnaire: Security and Privacy](https://arthursonzogni.github.io/anonymous-iframe/#questionnaire)

Contribute
==========

You are welcome to [contribute](CONTRIBUTING.md)!
- [Issues](https://github.com/ArthurSonzogni/anonymous-iframe/issues)
- [Discussion](https://github.com/ArthurSonzogni/anonymous-iframe/discussions)
- [Pull requests](https://github.com/ArthurSonzogni/anonymous-iframe/pulls)

Stakeholder status / feedback
=============================

Chrome
------

Under development: [Feature status](https://chromestatus.com/feature/5729461725036544)

The WIP implementation can be tried, using the command line flags:
```bash
google-chrome-beta --enable-blink-features=AnonymousIframe --enable-features=PartitionedCookies
```

Implementation tracker: [https://crbug.com/1226469](https://crbug.com/1226469)

Fill [bugs](https://bugs.chromium.org/p/chromium/issues/entry), under the
`Blink>SecurityFeature>AnonymousIframe` component.

Firefox
-------

- Request for position: TODO.

Safari:
-------

- Request for position: TODO.

W3C Technical Architecture Group:
---------------------------------
- [design review](https://github.com/w3ctag/design-reviews/issues/639)
