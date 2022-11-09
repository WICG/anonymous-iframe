# Mozilla sandbox proposal

In [mozilla/standards-positions/issues/628](https://github.com/mozilla/standards-positions/issues/628#issuecomment-1202300757), @smaug---- proposed activating anonymous iframe using sandbox flags. The feature could be broken into 3 separate flags:
- Partition network/storage/cookies using a nonce, derived from the top-level document.
- Force 'no-opener' in popups.
- Disable autofill

The 3 sandbox flags could be for instance:
  - allow-same-origin-partitionned
  - allow-popups-no-opener
  - disallow-autofill

We believe this is less desirable compared to the solution we implemented using an iframe property. It has poorer developer ergonomics, there are tricky points of integration with sandbox flags, it introduces the first disallow-xxx flag and it is harder to explain to developers what they need to do to deploy COEP on their website. Overall, we think that this is less desirable compared to introducing a new iframe property, as outlined in more details below.

## Ergonomic for developers?

Main scenario: Developers want to start using COEP. One of their third party iframe do not have deployed COEP yet, so they want to use anonymous iframe.

Currently, with the new attribute, they have to:

```html
<iframe anonymous>
```
With sandbox flags, the closest equivalent is:

```html
<iframe sandbox="
  allow-downloads
  allow-forms
  allow-modals
  allow-orientation-lock
  allow-pointer-lock
  allow-popups
  allow-presentation
  allow-scripts
  allow-top-navigation
  allow-same-origin-partitionned
  allow-popups-no-opener
  disallow-autofill
">
```

There was worries developers would find it annoying.

It is also difficult to explain to developers this combinaison of sandbox flags represents "anonymous iframe", and allow loading third party iframes without COEP inside COEP context.

### Origin-Trial survey

@smaug---- suggested during TPAC getting data to understand how developers plan to use it. The hypothesis was that it was not an issue, because most developers would use it with sandbox.

During the origin trial, we added the question:
```
> Do you need to use anonymous iframes with or without a sandbox?”
```
The survey responses were:
Response                      | count
------------------------------|------
Always with sandbox           | 3
Both with and without sandbox | 4
Always without sandbox        | 0

At least 50% of responders will have cases where they will use anonymous iframes without sandbox flags, and will need to rely on the more complex setup outlined above.

## Supporting sandboxed iframe inside anonymous iframe.

The goal of anonymous iframe is to allow embedding arbitrary third party iframe safely, even if they don't use COEP, without breaking the document.

With sandbox flags: children can lose their `allow-same-origin-partitionned` flag. This is problematic, because the navigation would be done with credentials, without using the nonced-partition.

We can't allow loading this document without COEP.

This makes anonymous iframe unusable for some document, the ones using sandboxed iframe.

## Disabling autofill

Currently, Chrome does not allow developers to block autofill:
See: https://crbug.com/914451

Adding the `disable-autofill` to the the web-platform would give a trivial way to bypass it.

With a single `anonymous` attribute, the 3 features are tied together, and can only be set inside iframe. It prevents abuse.

## disallow-XXX syntax?

It would be the first sandbox flag using the `disallow-xxx` syntax. It is possible, but consistent with all the other using `allow-xxx` syntax.

It also means fully sandboxed iframe: `<iframe sandbox>` doesn’t correspond anymore to a fully sandboxed iframe, because they can be further sandboxed by adding `disallow-autofill`.

One could argue that the autofill behavior is not specified and we can omit this flag from the anonymous iframe proposal. It can be a note asking the embedder to disable autofill when it matters for security.

## Popups with partitioned storage

The flag `allow-same-origin-partitioned` sandbox flag can be inherited toward popups.

This is rather problematic, because the nonce used is derived from the top-level document. With popups, there are several top-level documents. It means the opener and the openee will start using a different partition, while being same-origin. It is not clear how this must behave in this kind of scenario.

With the `anonymous` attribute, popups are opened with `no-opener` and the popup do not inherit the anonymous bit. They can't interact with each other.

## Top-level partitioned document

Anonymous iframe was designed to be used in iframe. Sandbox flags can also be inherited into top-level document. We don't see this as a strong blocker, but this make it slighly more complex to implement. The nonce is derived from the top-level document, here we are in the process of creating it.

## Sandbox flags from the CSP response

Sandbox flags can be set using the iframe attribute, but they can also be set from the HTTP response, via a CSP header.

It is too late to enforce `allow-same-origin-partitioned`, because a credentialled request has already been mode. This flag must be ignored in CSP. This is similar to a few other sandbox flags.
